(define (make-cache)
  (vector '()))


;;key is a list, and cache is an association list.
;;assoc finds all the matching entries in the cache, for instance:
;;(assoc '(a b c) '((a b c) 1 2 3) -> '((abc) 1 2 3)
;;assoc is most useful in conjunction with cdr and
;;similar functions that take items from lists, so that:
;;(cdr (assoc '(a b c) '((a b c) 1 2 3))) -> '(1 2 3)
;;we're going to use the fact that assoc returns #f on failure.
(define (cache-lookup key cache)
  (let [(result (assoc key (vector-ref cache 0)))]
    (and result (cdr result))))

(define (cache-insert! key value cache)
  (vector-set! cache 0 (cons (cons key value) (vector-ref cache 0))))

(define (memoize f)
  (let [(cache (make-cache))]
    (lambda args
      (let [(cached-value (cache-lookup args cache))]
        (or
         cached-value
         (let [(result (apply f args))]
           (cache-insert! args result cache)
           result))))))
