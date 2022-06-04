(load "utility.ss");; for various utility functions
(load "memoization.ss");; for the 'memoize' function
(load "readfile.ss");; for file-reading utilities
(define comment-start "<!--")
(define comment-end "-->")
;;----------------------various functions to prepare the document-----------------------------------
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

(define (remove-newlines s)
    (list->string
        (filter
            (lambda (ch) (if (equal? ch #\newline) #f #t))
            (string->list s))))


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
(define (get-top l)
    (car (reverse l)))

(define (xml-string-literal? s)
    (and 
        (equal? (car (string->list s)) #\")
        (equal? (car (reverse (string->list s))) #\")))


;;returns #f in case of failure
(define (xml-parse-tag-aux tagstring avp)
    (cond
        [(equal? tagstring "") '()]
        [(equal? (scar tagstring) #\>) '()]
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
                            (substring tagstring (+ 1 (string-length strlit)) (string-length tagstring))
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

(define (xml->list-aux xmlstring tagstack tag-openers result)
    (let [(nextchar (scar xmlstring))]
        (cond
            [(equal? nextchar #f)
                (if (null? tagstack)
                    result
                    (raise
                        (condition
                            (make-error)
                            (make-message-condition
                                "Unclosed tags! Invalid XML.\n"))))]
            [(and
                (>= (string-length xmlstring) 2)
                (equal? (substring xmlstring 0 2) "/>"))
                    ;;pop the current tag from the tagstack
                    (set! tagstack (pop tagstack))
                    (set! xmlstring
                        (substring xmlstring 2 (string-length xmlstring)))
                    (xml->list-aux xmlstring tagstack tag-openers result)]
            [(and
                (> (string-length xmlstring) 2)
                (equal? (substring xmlstring 0 2) "</"))
                    (let* 
                        [(tag-closer (try-collect-tag xmlstring))
                        (closing-tag (substring tag-closer 2 (sub1 (string-length tag-closer))))]
                            (if (equal? (get-top tagstack) closing-tag)
                                (begin
                                    (set! tagstack (pop tagstack))
                                    (set!
                                        xmlstring
                                        (substring
                                            xmlstring
                                            (string-length tag-closer)
                                            (string-length xmlstring)))
                                    (xml->list-aux xmlstring tagstack tag-openers result))
                                (raise
                                    (condition
                                        (make-error)
                                        (make-message-condition
                                            "Invalid XML: tags don't match!\n")))))]
            [(equal? nextchar #\<)
                (let*
                    [(rawtag (string-append (collect-until xmlstring #\>) ">"))
                    (tag-opener (xml-parse-tag rawtag))
                    (opening-tag (symbol->string (car tag-opener)))]
                        (unless (equal? (string-ref rawtag (- (string-length rawtag) 2)) #\/)
                            (set! tagstack (push opening-tag tagstack)))
                        (set!
                            xmlstring
                            (substring
                                xmlstring
                                (string-length rawtag)
                                (string-length xmlstring)))
                        (set! result (add tag-opener result))
                        (set! tag-openers (push tag-opener tag-openers))
                        (xml->list-aux xmlstring tagstack tag-openers result))]
            [(char-whitespace? nextchar)
                (xml->list-aux (scdr xmlstring) tagstack tag-openers result)]
            [(equal? nextchar #\")
                (set! xmlstring (scdr xmlstring))
                (let 
                    [(strlit (collect-until xmlstring #\"))
                    (innermost-tag (car (reverse result)))]
                    (and
                        strlit
                        (begin
                            (set! innermost-tag
                                (add (string-append "\"" strlit "\"") innermost-tag))
                            (set! result (add innermost-tag (pop result)))
                            (set! xmlstring
                                (substring
                                    xmlstring
                                    (+ 1 (string-length strlit))
                                    (string-length xmlstring)))
                            (xml->list-aux xmlstring tagstack tag-openers result))))]
            [(or
                (char-alphabetic? nextchar)
                (char-numeric? nextchar))
                    (let
                        [
                            (constant
                                (remove-trailing-spaces
                                    (remove-leading-spaces
                                        (collect-until xmlstring #\<))))
                            (innermost-tag (car (reverse result)))]
                        ;;cleaning the constant by removing (leading and trailing) whitespaces
                        (and
                            (not (null? tagstack))
                            constant
                            (begin
                                (set! innermost-tag (add constant innermost-tag))
                                (set! result (add innermost-tag (pop result)))
                                (set! xmlstring
                                    (substring
                                        xmlstring
                                        (string-length constant)
                                        (string-length xmlstring)))
                                (xml->list-aux xmlstring tagstack tag-openers result))))])))

;;wrapper to the xml->list-aux function, which also memoizes it.
(define xml->list
    (memoize (lambda (xml) (xml->list-aux xml '() '() '()))))