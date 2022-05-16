(define-syntax <<
    (syntax-rules ()
        [(_ n m)
            (bitwise-arithmetic-shift-left n m)]))

(define-syntax >>
    (syntax-rules ()
        [(_ n m)
            (bitwise-arithmetic-shift-right n m)]))

(define-syntax ||
    (syntax-rules ()
        [(_ n m)
            (bitwise-ior n m)]))
(define-syntax &
    (syntax-rules ()
        [(_ n m)
            (bitwise-and n m)]))
            