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
  (let [(sv1 (sv-collect-until sv " "))]
    (if (string-view? sv1)
	sv1
	(let [(sv2 (sv-collect-until sv "/>"))]
	  (if (string-view? sv2)
	      sv2
	      (let [(sv3 (sv-collect-until sv ">"))]
		(if (string-view? sv3)
		    sv3
		    #f)))))))

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

