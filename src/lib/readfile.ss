;;reads an entire file into a Scheme string using a bytevector as
;;the middle interface.

(library (readfile)
  (export file->string-view)
  (import (utility)
	  (chezscheme))
  (define (file->string-view filepath)
    (let* 
	[(port (open-file-input-port filepath))
	 (contents (get-bytevector-all port))]
      (close-port port)
      (make-string-view
       (apply
	string-append
	(map
	 string
	 (map 
	  (lambda (b) (integer->char b))
	  (bytevector->u8-list contents))))
       0)))
  )
