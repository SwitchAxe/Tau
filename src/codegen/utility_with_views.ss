;;really fast data structure used throughout the whole parsing/code generation process
(define-record-type string-view
  (fields
   (immutable s)
   (mutable index)))


;;---------------------------------------UTILITY FUNCTIONS---------------------------------------

(define (add e p)
  (cond
   [(null? p) `(,e)]
   [(not (pair? p)) `(,p ,e)]
   [(null? (cdr p)) (cons (car p) (cons e '()))]
   [(not (pair? (cdr p))) (cons (car p) (cons (cdr p) e))]
   [else (cons (car p) (add e (cdr p)))]))

(define (sv-scar sv)
  (or
   (and
    (string-view? sv)
    (not
     (>= (string-view-index sv)
     (string-length
      (string-view-s sv))))
    (string-ref (string-view-s sv) (string-view-index sv)))
   #f))

(define (sv-scdr sv)
  (and
   (string-view? sv)
   (make-string-view (string-view-s sv) (+ 1 (string-view-index sv)))))


(define (sv-find-index-of-aux sv ch)
  (cond
   [(<=
     (- (string-length (string-view-s sv)) (string-view-index sv)) 0) #f]
   [(equal? (sv-scar sv) ch) (string-view-index sv)]
   [else (sv-find-index-of-aux (sv-scdr sv) ch)]))

(define (sv-find-index-of sv ch)
  (and (string-view? sv) (sv-find-index-of-aux sv ch)))


(define (sv-collect-until sv ch)
  (and
   (string-view? sv)
   (let* [(old-idx (string-view-index sv))
	  (idx (sv-find-index-of sv ch))]
     (and
      (number? idx)
      (let [(new-sv (make-string-view
		     (substring (string-view-s sv) old-idx idx)
		     0))]
	(string-view-index-set! sv old-idx)
	new-sv)))))


(define (sv-string-collect-until-aux oldidx sv suffix)
  (cond
   [(< (- (string-length (string-view-s sv)) (string-view-index sv)) (string-length suffix))
    (string-view-index-set! sv oldidx)
    #f]
   [(equal?
     (substring
      (string-view-s sv)
      (string-view-index sv)
      (+ (string-view-index sv) (string-length suffix)))
     suffix)
    (let [(new-sv (make-string-view
		   (substring (string-view-s sv) oldidx (+ (string-view-index sv) (string-length suffix)))
		   0))]
      (string-view-index-set! sv oldidx)
      new-sv)]
   [else
    (string-view-index-set! sv (+ 1 (string-view-index sv)))
    (sv-string-collect-until-aux oldidx sv suffix)]))

(define (sv-string-collect-until sv suffix)
  (and
   (string-view? sv)
   (sv-string-collect-until-aux (string-view-index sv) sv suffix)))

(define (sv-remove-leading-whitespace sv)
  (cond
   [(= (string-view-index sv) (string-length (string-view-s sv))) (make-string-view "" 0)]
   [(not (char-whitespace? (sv-scar sv)))
    (make-string-view
     (substring (string-view-s sv) (string-view-index sv) (string-length (string-view-s sv)))
     0)]
   [else
    (string-view-index-set! sv (+ 1 (string-view-index sv)))
    (sv-remove-leading-whitespace sv)]))
(define (string-view->list sv)
  (string->list (string-view-s sv)))


(define (sv-remove-trailing-whitespace-aux l)
  (cond
   [(null? l) ""]
   [(not (char-whitespace? (car l)))
    (make-string-view (list->string (reverse l)) 0)]
   [else
    (sv-remove-trailing-whitespace-aux (cdr l))]))

(define (sv-remove-trailing-whitespace sv)
  (sv-remove-trailing-whitespace-aux (reverse (string-view->list sv))))

(define (sv-strlit? sv)
  (and
   (equal? (sv-scar sv) #\")
   (equal?
    (string-ref
     (string-view-s sv)
     (sub1
      (string-length
       (string-view-s sv))))
    #\")))

(define (sv-strlit->no-strlit-string-view sv)
  (or
   (and
    (sv-strlit? sv)
    (make-string-view
     (substring (string-view-s sv) 1 (sub1 (string-length (string-view-s sv))))
     0))
   sv))

;;general utilities, for example to convert string literals
;;to strings without double quotes

(define (strlit? s)
  (and
   (equal? (string-ref s 0) #\")
   (equal? (string-ref s (sub1 (string-length s))) #\")))

(define (strlit->string s)
  (or
   (and
    (strlit? s)
    (substring s 1 (sub1 (string-length s))))
   s))
