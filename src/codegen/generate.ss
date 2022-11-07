(load "utility_with_views.ss")
(load "parse_with_views.ss")
(load "enum.ss")
(load "../lib/bitwise.ss")

;;;ONLY FOR DEBUGGING, takes the first n elements from a list of m >= n elements
;;;if m <= n, returns the entire list
(define (take n xs)
  (let loop ((n n) (xs xs) (zs (list)))
    (if (or (zero? n) (null? xs))
        (reverse zs)
        (loop (- n 1) (cdr xs)
              (cons (car xs) zs)))))


;;DOC: TODO
;; RETURNS A BOOLEAN
;; #t -> newline must be inserted
;; #f -> no newline
(define (maybe-insert-newline lc tagl useless-tagl1 useless-tagl2 field-tagl)
  (let loop [(lc lc)]
   (cond
    [(null? lc)
     (set! l lc) ;;l is an external variable
     #t]
    [(null? (cdr lc))
     (set! l (cdr lc))
     #t]
    [(member (caadr lc) useless-tagl1)
     (loop (cdr lc))]
    [(member (caadr lc) useless-tagl2)
     (let inner [(lcc (cdr lc))]
       (cond
	[(null? lcc)
	 (set! l lcc)
	 #t]
	[(null? (cdr lcc))
	 (set! l (cdr lcc))
	 #t]
	[(member (caar lcc) tagl)
	 (set! l lcc)
	 #t]
	[else
	 (inner (cdr lcc))]))]
    [(member (caadr lc) tagl) #t]
    [(member (caadr lc) field-tagl) #f]
    [else (loop (cdr lc))])))


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

(define uint8s '(byte card8 depth keycode char))
(define int8s '(int8))
(define int16s '(int16))
(define int32s '(int32))
(define uint16s '(card16))
(define custom-types '()) ;;for structs and so on

(define field-xml-tags '(field list error pad fieldexpr)) ;;for inserting newlines
(define struct-xml-tags '(struct union xidunion
				 request reply
				 error enum
				 xidtype switch event))

;;for turning XML tokens into valid chez scheme types.
(define (safestring s)
  (strlit->string (string-downcase s)))

(define (list->code-aux port l current-node request-name needs-reply? npad list-stack)
  (cond
   ;;the code generation was successful.
   [(null? l) #t]
   [(null? current-node) #t]
   [(pair? current-node)
    (printf "current node = ~s\n" current-node)
    (printf "next 3 elements: ~s\n" (take 3 (cdr l)))
    (printf "list stack: ~s\n" list-stack)
    (cond
     [needs-reply? ;;reply to a request struct
      (put-string port (format "(define-ftype ~s-reply\n  (struct\n    "
			       (string->symbol (safestring request-name))))
      (list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) "" #f 0 list-stack)]
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
      (set! custom-types (cons (string->symbol (safestring (cadr (assoc 'name (cdr current-node)))))
			       custom-types))
      (list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) "" #f 0 list-stack)]
     [(equal? (car current-node) 'request)
      (cond
       [(member (caadr l) '(bitcase see example doc description list op brief fieldref))
	;;truncate the next node in the list and append the current one instead
	(list->code-aux port (cons current-node (cddr l)) (current-node) "" #f 0 list-stack)]
       [(equal? (caadr l) 'reply)
	(list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) (cadr (assoc 'name (cdr current-node))) #t 0 list-stack)]
       [else
	(let [(opcode (assoc 'opcode (cdr current-node)))
	      (reqname (assoc 'name (cdr current-node)))]
	  (when opcode
	    (put-string port (format "(define ~s-opcode ~s)\n"
				     (string->symbol (safestring (cadr reqname)))
				     (string->number (safestring (cadr opcode))))))
	  (if (member (string->symbol (safestring (cadr reqname))) '(grabserver ungrabserver))
	      (put-string port (format (string-append "(define-ftype ~s\n  (struct\n    "
						      "[major-opcode unsigned-8]\n    "
						      "[pad0 unsigned-8]\n    "
						      "[length unsigned-16]))")
				       (string->symbol (safestring (cadr reqname)))))
	      (put-string port (format "(define-ftype ~s\n  (struct\n    "
				       (string->symbol (safestring (cadr reqname))))))
	  (list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) (cadr reqname) #f 0 list-stack))])]
     [(equal? (car current-node) 'reply)
      (list->code-aux port l (car l) request-name #t 0 list-stack)]
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
      (list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) request-name needs-reply? npad list-stack)]
     [(equal? (car current-node) 'event)
      (put-string port (format "(define ~s-number ~s)\n"
			       (string->symbol
				(safestring
				 (cadr
				  (assoc 'name (cdr current-node)))))
			       (string->number
				(safestring
				 (cadr
				  (assoc 'number (cdr current-node)))))))
      (put-string port (format "(define-ftype ~s\n    (struct\n    "
			       (string->symbol
				(safestring
				 (cadr
				  (assoc 'name (cdr current-node)))))))
      (list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) request-name needs-reply? npad list-stack)]
     [(equal? (car current-node) 'typedef)
      ;;<typedef oldname="oldtype" newname="newtype"> ->
      ;;(typedef (oldname "oldtype") (newname "newtype"))
      (let [(ot (string->symbol (safestring (cadr (assoc 'oldname (cdr current-node))))))
	    (nt (string->symbol (safestring (cadr (assoc 'newname (cdr current-node))))))]
	  (cond
	   [(member ot uint8s)
	    (set! uint8s (cons nt uint8s))]
	   [(member ot uint16s)
	    (set! uint16s (cons nt uint16s))]
	   [(member ot uint32s)
	    (set! uint32s (cons nt uint32s))]
	   [(member ot int16s)
	    (set! int16s (cons nt int16s))]
	   [(member ot int32s)
	    (set! int32s (cons nt int32s))]
	   [(member ot int8s)
	    (set! int8s (cons nt int8s))]))
      (list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) "" #f 0 list-stack)]
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
		  (list->code-aux port lc (car lc) "" #f 0 list-stack))
		(let inner [(enuml-cp (cdr enuml)) (elem (cadr enuml))]
		  (cond
		   [(null? (cdr enuml-cp))
		    (put-string port (format "\n    ~s)))\n" (car enuml-cp)))
		    (list->code-aux port lc (car lc) "" #f 0 list-stack)]
		   [(null? enuml-cp)
		    (put-string port (format "\n    ~s)))\n" elem))
		    (list->code-aux port lc (car lc) "" #f 0 list-stack)]
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
	  (list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) request-name needs-reply? npad list-stack)
	  (begin
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
              (cond
	       [else
		(string->symbol
		 (strlit->string
		  (let [(t (safestring (cadr (assoc 'type (cdr current-node)))))]
		    (cond
		     [(member (string->symbol t) uint32s) "unsigned-32"]
		     [(member (string->symbol t) uint8s) "unsigned-8"]
		     [(equal? (string->symbol t) 'bool) "boolean"]
		     [(member (string->symbol t) uint16s) "unsigned-16"]
		     [(member (string->symbol t) int16s) "integer-16"]
		     [(member (string->symbol t) int32s) "integer-32"]
		     [(member (string->symbol t) int8s) "integer-8"]
		     [else t]))))])
              (if (or (null? (cdr l)) (maybe-insert-newline
				       l
				       struct-xml-tags
				       '(op fieldref value bitcase)
				       '(description see example brief doc)
				       field-xml-tags))
		  "))\n"
		  "\n    ")))
	    (list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) request-name needs-reply? npad list-stack)))]
     [(equal? (car current-node) 'enumref)
      (put-string port (format "[~s ~s]~a"
			       (string->symbol (caddr current-node))
			       'unsigned-32
			       (if (or (null? (cdr l))
				       (maybe-insert-newline
					l
					struct-xml-tags
					'(op fieldref value bitcase)
					'(description see example brief doc)
					field-xml-tags))
				   "))\n"
				   "\n    ")))
      (list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) request-name needs-reply? npad list-stack)]
     [(equal? (car current-node) 'pad)
      (printf "found a pad! the next element in the list is: ~s\n\n\n\n\n\n"
	      (caadr l))
      (put-string port (format "[pad~s (array ~a unsigned-8)]~a"
			       npad
			       (safestring (cadadr current-node))
			       (if (or (null? (cdr l))
				       (maybe-insert-newline
					l
					struct-xml-tags
					'(op fieldref value bitcase)
					'(description see example brief doc)
				        field-xml-tags))
				   "))\n"
				   "\n    ")))
      (list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) request-name needs-reply? (add1 npad) list-stack)]
     [(equal? (car current-node) 'error)
      (let [(errt (assoc 'type (cdr current-node)))]
	(put-string port (format "(define-ftype ~s-error\n  (struct\n  ~a))\n"
				 (string->symbol (safestring (cadr errt)))
			         (string-append "[response-type unsigned-8]\n    "
						"[error-code unsigned-8]\n    "
						"[sequence unsigned-16]\n    "
						"[bad-value unsigned-32]\n    "
						"[minor-opcode unsigned-16]\n    "
						"[major-opcode unsigned-8]\n    "
						"[pad0 unsigned-8]")
				       ))
	(list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) request-name needs-reply? npad list-stack))]
     [(equal? (car current-node) 'list)
      ;;this is tricky, it may or may not be useful,
      ;;but we'll keep it anyway just in case.
      ;;sometimes a list is declared first, and assigned a size later.
      ;;in the XML logic this is permitted, but we're in Scheme, so we need to act
      ;;accordingly and put everything together at the same time. The most trivial working
      ;;way to do so is to make a stack of list names and when we later find a 'value' field
      ;;matching the top of the stack, we remove it from the stack and codegen the list there.
      ;;this works UNDER THE ASSUMPTION THAT list names are in fact assigned a size in a
      ;;stack-ish way, so if a gets declared before b, then b is assigned first, and then a.
      (cond
       [(or
	 (null? (cdr l))
	 (and (pair? (cadr l)) (equal? (caadr l) 'fieldref)))
	(put-string port (format "[~a ~a]~a"
				 (string->symbol
				  (safestring
				   (cadr
				    (assoc 'name (cdr current-node)))))
				 (string->symbol
				  (safestring
				   (let [(t (string->symbol (safestring
							     (cadr (assoc 'type (cdr current-node))))))]
				     (cond
				      [(member t uint8s) "(* unsigned-8)"]
				      [(member t uint32s) "(* unsigned-32)"]
				      [(member t int16s) "(* integer-16)"]
				      [(member t uint16s) "(* unsigned-16)"]
				      [(member t int32s) "(* integer-32)"]
				      [(member t int8s) "(* integer-8)"]
				      [(equal? t 'bool) "(* boolean)"]
				      [(equal? t 'void) "void*"]
				      [else (format "(* ~a)" t)]))))
				 (if (or (null? (cdr l))
					 (maybe-insert-newline
					  l
					  struct-xml-tags
					  '(op fieldref value bitcase)
					  '(description see example brief doc)
					  field-xml-tags))
				     "))\n"
				     "\n    ")))
	(list->code-aux
	 port
	 (cdr l)
	 (if (null? (cdr l)) '() (cadr l))
	 request-name
	 needs-reply?
	 npad
	 list-stack)]
       [(equal? (caadr l) 'value)
	(put-string port (format "[~a (array ~a ~a)]~a"
				 (string->symbol
				  (safestring
				   (cadr
				    (assoc 'name (cdr current-node)))))
				 (safestring (cadadr l))
				 (string->symbol
				  (safestring
				   (let [(t (string->symbol (safestring
							     (cadr (assoc 'type (cdr current-node))))))]
				     (cond
				      [(member t uint8s) "(* unsigned-8)"]
				      [(member t uint32s) "(* unsigned-32)"]
				      [(member t int16s) "(* integer-16)"]
				      [(equal? t 'bool) "(* boolean)"]
				      [(member t uint16s) "(* unsigned-16)"]
				      [(member t int32s) "(* integer-32)"]
				      [(member t int8s) "(* integer-8)"]
				      [(equal? t 'void) "void*"]
				      [else (symbol->string t)]))))
				 (if (or (null? (cdr l))
					 (maybe-insert-newline
					  l
					  struct-xml-tags
					  '(op fieldref value bitcase)
					  '(description see example brief doc)
					  field-xml-tags))
				     "))\n"
				     "\n    ")))
	(list->code-aux
	 port
	 (cddr l)
	 (if (null? (cddr l)) '() (caddr l))
	 request-name
	 needs-reply?
	 npad
	 list-stack)]
       [(and
	 (pair? (cadr l))
	 (equal? (caadr l) 'op))
        (if (assoc 'value (take 3 (cdr l)))
	    (put-string port (format "[~a (array ~a ~a)]~a"
				     (string->symbol
				      (safestring
				       (cadr
					(assoc 'name (cdr current-node)))))
				     (string->number (cadr (assoc 'value (take 3 (cdr l)))))
				     (string->symbol
				      (safestring
				       (let [(t (string->symbol (safestring
								 (cadr (assoc 'type (cdr current-node))))))]
					 (cond
					  [(member t uint8s) "unsigned-8"]
					  [(member t uint32s) "unsigned-32"]
					  [(member t int16s) "integer-16"]
					  [(equal? t 'bool) "boolean"]
					  [(member t uint16s) "unsigned-16"]
					  [(member t int32s) "integer-32"]
					  [(member t int8s) "integer-8"]
					  [else (symbol->string t)]))))
				     (if (or (null? (cdr l))
					     (maybe-insert-newline
					      l
					      struct-xml-tags
					      '(op fieldref value bitcase)
					      '(description see example brief doc)
					      field-xml-tags))
					 "))\n"
					 "\n    ")))
	    (put-string port (format "[~a ~a]~a"
				     (string->symbol
				      (safestring
				       (cadr
					(assoc 'name (cdr current-node)))))
				     (string->symbol
				      (safestring
				       (let [(t (string->symbol (safestring
								 (cadr (assoc 'type (cdr current-node))))))]
					 (cond
					  [(member t uint8s) "(* unsigned-8)"]
					  [(member t uint32s) "(* unsigned-32)"]
					  [(member t int16s) "(* integer-16)"]
					  [(equal? t 'bool) "(* boolean)"]
					  [(member t uint16s) "(* unsigned-16)"]
					  [(member t int32s) "(* integer-32)"]
					  [(member t int8s) "(* integer-8)"]
					  [(equal? t 'void) "void*"]
					  [else (format "(* ~a)" t)]))))
				     (if (or (null? (cdr l))
					     (maybe-insert-newline
					      l
					      struct-xml-tags
					      '(op fieldref value bitcase)
					      '(description see example brief doc)
					      field-xml-tags))
					 "))\n"
					 "\n    "))))
	(list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) request-name needs-reply? npad list-stack)]
       [else
        (put-string port (format "[~a ~a]~a"
				 (string->symbol
				  (safestring
				   (cadr
				    (assoc 'name (cdr current-node)))))
				 (string->symbol
				  (safestring
				   (let [(t (string->symbol (safestring
							     (cadr (assoc 'type (cdr current-node))))))]
				     (cond
				      [(member t uint8s) "unsigned-8"]
				      [(member t uint32s) "unsigned-32"]
				      [(member t int16s) "integer-16"]
				      [(equal? t 'bool) "boolean"]
				      [(member t uint16s) "unsigned-16"]
				      [(member t int32s) "integer-32"]
				      [(member t int8s) "integer-8"]
				      [else (symbol->string t)]))))
				 (if (or (null? (cdr l))
					 (maybe-insert-newline
					  l
					  struct-xml-tags
					  '(op fieldref value bitcase)
					  '(description see example brief doc)
					  field-xml-tags))
				     "))\n"
				     "\n    ")))
	(list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) request-name needs-reply? npad list-stack)])]
     [(equal? (car current-node) 'value)
      (list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) request-name needs-reply? npad list-stack)]
     [(member (car current-node)
	      '(value op fieldref bitcase doc brief description see example)) ;;just skip it
      (list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) request-name needs-reply? npad list-stack)]
     [(equal? (car current-node) 'xidtype)
      (put-string port (format "(define-ftype ~s unsigned-32)\n"
			       (string->symbol
				(safestring
				 (cadr
				  (assoc
				   'name
				   (cdr current-node)))))))
      (list->code-aux port (cdr l)
		      (if (null? (cdr l)) '() (cadr l)) "" #f 0 list-stack)])]
   [else
    #f]))

(define (list->code l port)
  (put-string port "(load \"enum.ss\")\n")
  (list->code-aux port l (car l) "" #f 0 '()))

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
