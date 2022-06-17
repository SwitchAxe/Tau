(load "readfile.ss")
(load "utility_with_views.ss")
(load "memoization.ss")
(define comment-start "<!--")
(define comment-end "-->")
(define cdata-start "<![CDATA[")
(define cdata-end "]]>")


(define (sv-remove-comments-aux sv comment? string-start string-end strings)
  (cond
   [(< (- (string-length (string-view-s sv)) (string-view-index sv)) 3)
    (make-string-view
     (apply
      string-append
      (add
       (substring
        (string-view-s sv)
        string-start
        string-end)
       strings))
     0)]
   [(< (- (string-length (string-view-s sv)) (string-view-index sv)) 4)
    (make-string-view
     (apply
      string-append
      (add
       (substring
        (string-view-s sv)
        string-start
        string-end)
       strings))
     0)]
   [(equal?
     (substring
      (string-view-s sv)
      (string-view-index sv)
      (+ (string-view-index sv) 4))
     comment-start)
    (string-view-index-set! sv (+ 4 (string-view-index sv)))
    (sv-remove-comments-aux
     sv
     (not comment?)
     (+ 4 string-end)
     (+ 4 string-end)
     (add
      (substring
       (string-view-s sv)
       string-start
       string-end)
      strings))]
   [(equal?
     (substring
      (string-view-s sv)
      (string-view-index sv)
      (+ (string-view-index sv) 3))
     comment-end)
    (string-view-index-set! sv (+ 3 (string-view-index sv)))
    (sv-remove-comments-aux
     sv
     (not comment?)
     (+ string-start 3)
     (+ string-end 3)
     strings)]
   [comment?
    (sv-remove-comments-aux (sv-scdr sv) comment? (+ 1 string-start) (+ 1 string-end) strings)]
   [else
    (sv-remove-comments-aux
     (sv-scdr sv)
     comment?
     string-start
     (+ string-end 1)
     strings)]))


