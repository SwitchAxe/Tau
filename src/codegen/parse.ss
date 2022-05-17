(load "utility.ss");; for various utility functions
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

(define (match lookahead predicate-or-char)
    (cond
        [(procedure? predicate-or-char)
            (equal? (predicate-or-char lookahead) #t) #t]
        [(char? predicate-or-char)
            (equal? lookahead predicate-or-char) #t]
        [else
            (raise
                (condition
                    (make-error)
                    (make-message-condition
                        "Error while parsing the XML string!\n")))]))

;;stack operations on lists, used for the tag stack in the main function of this file.
(define (push e l)
    (add e l))
(define (pop l)
    (reverse (cdr (reverse l))))

;;avp is an attribute-value pair
(define (xml->list-aux s lst inner current-tag open-tags attribute value avp strlit? tag-closing?)
    (printf "s = ~s\ncurrent tag = ~s\nattribute = ~s\nvalue = ~s\nopen-tags = ~s\navp = ~s\nstrlit? = ~s\n"
        s current-tag attribute value open-tags avp strlit?)
    (let [(lookahead (scar s))]
        (cond
            [(equal? s "")
                (if (null? open-tags)
                    lst
                    (raise
                        (condition
                            (make-error)
                            (make-message-condition
                                "Error! unclosed tags, Invalid XML."))))]
            ;;;"normal tag" closing section
            [(and (>= (string-length s) 2) (equal? (substring s 0 2) "</"))
                (xml->list-aux
                    (substring s 2 (string-length s)) lst (add (string-append "</" (scdr current-tag)) inner)
                    (car open-tags) (pop open-tags) "" "" '() #f #t)]
            ;;;"normal tag" opening/closing ('>' can be used for closing a tag too) section
            [(equal? lookahead #\<)
                (xml->list-aux (scdr s) lst inner "<" (push current-tag open-tags) "" "" '() #f #f)]
            [(equal? lookahead #\>)
                (xml->list-aux
                    (scdr s) lst inner (if tag-closing? "" (string-append current-tag ">"))
                    (if tag-closing? (pop open-tags) (push (string-append current-tag ">") open-tags))
                    "" "" '() #f #f)]
            [(member? lookahead '(#\tab #\space))
                (if strlit?
                    (begin
                        (set! value (string-append value (string lookahead)))
                        (xml->list-aux (scdr s) lst inner current-tag open-tags attribute value avp strlit? #f))
                    (if (equal? value "")
                        (xml->list-aux
                            (scdr s)
                            lst
                            inner
                            current-tag
                            open-tags
                            attribute
                            ""
                            '()
                            #f
                            #f)
                        (xml->list-aux (scdr s) lst (add avp inner) current-tag open-tags attribute "" '() strlit?)))]
            [(equal? lookahead #\")
                (set! value (string-append value (string lookahead))) 
                (xml->list-aux
                    (scdr s) lst inner current-tag open-tags attribute
                    (if strlit? "" value) (if strlit? (add value avp) avp) (not strlit?) tag-closing?)]
            [strlit?
                (set! value (string-append value (string lookahead)))
                (xml->list-aux (scdr s) lst inner current-tag open-tags attribute value avp strlit? #f)]
            [(and (>= (string-length s) 2) (equal? (substring s 0 2) "<?"))
                (xml->list-aux
                    (substring s 2 (string-length s))
                    lst (add '? inner) "?" (push "?" open-tags)
                    "" "" '() #f #f)]
            [(and (>= (string-length s) 2) (equal? (substring s 0 2) "?>"))
                (if (and (pair? open-tags) (equal? (car open-tags) "?"))
                    (xml->list-aux
                        (substring s 2 (string-length s))
                        (add (add "?" inner) lst) '() ""
                        (pop open-tags) "" "" '() #f #f)
                    (raise
                        (condition
                            (make-error)
                            (make-message-condition
                                "closed a prolog without an opening '<?'!"))))]
            [(equal? lookahead #\=)
                (if (equal? attribute "")
                    (raise
                        (condition
                            (make-error)
                            (make-message-condition
                                "Invalid tag: '=' without a previous attribute!")))
                    (xml->list-aux
                        (scdr s) lst inner current-tag open-tags "" "" (add attribute avp) #f #f))]
            ;;;character collecting section
            [(or
                (char-alphabetic? lookahead)
                (and
                    (or (not (equal? current-tag "")) (not (equal? attribute "")))
                    (char-numeric? lookahead)))
                        (if (not tag-closing?)
                            (xml->list-aux
                                (scdr s) lst inner "" open-tags 
                                (string-append attribute (string lookahead))
                                "" '() #f tag-closing?)
                            (xml->list-aux
                                (scdr s) lst inner (string-append current-tag (string lookahead))
                                open-tags "" "" '() #f tag-closing?))])))
(define (xml->list s)
    (xml->list-aux s '() '() "" '() "" "" '() #f #f))
