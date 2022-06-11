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
  (and
   (string-view? sv)
   (string-ref (string-view-s sv) (string-view-index sv))))

(define (sv-scdr sv)
  (and
   (string-view? sv)
   (begin
     (string-view-index-set! sv (+ 1 (string-view-index sv)))
     sv)))


(define (sv-find-index-of-aux sv ch)
  (cond
   [(equal? (string-view-string sv) "") #f]
   [(equal? (sv-scar sv) ch) (string-view-index sv)]
   [else (sv-find-index-of-aux (sv-scdr sv) ch)]))

(define (sv-find-index-of sv ch)
  (and (string-view? sv) (sv-find-index-of-aux sv ch)))

(define (sv-collect-until sv ch)
  (and
   (string-view? sv)
   (let [(idx (sv-find-index-of sv ch))]
     (and
      (number? idx)
      (make-string-view (substring (string-view-s sv) 0 idx) 0)))))

(define (sv-string-collect-until-aux sv suffix)
  (cond
   [(< (- (string-length (string-view-s sv)) (string-view-index sv)) (string-length suffix)) #f]
   [(equal?
     (substring
      (string-view-s sv)
      (string-view-index sv)
      (+ (string-view-index sv) (string-length suffix)))
     suffix)
    (make-string-view
     (substring (string-view-s sv) 0 (+ (string-view-index sv) (string-length suffix)))
     0)]
   [else
    (string-view-index-set! sv (+ 1 (string-view-index sv)))
    (sv-string-collect-until-aux sv suffix)]))

(define (sv-string-collect-until sv suffix)
  (and
   (string-view? sv)
   (string-collect-until-aux sv suffix)))

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
