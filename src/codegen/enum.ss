;;------------------------ENUMS!-----------------------------


(define (alist? l)
  (cond
   [(null? l) #t]
   [(and (pair? (car l)) (symbol? (caar l))) (alist? (cdr l))]
   [else #f]))

;;Enum Element
(define-record-type EE (fields sym value))


;;if (car l) is a list with length 2, get the symbol (first element) and assign it
;;to the value (second element). Otherwise take each symbol and assign a
;;unique (incrementing) ordinal (0, 1, 2, ...) to it
;;enum elements are encoded by means of records.
(define (enum-aux l ord)
  (cond
   [(null? l) '()]
   [(pair? (car l))
    (if (and (= (length (car l)) 2) (symbol? (caar l)))
        (cons (make-EE (caar l) (cadar l)) (enum-aux (cdr l) (+ 1 ord)))
        (raise
         (condition
          (make-error)
          (make-message-condition
           "Ill-formed list passed to 'enum': Can't make an enum!"))))]
   [else
    (if (symbol? (car l))
        (cons (make-EE (car l) ord) (enum-aux (cdr l) (+ 1 ord)))
        (raise
         (condition
          (make-error)
          (make-message-condition
           "exception in 'enum': Can't make an enum with non-symbols!"))))]))

(define (enum l)
  (enum-aux l 0))

(define (enum? E) (andmap EE? E))

;;returns the value of an enum symbol, if present. #f otherwise
(define (enum-lookup E sym)
  (let
      [(maybe-value
        (filter
         number?
         (map
          (lambda (ee) (when (equal? (EE-sym ee) sym) (EE-value ee)))
          E)))]
    (if (pair? maybe-value)
        (car maybe-value)
        #f)))
