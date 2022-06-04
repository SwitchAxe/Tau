;;car but on strings
(define (scar s)
    (and (not (equal? s "")) (car (string->list s))))
;;cdr but on strings, this one is basically an alias for substring 
(define (scdr s)
    (substring s 1 (string-length s)))

;;range from 0 to i, in descending order
(define (range-aux i)
    (cond
      [(zero? i) '(0)]
      [else (cons i (range-aux (sub1 i)))]))
;;this puts it in reverse (i.e. the right) order
(define (range i) (reverse (range-aux i)))


(define (find-index-of-aux idx s ch)
    (cond
        [(equal? s "") #f]
        [(equal? (scar s) ch) idx]
        [else (find-index-of-aux (add1 idx) (scdr s) ch)]))

(define (find-index-of s ch)
    (find-index-of-aux 0 s ch))

(define (collect-until s ch)
    (let [(idx (find-index-of s ch))]
        (if (number? idx)
            (substring s 0 idx)
            #f)))

(define (string-collect-until-aux s suffix news)
    (cond
        [(equal? s "") #f]
        [(< (string-length s) (string-length suffix)) #f]
        [(equal? (substring s 0 (string-length suffix)) suffix) (string-append news suffix)]
        [else
            (string-collect-until-aux
                (scdr s)
                suffix
                (string-append news (string (scar s))))]))

(define (string-collect-until s suffix)
    (string-collect-until-aux s suffix ""))

(define (add e p)
	(cond
		[(null? p) `(,e)]
		[(not (pair? p)) `(,p ,e)]
        [(null? (cdr p)) (cons (car p) (cons e '()))]
		[(not (pair? (cdr p))) (cons (car p) (cons (cdr p) e))]
		[else (cons (car p) (add e (cdr p)))]))

(define (member? e p)
    (pair? (member e p)))

(define (list->number l)
    (string->number (list->string l)))

(define (remove-leading-spaces s)
    (cond
        [(equal? s "") s]
        [(char-alphabetic? (scar s)) s]
        [else (reove-leading-spaces (scdr s))]))

;;the wrapper function will accept a string and turn it into a list, for ease of use.
(define (remove-trailing-spaces-aux l)
    (cond
        [(null? l) ""]
        [(char-alphabetic? (car l)) (list->string (reverse l))]
        [else (remove-trailing-spaces-aux (cdr l))]))

(define (remove-trailing-spaces s)
    (remove-trailing-spaces-aux (reverse (string->list s))))