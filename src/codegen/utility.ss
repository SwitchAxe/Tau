;;car but on strings
(define (scar s)
    (car (string->list s)))
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
        [(equal? (substring s 0 (string-length s)) suffix) news]
        [else
            (string-collect-until-aux
                (scdr s)
                suffix
                (string-append news (string (scar s))))]))

(define (string-collect-until s suffix)
    (string-collect-until-aux s suffix ""))

(define (add e p)
	(cond
		[(null? p) (list e)]
		[(null? (cdr p)) (cons (car p) (cons e '()))]
		[(not (pair? (cdr p))) (cons (car p) (cons (cdr p) e))]
		[else (cons (car p) (add e (cdr p)))]))

