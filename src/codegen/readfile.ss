;;---------------auxillary functions useful later-------------
(load "utils.ss")
;;reads an entire file into a Scheme string using a bytevector as
;;the middle interface.
(define (file->string filepath)
    (let* 
        [(port (open-file-input-port filepath))
        (contents (get-bytevector-all port))]
            (close-port port)
            (apply
                string-append
                (map
                    string
                    (map 
                        (lambda (b) (integer->char b))
                        (bytevector->u8-list contents))))))
;;this removes all tabs and whitespaces from a string, 
;;except if they're in string literals.
(define (nospaces-aux s strlit?)
    (cond
        [(equal? s "") ""]
        [(equal? (scar s) #\")
            (nospaces-aux (scdr s) (not strlit?))]
        [strlit?
            (string-append 
                (string (scar s))
                (nospaces-aux (scdr s) strlit?))]
        [else (nospaces-aux (scdr s) strlit?)]))

(define (nospaces s)
    (nospaces-aux s #f))