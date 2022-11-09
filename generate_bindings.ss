(import (generate)
	(parse))

(display (directory-list "src/xml/"))
(newline)
(define xml (prepare-xml "src/xml/composite.xml"))
(display "ciao!!!\n")
(display xml)
(newline)

(for-each
 (lambda (f)
   (define xml (prepare-xml (string-append "src/xml/" f)))
   (define l (sv-xml->list xml))
   (define p (prepare-port
	      (string-append
	       (string-truncate!
		f
		(- (string-length f) 4))
	       ".ss")))
   (list->code l p)
   (close-port p))
 '("xproto.xml" "composite.xml"))