(define (sv-remove-comments sv)
  (and
   (string-view? sv)
   (sv-remove-comments-aux sv #f 0 0 '())))

(define (sv-remove-cdata-aux sv cdata? string-start string-end strings)
  (printf
   "s = ~s\nstring-start = ~s\nstring-end = ~s\n"
   (substring (string-view-s sv) (string-view-index sv) (string-length (string-view-s sv)))
   string-start string-end)
  (cond
   [(= (string-view-index sv) (string-length (string-view-s sv)))
    (make-string-view
     (apply
      string-append
      (add
       (substring
        (string-view-s sv)
        string-start
        string-end)
       strings))
     0)]
   [(and
     (>= (- (string-length (string-view-s sv)) (string-view-index sv)) 9)
     (equal?
      (substring
       (string-view-s sv)
       (string-view-index sv)
       (+ (string-view-index sv) 9))
      cdata-start))
    (string-view-index-set! sv (+ (string-view-index sv) 9))
    (sv-remove-cdata-aux
     sv
     (not cdata?)
     (+ 9 string-end)
     (+ 9 string-end)
     (add (substring (string-view-s sv) string-start string-end) strings))]
   [(and
     (>= (- (string-length (string-view-s sv)) (string-view-index sv)) 9)
     (equal?
      (substring
       (string-view-s sv)
       (string-view-index sv)
       (+ (string-view-index sv) 3))
      cdata-end))
    (string-view-index-set! sv (+ (string-view-index sv) 3))
    (sv-remove-cdata-aux
     sv
     (not cdata?)
     (+ 3 string-start)
     (+ 3 string-end)
     strings)]
   [cdata? (sv-remove-cdata-aux (sv-scdr sv) cdata? (+ 1 string-start) (+ 1 string-end) strings)]
   [else (sv-remove-cdata-aux (sv-scdr sv) cdata? string-start (+ 1 string-end) strings)]))

(define (sv-remove-cdata sv)
  (and
   (string-view? sv)
   (sv-remove-cdata-aux sv #f 0 0 '())))

(define (sv-remove-newlines sv)
  (and
   (string-view? sv)
   (make-string-view
    (list->string
     (filter
      (lambda (ch) (if (equal? ch #\newline) #f #t))
      (string->list (string-view-s sv))))
    0)))

(define (sv-has-xml-prolog? xml-sv)
  (and
   (string-view? xml-sv)
   (sv-string-collect-until xml-sv "?>")))

(define (sv-remove-xml-prolog xml-sv)
  (and
   (has-xml-prolog? xml-sv)
   (make-string-view
    (substring
     (string-view-s xml-sv)
     (string-length (sv-string-collect-until xml-sv "?>"))
     (string-length (string-view-s xml-sv)))
    0)))

(define (sv-has-xcb-header? xml-sv)
  (sv-string-collect-until xml-sv "<xcb"))

;;be careful! this function ONLY works correctly
;;after a successful call to 'remove-xml-prolog'!
(define (sv-remove-xcb-header xml-sv)
  (and
   (has-xcb-header? xml-sv)
   (make-string-view
    (substring
     (string-view-s xml-sv)
     (string-length (sv-string-collect-until ">"))
     (- (string-length (string-view-s xml-sv)) 6))
    0)))

(define (sv-try-collect-tag sv)
  (let [(sv1 (sv-string-collect-until sv " "))]
    (if (string-view? sv1)
	sv1
	(let [(sv2 (sv-string-collect-until sv "/>"))]
	  (if (string-view? sv2)
	      sv2
	      (let [(sv3 (sv-string-collect-until sv ">"))]
		(if (string-view? sv3)
		    sv3
		    #f)))))))



;;this function returns #f in case of failure
(define (sv-xml-parse-tag-aux tagstring avp)
  (cond
   [(>= (string-view-index tagstring) (string-length (string-view-s tagstring)))
    '()]
   [(equal? (sv-scar tagstring) #\>) '()]
   [(equal?
     (substring
      (string-view-s tagstring)      
      (string-view-index tagstring)
      (+ (string-view-index tagstring) 2))
     "/>")
    '()]
   [(equal? (sv-scar tagstring) #\<)
    (let* [(tag (sv-try-collect-tag tagstring))
	   (taglen (string-length (string-view-s tag)))]
      (string-view-index-set! tagstring taglen)
      (cons
       (string->symbol
	(substring
	 (string-view-s tag)
	 1
	 (sub1 taglen)))
       (sv-xml-parse-tag-aux tagstring '())))]
   [(char-whitespace? (sv-scar tagstring))
    (if (not (null? avp))
	(cons avp (sv-xml-parse-tag-aux (sv-scdr tagstring) '()))
	(sv-xml-parse-tag-aux (sv-scdr tagstring) '()))]
   [(equal? (sv-scar tagstring) #\")
    (set! tagstring (sv-scdr tagstring))
    (let* [(strlit (sv-collect-until tagstring #\"))
	  (raw-strlit (string-view-s strlit))
	  (raw-strlit-len (string-length raw-strlit))]
      (and
       strlit
       (cons
	(add (string-append "\"" raw-strlit "\"") avp)
	(begin
	  (string-view-index-set!
	   tagstring
	   (+
	    1
	    (string-view-index tagstring)
	    raw-strlit-len))
	  (sv-xml-parse-tag-aux (sv-scdr tagstring) '())))))]
   [else
    (let* [(attr (sv-collect-until tagstring #\=))
	   (raw-attr (string-view-s attr))
	   (raw-attr-len (string-length raw-attr))]
      (string-view-index-set!
       tagstring
       (+
	(string-view-index tagstring)
	raw-attr-len))
      (sv-xml-parse-tag-aux
       (sv-scdr tagstring)
       (if (null? avp)
	   (add (string->symbol raw-attr) avp)
	   (raise
	    (condition
	     (make-error)
	     (make-message-condition
	      "Failed to parse XML tag in 'sv-xml-parse-tag-aux'!"))))))]))

(define (sv-xml-parse-tag xmlstring)
  (sv-xml-parse-tag-aux xmlstring '()))


;;macro to transform the unintuitive 'add' into the
;;stack operation 'push', without loss of performance at runtime.
(define-syntax push
  (syntax-rules ()
    ((_ a b)
     (add a b))))

;;the pop operation must be a function, however, since
;;it's not just an alias.
(define (pop l)
  (reverse (cdr (reverse l))))

(define (get-top l)
  (car (reverse l)))

;;xmlstring is a string-view;
;;tagstack is a stack of all the open tags at a given
;;point in time;
;;result is the final list obtained by parsing the file.
(define (sv-xml->list-aux xmlstring tagstack result)
  (let [(nextchar (sv-scar xmlstring))
	(idx (string-view-index xmlstring))]
    (printf "\nnextchar = ~s\nindex = ~s\ntagstack = ~s\n" nextchar idx tagstack)
    (cond
     [(not nextchar)
      (display "stream finished!\n")
      (if (null? tagstack)
	  result
	  (raise
	   (condition
	    (make-error)
	    (make-message-condition
	     "Parsing of the XML string ended with open tags!"))))]
     [(and
       (>= (- (string-length (string-view-s xmlstring)) idx) 2)
       (equal? (substring (string-view-s xmlstring) idx (+ idx 2)) "/>"))
      (display "parsing a closing tag!\n")
      (string-view-index-set! xmlstring (+ idx 2))
      (sv-xml->list-aux xmlstring (pop tagstack) result)]
     [(and
       (>= (- (string-length (string-view-s xmlstring)) idx) 2)
       (equal? (substring (string-view-s xmlstring) idx (+ idx 2)) "</"))
      (printf "parsing a closing tag!\n")
      (let* [(tag-closer (sv-string-collect-until xmlstring ">"))
	     (raw-closer (string-view-s tag-closer))
	     (closing-tag (substring raw-closer 2 (sub1 (string-length raw-closer))))]
	(if (equal? (get-top tagstack) closing-tag)
	    (begin
	      (string-view-index-set! xmlstring (+ idx (string-length raw-closer)))
	      (sv-xml->list-aux xmlstring (pop tagstack) result))
	    (raise
	     (condition
	      (make-error)
	      (make-message-condition
	       "In sv-xml->list: closing tag and opening tag don't match!")))))]
     [(equal? nextchar #\<)
      (display "parsing a tag!\n")
      (let* [(tag-opener (sv-string-collect-until xmlstring ">"))
	     (raw-tag-opener (string-view-s tag-opener))
	     (parsed-tag-opener (sv-xml-parse-tag tag-opener))
	     (tagsymbol (car parsed-tag-opener))
	     (tagstring (symbol->string tagsymbol))]
	(printf "raw-tag-opener = ~s\nparsed = ~s" raw-tag-opener parsed-tag-opener)
	(unless
	    (equal?
	     (string-ref raw-tag-opener (- (string-length raw-tag-opener) 2))
	     #\/)
	  (set! tagstack (push tagstring tagstack)))
	(string-view-index-set! xmlstring (+ idx (string-length raw-tag-opener)))
	(sv-xml->list-aux
	 xmlstring
	 tagstack	 
	 (push parsed-tag-opener result)))]
     [(char-whitespace? nextchar)
      (display "skipping a whitespace!\n")
      (sv-xml->list-aux (sv-scdr xmlstring) tagstack result)]
     [(equal? nextchar #\")
      (display "parsing a string literal!\n")
      (set! xmlstring (sv-scdr xmlstring))
      (let* [(strlit (sv-collect-until xmlstring #\"))
	     (raw-strlit (string-view-s strlit))
	     (innermost-tag (get-top tagstack))]
        (and
	 raw-strlit
	 (begin
	   (set! innermost-tag
		 (push
		  (string-append "\"" raw-strlit "\"")
		  innermost-tag))
	   (set! result (push innermost-tag (pop result)))
	   (string-view-index-set! xmlstring
				   (+
				    1
				    idx
				    (string-length raw-strlit)))
	   (sv-xml->list-aux xmlstring tagstack result))))]
     [(or (char-alphabetic? nextchar) (char-numeric? nextchar))
      (display "parsing a constant!\n")
      (or
       (and
	(not (null? tagstack))
	(let* [(constant
	       (sv-remove-trailing-whitespace
		(sv-remove-leading-whitespace
		 (sv-string-collect-until xmlstring "<"))))
	       (raw-constant
		(substring
		 (string-view-s constant)
		 0
		 (sub1 (string-length (string-view-s constant)))))
	      (innermost-tag (get-top result))]
	  (and
	   constant
	   (begin
	     (set! innermost-tag (push raw-constant innermost-tag))
	     (set! result (push innermost-tag (pop result)))
	     (string-view-index-set! xmlstring
				     (+
				      idx
				      (string-length raw-constant)))
	     (sv-xml->list-aux xmlstring tagstack result)))))
       (raise
	(condition
	 (make-error)
	 (make-message-condition
	  "In sv-xml->string: Constant without an enclosing tag!"))))])))

(define sv-xml->list
  (memoize (lambda (xml) (sv-xml->list-aux xml '() '()))))


