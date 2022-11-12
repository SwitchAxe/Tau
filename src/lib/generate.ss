(library (generate)
  (export list->code
	  prepare-xml
	  prepare-port)
  (import (chezscheme)
	  (utility)
	  (readfile)
	  (parse)
	  (enums)
	  (bitwise))
;;;ONLY FOR DEBUGGING, takes the first n elements from a list of m >= n elements
;;;if m <= n, returns the entire list
  (define (take n xs)
    (let loop ((n n) (xs xs) (zs (list)))
      (if (or (zero? n) (null? xs))
          (reverse zs)
          (loop (- n 1) (cdr xs)
		(cons (car xs) zs)))))
  

  (define (skip-docs l struct-tagl skip-tagl)
    (cond
     [(or (null? l) (null? (cdr l))) #t]
     [(member (caadr l) skip-tagl)
      (let loop [(lc l)]
	(cond
	 [(null? (cdr lc)) lc]
	 [(member (caadr lc) struct-tagl) lc]
	 [else (loop (cdr lc))]))]
     [else l]))
  

  ;;DOC: TODO
  ;; RETURNS A BOOLEAN
  ;; #t -> newline must be inserted
  ;; #f -> no newline
  (define (maybe-insert-newline lc struct-tagl doc-tagl field-tagl)
    (let loop [(lc lc)]
     (cond
      [(null? lc) (cons #t (cons '() '()))]
      [(null? (cdr lc)) (cons #t (cons lc '()))]
      [(member (caadr lc) struct-tagl) (cons #t (cons lc '()))]
      [(member (caadr lc) doc-tagl)
       (let inner [(lcc lc)]
	 (cond
	  [(null? (cdr lcc)) (cons #t (cons '() '()))]
	  [(member (caadr lcc) struct-tagl) (cons #t (cons lcc '()))]
	  [else (inner (cdr lcc))]))]
      [(member (caadr lc) field-tagl)
       (cons #f (cons lc '()))]
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
      (printf "current node: ~a\n" current-node)
      (printf "next 4 elements: ~a\n" (take 4 l))
      (cond
       [needs-reply? ;;reply to a request struct
	(put-string port (format "(define-ftype ~s-reply\n  (struct\n    "
				 (string->symbol (safestring request-name))))
	(list->code-aux port (if (not (null? l)) (cdr l) '())
			(if (null? (cdr l)) '() (cadr l))
			"" #f 0 list-stack)]
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
	(list->code-aux port (if (not (null? l)) (cdr l) '())
			(if (null? (cdr l)) '() (cadr l))
			"" #f 0 list-stack)]
       [(equal? (car current-node) 'import)
	(put-string port (format "(load \"~a.ss\")"
				 (cadr current-node)))
	(list->code-aux port (cdr l) (cadr l) "" #f 0 list-stack)]
       [(equal? (car current-node) 'request)
	(cond
	 [(member (caadr l) '(bitcase see example doc description list op brief fieldref))
	  ;;truncate the next node in the list and append the current one instead
	  (list->code-aux port (cons current-node (cddr l)) (current-node) "" #f 0 list-stack)]
	 [(equal? (caadr l) 'reply)
	  (list->code-aux port (if (not (null? l)) (cdr l) '())
			  (if (null? (cdr l)) '() (cadr l))
			  (cadr (assoc 'name (cdr current-node)))
			  #t 0 list-stack)]
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
	    (list->code-aux port (if (not (null? l)) (cdr l) '())
			    (if (null? (cdr l)) '() (cadr l))
			    (cadr reqname) #f 0 list-stack))])]
       [(equal? (car current-node) 'reply)
	(list->code-aux port l (car l) request-name #t 0 list-stack)]
       [(equal? (car current-node) 'type)
	(put-string port (format "[~s ~s]~a"
				 (string->symbol (safestring (cadr current-node)))
				 (let [(t (string->symbol
					   (safestring
					    (cadr current-node))))]
				   (cond
				    [(member t uint8s) 'unsigned-8]
				    [(member t uint32s) 'unsigned-32]
				    [(member t int16s) 'integer-16]
				    [(equal? t 'bool) 'boolean]
				    [(member t uint16s) 'unsigned-16]
				    [(member t int32s) 'integer-32]
				    [(member t int8s) 'integer-8]
				    [else (symbol->string t)]))
				 (if (not (assoc 'type (list (cadr l))))
				     "))\n"
				     "\n    ")))
	(list->code-aux port (if (not (null? l)) (cdr l) '())
			(if (null? (cdr l)) '() (cadr l))
			request-name needs-reply? npad list-stack)]
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
	(list->code-aux port (if (not (null? l)) (cdr l) '())
			(if (null? (cdr l)) '() (cadr l))
			request-name needs-reply? npad list-stack)]
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
	(list->code-aux port (if (not (null? l)) (cdr l) '())
			(if (null? (cdr l)) '() (cadr l)) "" #f 0 list-stack)]
       ;; [(equal? (car current-node) 'enum)
       ;; 	(let [(enum-name (safestring (cadr (assoc 'name (cdr current-node)))))]
       ;;    (put-string port
       ;;                (format
       ;;                 "\n(define ~s (enum "
       ;;                 (string->symbol enum-name)))
       ;;    (let loop [(enuml '()) (lc (cdr l)) (idx 0)]
       ;;      (cond
       ;;       [(member (caar lc) struct-xml-tags)
       ;;        (put-string port (format "'(~s"
       ;; 				       (car enuml)))
       ;; 	      (if (= (length enuml) 1)
       ;; 		  (begin
       ;; 		    (put-string port ")))\n")
       ;; 		    (list->code-aux port lc (car lc) "" #f 0 list-stack))
       ;; 		  (let inner [(enuml-cp (cdr enuml)) (elem (cadr enuml))]
       ;; 		    (cond
       ;; 		     [(null? (cdr enuml-cp))
       ;; 		      (put-string port (format "\n    ~s)))\n" (car enuml-cp)))
       ;; 		      (list->code-aux port lc (car lc) "" #f 0 list-stack)]
       ;; 		     [(null? enuml-cp)
       ;; 		      (put-string port (format "\n    ~s)))\n" elem))
       ;; 		      (list->code-aux port lc (car lc) "" #f 0 list-stack)]
       ;; 		     [else
       ;; 		      (put-string port (format "\n    ~s" elem))
       ;; 		      (inner (cdr enuml-cp) (if (null? (cdr enuml-cp))
       ;; 						(car enuml-cp)
       ;; 						(cadr enuml-cp)))])))]
       ;;       [(equal? (caar lc) 'item)
       ;;        (loop
       ;;         (add
       ;; 		(add
       ;; 		 (cond
       ;;            [(equal? (caadr lc) 'value)
       ;;             (string->number (cadadr lc))]
       ;;            [(equal? (caadr lc) 'bit)
       ;;             (<< 1 (string->number (cadadr lc)))])
       ;; 		 (string->symbol
       ;;            (string-append
       ;;             enum-name
       ;;             "-"
       ;;             (safestring
       ;;              (cadr
       ;;               (assoc
       ;;                'name
       ;;                (cdar lc)))))))
       ;; 		enuml)
       ;;         (cddr lc)
       ;;         idx)]
       ;;       [else
       ;;        (loop enuml (cdr lc) (+ 1 idx))])))]
       [(equal? (car current-node) 'enum)
	(let [(enum-name (safestring
			  (cadr (assoc 'name (cdr current-node)))))]
	  (put-string port (format "(define ~a (enum\n  '("
				   enum-name))
	  (let loop [(lc (cdr l)) (idx 0)
		     (item-name (safestring (cadr (assoc 'name (cdadr l)))))
		     (item-number (cond [(equal? (caaddr l) 'value)
					 (string->number (cadadr (cdr l)))]
					[(equal? (caaddr l) 'bit)
					 (<< 1 (string->number (cadadr (cdr l))))]
					[else 0]))]
	    (cond
	     [(equal? (caar lc) 'item)
	      (put-string port (format "(~a ~a)~a"
				       (string->symbol
					(string-append
				         enum-name
					 "-"
					 item-name))
				       item-number
				       (if (equal? (caaddr lc) 'item)
					   "\n  "
					   ")))\n")))
	      (loop
	       (if (member (caadr lc) '(value bit))
		   (cddr lc)
		   (cdr lc))
	       idx
	       (if (equal? (caaddr lc) 'item)
		   (safestring (cadr (assoc 'name (cdaddr lc))))
		   #f)
	       (if (equal? (caaddr lc) 'item)
		   (cond [(equal? (caadr lc) 'value)
			  (string->number (cadadr lc))]
			 [(equal? (caadr lc) 'bit)
			  (<< 1 (string->number (cadadr lc)))]
			 [else idx])
		   #f))]
	     [else
	      (list->code-aux port lc
			      (if (null? lc)
				  '() (car lc))
			      "" #f 0 list-stack)])))]
       [(member (car current-node) '(field exprfield))
	(if (< (length (cdr current-node)) 2)
	    (list->code-aux port (if (not (null? l)) (cdr l) '())
			    (if (null? (cdr l)) '() (cadr l))
			    request-name needs-reply? npad list-stack)
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
		(if (or (null? (cdr l)) (let [(maybel (maybe-insert-newline
						       l
						       struct-xml-tags
						       '(description see example brief doc)
						       field-xml-tags))]
					  (set! l (cadr maybel))
					  (car maybel)))
		    "))\n"
		    "\n    ")))
	      (list->code-aux port (if (not (null? l)) (cdr l) '())
			      (if (or (null? l) (null? (cdr l))) '() (cadr l))
			      request-name needs-reply? npad list-stack)))]
       [(equal? (car current-node) 'enumref)
	(put-string port (format "[~s ~s]~a"
				 (string->symbol (caddr current-node))
				 'unsigned-32
				 (if (or (null? (cdr l))
					 (let [(maybel (maybe-insert-newline
							l
							struct-xml-tags
							'(description see example brief doc)
							field-xml-tags))]
					   (set! l (cadr maybel))
					   (car maybel)))
				     "))\n"
				     "\n    ")))
	(list->code-aux port (if (not (null? l)) (cdr l) '())
		        (if (or (null? l) (null? (cdr l))) '() (cadr l))
			request-name needs-reply? npad list-stack)]
       [(equal? (car current-node) 'pad)
	(put-string port (format "[pad~s (array ~a unsigned-8)]~a"
				 npad
				 (safestring (cadadr current-node))
				 (if (or (null? (cdr l))
					 (let [(maybel (maybe-insert-newline
							l
							struct-xml-tags
							'(description see example brief doc)
							field-xml-tags))]
					   (set! l (cadr maybel))
					   (printf "~a\n" maybel)
					   (car maybel)))
				     "))\n"
				     "\n    ")))
	(list->code-aux port (if (not (null? l)) (cdr l) '())
			(if (or (null? l) (null? (cdr l))) '() (cadr l)) request-name
			needs-reply? (add1 npad) list-stack)]
       [(equal? (car current-node) 'error)
	(let [(errt (assoc 'type (cdr current-node)))
	      (errn (assoc 'name (cdr current-node)))
	      (number (assoc 'number (cdr current-node)))]
	  (put-string port (format "~a(define-ftype ~s-error\n  (struct\n   ~a~a"
				   (if number
				       (format "(define ~s-error-number ~a)\n"
					       (string->symbol (safestring
								(if errt (cadr errt) (cadr errn))))
					       (string->number (safestring (cadr number))))
				       "\n")
				   (string->symbol (safestring (if errt (cadr errt) (cadr errn))))
			           (string-append "[response-type unsigned-8]\n   "
						  "[error-code unsigned-8]\n   "
						  "[sequence unsigned-16]")
				   (if (or (null? (cdr l))
					   (let [(maybel (maybe-insert-newline
							  l
							  struct-xml-tags
							  '(description see example brief doc)
							  field-xml-tags))]
					     (set! l (cadr maybel))
					     (car maybel)))
				       "))\n"
				       "\n   ")))
	  (list->code-aux port (if (not (null? l)) (cdr l) '())
			  (if (or (null? l) (null? (cdr l))) '() (cadr l)) request-name
			  needs-reply? npad list-stack))]
       [(equal? (car current-node) 'list)
	;;this is tricky, it may or may not be useful,
	;;but we'll keep it anyway just in case.
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
					   (let [(maybel (maybe-insert-newline
							  l
							  struct-xml-tags
							  '(description see example brief doc)
							  field-xml-tags))]
					     (set! l (cadr maybel))
					     (car maybel)))
				       "))\n"
				       "\n    ")))
	  (list->code-aux
	   port
	   (if (not (null? l)) (cdr l) '())
	   (if (or (null? l) (null? (cdr l))) '() (cadr l))
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
					   (let [(maybel (maybe-insert-newline
							  l
							  struct-xml-tags
							  '(description see example brief doc)
							  field-xml-tags))]
					     (set! l (cadr maybel))
					     (car maybel)))
				       "))\n"
				       "\n    ")))
	  (list->code-aux
	   port
	   (if (not (null? l)) (cdr l) '())
	   (if (or (null? l) (null? (cdr l))) '() (cadr l))
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
					       (let [(maybel (maybe-insert-newline
							      l
							      struct-xml-tags
							      '(description see example brief doc)
							      field-xml-tags))]
						 (set! l (cadr maybel))
						 (car maybel)))
					   "))\n"
					   "\n    ")))
	      (put-string port (format "[~a ~a]~a"
				       (string->symbol
					(safestring
					 (cadr
					  (assoc 'name (cdr current-node)))))
				       (string->symbol
					(safestring
					 (let [(t (string->symbol
						   (safestring
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
					       (let [(maybel (maybe-insert-newline
							      l
							      struct-xml-tags
							      '(description see example brief doc)
							      field-xml-tags))]
						 (set! l (cadr maybel))
						 (car maybel)))
					   "))\n"
					   "\n    "))))
	  (list->code-aux port (if (not (null? l)) (cdr l) '())
			  (if (or (null? l) (null? (cdr l))) '() (cadr l))
			  request-name needs-reply? npad list-stack)]
	 [else
          (put-string port (format "[~a ~a]~a"
				   (string->symbol
				    (safestring
				     (cadr
				      (assoc 'name (cdr current-node)))))
				   (string->symbol
				    (safestring
				     (let [(t (string->symbol
					       (safestring
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
					   (let [(maybel (maybe-insert-newline
							  l
							  struct-xml-tags
							  '(description see example brief doc)
							  field-xml-tags))]
					     (set! l (cadr maybel))
					     (car maybel)))
				       "))\n"
				       "\n    ")))
	  (list->code-aux port (if (not (null? l)) (cdr l) '())
			  (if (or (null? l) (null? (cdr l))) '() (cadr l))
			  request-name needs-reply? npad list-stack)])]
       [(equal? (car current-node) 'value)
	(list->code-aux port (cdr l) (if (null? (cdr l)) '() (cadr l)) request-name needs-reply? npad list-stack)]
       [(member (car current-node)
		'(doc brief description see example)) ;;just skip it
	;; use the insert newline function, even though we don't need to print
	;; anything, just so we can skip to the next structure.
	(printf "found a doc! next 3 elements: ~a\n" (take 3 l))
	(let [(skp (skip-docs l struct-xml-tags '(description see example brief doc)))]
	  (list->code-aux port skp
			  (if (or (null? skp) (null? (cdr skp))) '() (cadr skp))
			  request-name needs-reply? npad list-stack))]
       [(member (car current-node) '(fieldref bitcase op))
	(list->code-aux port (cdr l)
			(if (null? (cdr l)) '() (cadr l)) request-name needs-reply? npad list-stack)]
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
    (put-string port "(import (enums))\n")
    (list->code-aux port l (car l) "" #f 0 '()))
  (define (prepare-xml filename)
    (sv-remove-xcb-header
     (sv-remove-xml-prolog
      (sv-remove-cdata
       (sv-remove-comments
	(sv-remove-newlines
	 (file->string-view filename)))))))
  (define (prepare-port output-file)
    (open-file-output-port output-file
			   (file-options no-fail)
			   (buffer-mode block)
			   tx))
  )
