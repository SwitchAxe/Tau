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

(define (list->code-aux port l current-node request-name needs-reply?)
  (printf "current node = ~s\n" current-node)
  (cond
   ;;the code generation was successful.
   [(null? l) #t]
   [(pair? current-node)
    (cond
     [(member (car current-node) (add 'switch data-structures))
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
        (let [(dast (car current-node))]
	  (cond
	   [(equal? dast 'xidunion) 'union]
	   [(equal? dast 'switch) 'struct]
	   [else dast]))))
      (list->code-aux port (cdr l) (cadr l) "" #f)]
     [(equal? (car current-node) 'request)
      (if (equal? (caadr l) 'reply)
	  (list->code-aux port (cdr l) (cadr l) (cadr (assoc 'name (cdr current-node))) #t)
	  (let [(opcode (assoc 'opcode (cdr current-node)))
		(reqname (assoc 'name (cdr current-node)))]
	    (when opcode
	      (put-string port (format "(define ~s-opcode ~s)\n"
				       (string->symbol (safestring (cadr reqname)))
				       (string->number (safestring (cadr opcode))))))
	    (put-string port (format "(define-ftype ~s\n  (struct\n    "
				     (string->symbol (safestring (cadr reqname)))))
	    (list->code-aux port (cdr l) (cadr l) (cadr reqname) #f)))]
     [(equal? (car current-node) 'reply)
      (list->code-aux port (cdr l) (cadr l) request-name #t)]
     [needs-reply? ;;reply to a request struct
      (put-string port (format "(define-ftype ~s-reply\n  (struct\n    "
			       (string->symbol (safestring request-name))))
      (list->code-aux port (cdr l) (cadr l) "" #f)]
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
      (list->code-aux port (cdr l) (cadr l) request-name needs-reply?)]
     [(equal? (car current-node) 'event)
      (put-string port (format "[~s ~s]~a"
			  (string->symbol
			   (safestring
			    (cadr
			     (assoc 'name (cdr current-node)))))
			  (string->number
			   (safestring
			    (cadr
			     (assoc 'number (cdr current-node)))))
			  (if (or (null? (cdr l)) (member (cadr l) (add 'enum data-structures)))
			      "\n"
			      "\n    ")))
      (list->code-aux port (cdr l) (cadr l) request-name needs-reply?)]
     [(equal? (car current-node) 'typedef)
      ;;we don't need to typedef anything since all our types are
      ;;well-known before we start to generate the code
      ;;(i looked them up and put them in lists accordingly)
      ;;so we just skip the following element (an inner two-element list):
      (list->code-aux port (cdr l) (cadr l) "" #f)]
     [(equal? (car current-node) 'enum)
      (let [(enum-name (safestring (cadr (assoc 'name (cdr current-node)))))]
        (put-string port
                    (format
                     "\n(define ~s (enum "
                     (string->symbol enum-name)))
        (let loop [(enuml '()) (lc (cdr l)) (idx 0)]
          (cond
           [(member (caar lc) (append data-structures '(switch enum request reply)))
            (put-string port (format "'(~s"
				     (car enuml)))
	    (if (= (length enuml) 1)
		(begin
		  (put-string port ")))\n")
		  (list->code-aux port lc (car lc) "" #f))
		(let inner [(enuml-cp (cdr enuml)) (elem (cadr enuml))]
		  (cond
		   [(null? (cdr enuml-cp))
		    (put-string port (format "\n    ~s)))\n" (car enuml-cp)))
		    (list->code-aux port lc (car lc) "" #f)]
		   [(null? enuml-cp)
		    (put-string port (format "\n    ~s)))\n" elem))
		    (list->code-aux port lc (car lc) "" #f)]
		   [else
		    (put-string port (format "\n    ~s" elem))
		    (inner (cdr enuml-cp) (if (null? (cdr enuml-cp))
					      (car enuml-cp)
					      (cadr enuml-cp)))])))]
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
     [(member (car current-node) '(field exprfield))
      (if (< (length (cdr current-node)) 2)
	  (list->code-aux port (cdr l) (cadr l) request-name needs-reply?)
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
		  (assoc 'name (cdr current-node))))
		"-enum"))]
             [(assoc 'mask (cdr current-node))
              (string->symbol
               (string-append
		(safestring
		 (cadr
		  (assoc 'name (cdr current-node))))
		"-mask"))]
             [else
              (string->symbol
               (safestring
		(cadr
		 (assoc 'name (cdr current-node)))))])
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
            (if (or (null? (cdr l)) (not (member (caadr l)
						 '(bitcase enumref field pad error))))
		"))\n"
		"\n    "))))
      (list->code-aux port (cdr l) (cadr l) request-name needs-reply?)]
     [(equal? (car current-node) 'enumref)
      (put-string port (format "[~s ~s]~a"
			       (string->symbol (caddr current-node))
			       'unsigned-32
			       (if (or (null? (cdr l)) (not (member (caadr l)
								    '(bitcase enumref field pad error))))
				   "))\n"
				   "\n    ")))
      (list->code-aux port (cdr l) (cadr l) request-name needs-reply?)]
     [(equal? (car current-node) 'pad)
      (put-string port (format "[pad (array ~a unsigned-8)]~a"
			       (safestring (cadadr current-node))
			       (if (or (null? (cdr l)) (not (member (caadr l)
								    '(bitcase enumref field pad error))))
				   "))\n"
				   "\n    ")))
      (list->code-aux port (cdr l) (cadr l) request-name needs-reply?)]
     [(equal? (car current-node) 'error)
      (let [(errt (assoc 'type (cdr current-node)))]
	(put-string port (format "[~s-err unsigned-32]~a"
				 (string->symbol (safestring (cadr errt)))
				 (if (or (null? (cdr l)) (not (member (caadr l)
								      '(bitcase enumreffield pad error))))
				     "))\n"
				     "\n    ")))
	(list->code-aux port (cdr l) (cadr l) request-name needs-reply?))]
     [(member (car current-node)
	      '(list op fieldref bitcase doc brief description see example)) ;;just skip it
      (if (equal? (caadr l) 'value)
	  (list->code-aux port (cddr l) (caddr l) request-name needs-reply?)
	  (list->code-aux port (cdr l) (cadr l) request-name needs-reply?))]
     [(equal? (car current-node) 'xidtype)
      (put-string port (format "(define-ftype ~s unsigned-32)\n"
			       (string->symbol
				(safestring
				 (cadr
				  (assoc
				   'name
				   (cdr current-node)))))))
      (list->code-aux port (cdr l) (cadr l) "" #f)])]
   [else
    #f]))

(define (list->code l port)
  (put-string port "(load \"enum.ss\")\n")
  (list->code-aux port l (car l) "" #f))

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
