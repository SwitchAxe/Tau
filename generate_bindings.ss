(import (generate)
	(parse))

(define xml (prepare-xml "src/xml/render.xml"))
(display xml)
(newline)

(for-each
 (lambda (f)
   (define xml (prepare-xml (string-append "src/xml/" f)))
   (define l (sv-xml->list xml))
   (define p (prepare-port
	      (string-append
	       "src/xcb/"
	       (string-truncate!
		f
		(- (string-length f) 4))
	       ".ss")))
   (pretty-print l)
   (list->code l p)
   (close-port p))
 (directory-list "src/xml"))
(exit)
