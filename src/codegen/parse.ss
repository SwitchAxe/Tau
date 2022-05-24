(load "utility.ss");; for various utility functions
(load "memoization.ss");; for the 'memoize' function
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
                    (let [(s3 (string-collect-until s ">"))]
                        (if (string? s3)
                            s3
                            #f)))))))

;;stack operations on lists, used for the tag stack in the main function of this file.
(define (push e l)
    (add e l))
(define (pop l)
    (reverse (cdr (reverse l))))

(define (xml-string-literal? s)
    (and 
        (equal? (car (string->list s)) #\")
        (equal? (car (reverse (string->list s))) #\")))


;;returns #f in case of failure
(define (xml-parse-tag-aux tagstring avp)
    (cond
        [(equal? tagstring "") '()]
        [(equal? (scdr tagstring) ">") '()]
        [(equal? (substring tagstring 0 2) "/>") '()]
        [(equal? (scar tagstring) #\<)
            ;;accumulate until the first space
            (let [(tag (try-collect-tag tagstring))]
                (cons
                    (string->symbol
                        (substring
                            tag
                            1
                            (if (equal? (string-ref tag (sub1 (string-length tag))) #\>)
                                (sub1 (string-length tag))
                                (string-length tag))))
                    (xml-parse-tag-aux
                        (substring tagstring (string-length tag) (string-length tagstring))
                        '())))]
        [(char-whitespace? (scar tagstring))
            (if (not (null? avp))
                (cons avp (xml-parse-tag-aux (scdr tagstring) '()))
                (xml-parse-tag-aux (scdr tagstring) '()))]
        [(equal? (scar tagstring) #\")
            (set! tagstring (scdr tagstring))
            (let [(strlit (collect-until tagstring #\"))]
                (and
                    strlit
                    (cons
                        (add (string-append "\"" strlit "\"") avp)
                        (xml-parse-tag-aux
                            (substring tagstring (string-length strlit) (string-length tagstring))
                            '()))))]
        [else
            (let [(attr (collect-until tagstring #\=))]
                (and
                    attr
                    (xml-parse-tag-aux
                        (substring tagstring (+ 1 (string-length attr)) (string-length tagstring))
                        (if (null? avp)
                            (add (string->symbol attr) avp)
                            (raise
                                (condition
                                    (make-error)
                                    (make-message-condition
                                        "Ill-formed XML tag!")))))))]))

(define (xml-parse-tag s)
    (xml-parse-tag-aux s '()))

(define (xml-parse-closing-tag s)
    (and
        (equal? (substring s 0 2) "</")
        (substring s 2 (sub1 (string-length s)))))

(define (xml->list-aux s tagstack result)
    (let [(nextchar (scar s))]
        (cond
            [(equal? nextchar #f) ;;end of the string
                (if (null? tagstack)
                    '()
                    (raise
                        (condition
                            (make-error)
                            (make-message-condition
                                "Invalid XML! probably a tag was not closed.\n"))))]
            [(equal? (substring s 0 2) "</")
                (let* 
                    [(tag-closer (try-collect-tag s))
                    (closing-tag (substring tag-closer 2 (sub1 (string-length tag-closer))))]
                        (if (equal? closing-tag (symbol->string (car (reverse tagstack))))
                            (begin
                                (set! tagstack (pop tagstack))
                                (cons
                                    result
                                        (xml->list-aux
                                            (substring
                                                s
                                                (string-length tag-closer)
                                                (string-length s))
                                            tagstack '())))
                            (raise
                                (condition
                                    (make-error)
                                    (make-message-condition "Invalid XML!\n")))))]
            [(equal? nextchar #\<)
                (let*
                    [(tagstring (collect-until s #\>))
                    (tag-opener (xml-parse-tag (string-append tagstring ">")))]
                    (set! tagstack (push (car tag-opener) tagstack))
                    (xml->list-aux
                        (substring
                            s
                            (+ 1 (string-length tagstring))
                            (string-length s))
                        tagstack
                        (add 
                            tag-opener
                            (if (= 1 (length tagstack))
                                result
                                (car result)))))]
            [(equal? nextchar #\")
                (let [(strlit (string-append (string #\") (collect-until (scdr s) #\")))]
                    (if strlit
                        (begin
                            (set! result (add (string-append strlit "\"") result))
                            (xml->list-aux
                                (substring
                                    s
                                    (+ 1 (string-length strlit))
                                    (string-length s))
                                tagstack
                                result))))]
            [(char-numeric? nextchar)
                ;;loop and accumulate until a non-numeric char is found
                (let loop [(lst '())]
                    (set! s (scdr s))
                    (unless (char-numeric? (scar s)) ;;we found a non-numeric character
                        (set! result (add (list->number lst) result))
                        (cons
                            result
                            (xml->list-aux
                                s
                                tagstack
                                result)))
                    (when (char-numeric? (scar s))
                        (loop (add (scar s) lst))))]
            [(char-whitespace? nextchar)
                (xml->list-aux (scdr s) tagstack result)])))
