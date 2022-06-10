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
