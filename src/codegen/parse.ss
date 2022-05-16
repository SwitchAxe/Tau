(load "utility.ss");; for various utility functions
(define prolog-start "<?")
(define prolog-end "?>") 
(define comment-start "<!--")
(define comment-end "-->")

(define (remove-comments-aux s comment?)
    (cond
        [(equal? s "") ""]
        [(equal? (substring s 0 3) comment-end)
            (remove-comments-aux
                (substring s 3 (string-length s))
                (not comment?))]
        [(equal? (substring s 0 4) comment-start)
            (remove-comments-aux (scdr s) (not comment?))]
        [comment? (remove-comments-aux (scdr s) comment?)]
        [else
            (string-append
                (string (scar s))
                (remove-comments-aux (scdr s) comment?))]))

(define (remove-comments s)
    (remove-comments-aux s #f))
;;returns a string that goes from the start of the string to
;;the specified char, excluding it.

;;an xml parser needed to generate the code we use
;;for the window manager.
;;s is the string obtained from 'file->string' (see "readfile.ss")
;;of the entire xml file, 'in-tag?' is #t if tagnestn > 0, #f otherwise.
;;inner is the inner *list* of the result, not the innermost *tag* of the xml.
;;lst is the result.
(define (tag-not-opened-error)
    (raise
        (condition
            (make-error)
            (make-message-condition
                (format
                    "Ill-formed XML: ~s tag closed without being opened!"
                    curtag)))))

(define (try-collect-tag s)
    (let [(s1 (collect-until s #\space))]
        (if (string? s1)
            s1
            (let [(s2 (string-collect-until s "/>"))]
                (if (string? s2)
                    s2
                    (raise
                        (condition
                            (make-error)
                            (make-message-condition
                                "Ill-formed XML file!"))))))))

(define (xml->list-aux s in-tag? tagnestn in-prolog? lst inner curtag attribute value strlit?)
    (printf "s = ~s\nlst= ~s\ninner = ~s\ncurtag = ~s\n" s lst inner curtag)
    (cond
        [(equal? s "") lst]
        [(and
            (not (equal? curtag ""))
            (equal?
                (substring s 0 (+ (string-length curtag) 1))
                (string-append "</" (scdr curtag))))
                    (display "zero\n")
                    (xml->list-aux
                        (substring s 0 (+ 2 (string-length (scdr curtag))))
                        (if (zero? tagnestn)
                            (tag-not-opened-error)
                            #t)
                        (if (zero? tagnestn)
                            (tag-not-opened-error)
                            (sub1 tagnestn))
                        #f
                        (add
                            (add
                                (string-append "</" (scdr curtag))
                                inner)
                            lst)
                        '() "" "" "" #f)]
        [(equal? (scar s) #\<)
            (display "one\n")
            (let [(tag (try-collect-tag s))]
                (xml->list-aux
                    (substring
                        s
                        (string-length tag)
                        (string-length s)) 
                    #t (add1 tagnestn) #f lst
                    (add tag inner)
                    tag "" "" strlit?))]
        [(equal? (substring s 0 2) "/>")
            (display "two\n")
            (if (not (zero? tagnestn))
                (xml->list-aux
                    (substring s 2 (string-length s))
                    (if (zero? (- tagnestn 1))
                        #f
                        #t)
                    (sub1 tagnestn)
                    #f (if (not (null? inner))(add inner lst) lst) '() "" "" "" strlit?)
                (tag-not-opened-error))]
        [(equal? (scar s) #\>)
            (display "three\n")
            (if (not (zero? tagnestn))
                (xml->list-aux
                    (substring s 1 (string-length s))
                    (if (zero? tagnestn) #f #t) (sub1 tagnestn)
                    #f (if (not (null? inner))(add inner lst) lst) 
                    (add (string-append curtag (string (scar s))) inner) "" "" "" strlit?)
                (tag-not-opened-error))]
        [(char-whitespace? (scar s))
            (display "four\n")
            (xml->list-aux
                (scdr s) (if (zero? tagnestn) #f #t) tagnestn
                #f lst (if (not (equal? value "")) (add value inner) inner)
                curtag attribute value strlit?)]
        [(equal? (scar s) #\")
            (display "five\n")
            (xml->list-aux
                (scdr s) (if (zero? tagnestn) #f #t) tagnestn in-prolog? lst inner
                curtag attribute (string-append value (string #\")) (not strlit?))]
        [strlit?
            (display "six\n")
            (xml->list-aux
                (scdr s) (if (zero? tagnestn) #f #t) tagnestn in-prolog? lst inner
                curtag attribute (string-append value (string (scar s))) strlit?)]
        [(or
            (char-alphabetic? (scar s))
            (and
                (or
                    (not (equal? curtag ""))
                    (not (equal? attribute "")))
                (char-numeric? (scar s))))
                    (display "seven\n")
                    (xml->list-aux
                        (scdr s) (if (zero? tagnestn) #f #t) tagnestn in-prolog?
                        lst inner 
                        (if in-tag? (string-append curtag (string (scar s))) curtag)
                        (if 
                            (and 
                                (not in-tag?)
                                (not strlit?))
                                    (string-append attribute (string (scar s))) attribute)
                        (if strlit? (string-append value (string (scar s))) value) strlit?)]))