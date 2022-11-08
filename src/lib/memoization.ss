(library (memoization)
  (export memoize)
  (import (chezscheme))
  (define (make-table)
    (vector '()))

  (define (lookup key t)
    (let [(result (assoc key (vector-ref t 0)))]
      (and result (cdr result))))

  (define (insert! key val t)
    (vector-set! t 0 (cons (cons key val) (vector-ref t 0))))
  
  (define (memoize f)
    (let [(table (make-table))]
	   (lambda args
	     (let [(maybe-found (lookup args table))]
	       (or maybe-found
		   (let [(result (apply f args))]
		     (insert! args result table)
		     result)))))))
