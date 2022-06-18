(load "utility_with_views.ss")
(load "utility.ss")
(load "parse_with_views.ss")
(load "enum.ss")
(load "../lib/bitwise.ss")
(define tx
  (make-transcoder (utf-8-codec) (eol-style lf) (error-handling-mode raise)))

;;lists of the xml will be treated as C arrays.
(define data-structures '(struct union xidunion))

(define uint32s
  '(window pixmap cursor
	   gcontext font colormap
	   atom fontable visualid
	   drawable bool32 timestap
	   keysym keycode32 card32))

(define uint8s '(byte card8 depth))

(define int16s '(int16))

;;for turning XML tokens into valid chez scheme types.
(define (safestring s)
  (strlit->string (string-downcase s)))



(define (list->code-aux port l current-node list-type)
  (cond
   ;;the code generation was successful.
   [(null? l) #t]
   [(pair? current-node)
    (cond
     [(member (car current-node) data-structures)
      (put-string
       port
       (format
        "(define-ftype ~s\n  (~s\n    "
        (string->symbol
         (safestring
          (cadr
           (assoc
            'name
            (cdr current-node)))))
        (if (equal? (car current-node) 'xidunion)
	    'union
	    (car current-node))))
      (list->code-aux port (cdr l) (cadr l) list-type)]
     [(equal? (car current-node) 'type)
      (put-string port (format "[~s ~s]~a"
			       (string->symbol (safestring (cadr current-node)))
			       (let [(t (string->symbol
					 (safestring
					  (cadr current-node))))]
				 (cond
				  [(member t uint32s) 'unsigned-32]
				  [(member t uint8s) 'unsigned-8]))
			       (if (not (assoc 'type (list (cadr l))))
				   "))\n"
				   "\n    ")))
      (list->code-aux port (cdr l) (cadr l) list-type)]
     [(equal? (car current-node) 'typedef)
      ;;we don't need to typedef anything since all our types are
      ;;well-known before we start to generate the code
      ;;(i looked them up and put them in lists accordingly)
      ;;so we just skip the following element (an inner two-element list):
      (list->code-aux port (cdr l) (cadr l) list-type)]
     [(equal? (car current-node) 'enum)
      (let [(enum-name (safestring (cadr (assoc 'name (cdr current-node)))))]
        (put-string port
                    (format
                     "\n(define ~s (enum "
                     (string->symbol enum-name)))
        (let loop [(enuml '()) (lc (cdr l)) (idx 0)]
          (cond
           [(null? lc)
	    (put-string port (format "'(~s"
				     (car enuml)))
	    (let inner [(enuml-cp (cdr enuml)) (elem (cadr enuml))]
	      (cond
	       [(not (null? (cdr enuml-cp)))
		(put-string port (format "\n    ~s" elem))
		(inner (cdr enuml-cp) (cadr enuml-cp))]
	       [else
		(put-string port (format "\n    ~s)))" elem))
		(list->code-aux port (cdr l) (cadr l) list-type)]))]
           [(member (caar lc) data-structures)
            (loop enuml '() idx)
            (list->code-aux port (cdr l) (cadr l) list-type)]
           [(equal? (caar lc) 'item)
            (loop
             (add
              (add
               (cond
                [(equal? (caadr lc) 'value)
                 (string->number (cadadr lc))]
                [(equal? (caadr lc) 'bit)
                 (<< 1 (string->number (cadadr lc)))])
               (string->symbol
                (string-append
                 enum-name
                 "-"
                 (safestring
                  (cadr
                   (assoc
                    'name
                    (cdar lc)))))))
              enuml)
             (cddr lc)
             idx)]
           [else
            (loop enuml (cdr lc) (+ 1 idx))])))]
     [(equal? (car current-node) 'field)
      (put-string
       port
       (format
        "[~s ~s]~a"
        (cond
         [(assoc 'enum (cdr current-node))
          (string->symbol
           (string-append
            (safestring
             (cadr
              (assoc
               'name
               (cdr current-node))))
            "-enum"))]
         [(assoc 'mask (cdr current-node))
          (string->symbol
           (string-append
            (safestring
             (cadr
              (assoc
               'name
               (cdr current-node))))
            "-mask"))]
         [else
          (string->symbol
           (safestring
            (cadr
             (assoc
              'name
              (cdr current-node)))))])
        (string->symbol
         (strlit->string
          (let
              [(t (safestring (cadr (assoc 'type (cdr current-node)))))]
            (cond
             [(member (string->symbol t) uint32s) "unsigned-32"]
             [(member (string->symbol t) uint8s) "unsigned-8"]
             [(equal? (string->symbol t) 'bool) "boolean"]
             [(equal? (string->symbol t) 'card16) "unsigned-16"]
	     [(equal? (string->symbol t) 'int16) "integer-16"]
	     [else t]))))
        (if (or (null? (cdr l)) (not (member (caadr l) '(field pad))))
	    "))\n"
	    "\n    ")))
      (list->code-aux port (cdr l) (cadr l) list-type)]
     [(equal? (car current-node) 'pad)
      (put-string port (format "[pad (array ~a unsigned-8)]))\n"
			       (safestring (cadadr current-node))))
      (list->code-aux port (cdr l) (cadr l) list-type)]
     [(equal? (car current-node) 'list)
      (list->code-aux
       port
       (cdr l)
       (cadr l)
       (string->symbol
        (let [(t (safestring (cadr (assoc 'type (cdr current-node)))))]
          (cond
           [(member (string->symbol t) uint32s) "unsigned-32"]
           [(member (string->symbol t) uint8s) "unsigned-8"]
           [else (string->symbol t)]))))]
     [(equal? (car current-node) 'fieldref)
      (put-string
       port
       (format
        "[~s ~s]~a"
        (string->symbol (cadr current-node))
        list-type
        (if (null? (cdr l)) "" "\n")))
      (list->code-aux port (cdr l) (cadr l) list-type)]
     [(equal? (car current-node) 'xidtype)
      (put-string port (format "(define-ftype ~s unsigned-32)\n"
			       (string->symbol
				(safestring
				 (cadr
				  (assoc
				   'name
				   (cdr current-node)))))))
      (list->code-aux port (cdr l) (cadr l) list-type)]
     [(pair? (car current-node))
      (list->code-aux port l (car current-node) list-type)])]
   [else
    #f]))

(define (list->code l port)
  (put-string port "(load \"enum.ss\")\n")
  (list->code-aux port l l ""))

;;code to be executed, for tests
(define filename
  (open-file-output-port "xproto.ss" (file-options no-fail) (buffer-mode block) tx))

(define xml
  (sv-remove-xcb-header
   (sv-remove-xml-prolog
    (sv-remove-cdata
     (sv-remove-comments
      (sv-remove-newlines
       (file->string-view "../xml/xproto.xml")))))))

(define l (sv-xml->list xml))

(pretty-print l)

(list->code l filename)

(close-port filename)
(exit)
