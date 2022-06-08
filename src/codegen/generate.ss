(load "utility.ss")
(load "parse.ss")
(load "../lib/bitwise.ss")
(define tx
    (make-transcoder (utf-8-codec) (eol-style lf) (error-handling-mode raise)))

;;lists of the xml will be treated as C arrays.
(define data-structures (list 'struct 'union 'xidunion))

(define uint32s
    (list 
        'window 'pixmap 'cursor
        'gcontext 'font 'colormap
        'atom 'fontable 'visualid
        'drawable 'bool32 'timestap
        'keysym 'keycode32 'card32))

(define uint8s
    (list
        'byte 'card8 'depth))


;;for turning XML tokens into valid chez scheme types.
(define (safestring s)
    (strlit->string (string-downcase s)))


(define (list->code-aux port l depth current-node list-type)
    (display current-node) (newline)
    (cond
        ;;the code generation was successful, report it back to the user.
        [(null? l) #t]
        [(pair? current-node)
            (cond
                [(member (car current-node) data-structures)
                    (put-string
                        port
                        (format
                            "(define-ftype ~s\n  (~s\n    "
                            (string->symbol
                                (safestring
                                    (cadr
                                        (assoc
                                            'name
                                            (cdr current-node)))))
                            (car current-node)))
                    (list->code-aux port (cdr l) depth (cadr l) list-type)]
                [(equal? (car current-node) 'enum)
                    (let [(enum-name (safestring (cadr (assoc 'name (cdr current-node)))))]
                        (put-string port "    ))\n")
                        (put-string port
                            (format
                                "\n(define ~s (enum "
                                (string->symbol enum-name)))
                        (let loop [(enuml '()) (lc (cdr l)) (idx 0)]
                            (cond
                                [(null? lc)
                                    (put-string port (format "'~s))\n" enuml))]
                                [(member (caar lc) data-structures)
                                    (loop enuml '() idx)
                                    (list->code-aux port (cdr l) depth (cadr l) list-type)]
                                [(equal? (caar lc) 'item)
                                    (loop
                                        (add
                                            (add
                                                (cond
                                                    [(equal? (caadr lc) 'value)
                                                        (string->number (cadadr lc))]
                                                    [(equal? (caadr lc) 'bit)
                                                        (<< 1 (string->number (cadadr lc)))])
                                                (string->symbol
                                                    (string-append
                                                        enum-name
                                                        "-"
                                                        (safestring
                                                            (cadr
                                                                (assoc
                                                                    'name
                                                                    (cdar lc)))))))
                                            enuml)
                                        (cddr lc)
                                        idx)]
                                [else
                                    (loop enuml (cdr lc) (+ 1 idx))])))]
                [(equal? (car current-node) 'field)
                    (put-string
                        port
                        (format
                            "[~s ~s]~a    "
                            (cond
                                [(assoc 'enum (cdr current-node))
                                    (string->symbol
                                        (string-append
                                            (safestring
                                                (cadr
                                                    (assoc
                                                        'name
                                                        (cdr current-node))))
                                        "-enum"))]
                                [(assoc 'mask (cdr current-node))
                                    (string->symbol
                                        (string-append
                                            (safestring
                                                (cadr
                                                    (assoc
                                                        'name
                                                        (cdr current-node))))
                                            "-mask"))]
                                [else
                                    (string->symbol
                                        (safestring
                                            (cadr
                                                (assoc
                                                    'name
                                                    (cdr current-node)))))])
                            (string->symbol
                                (strlit->string
                                    (let
                                        [(t (safestring (cadr (assoc 'type (cdr current-node)))))]
                                        (cond
                                            [(member (string->symbol t) uint32s) "unsigned-32"]
                                            [(member (string->symbol t) uint8s) "unsigned-8"]
                                            [(equal? (string->symbol t) 'bool) "boolean"]
                                            [(equal? (string->symbol t) 'card16) "unsigned-16"]
                                            [else t]))))
                            (if (null? (cdr l)) "" "\n")))
                    (list->code-aux port (cdr l) depth (cadr l) list-type)]
                [(equal? (car current-node) 'list)
                    (list->code-aux
                        port
                        (cdr l)
                        depth
                        (cadr l)
                        (string->symbol
                            (let [(t (safestring (cadr (assoc 'type (cdr current-node)))))]
                                (cond
                                    [(member (string->symbol t) uint32s) "unsigned-32"]
                                    [(member (string->symbol t) uint8s) "unsigned-8"]
                                    [else (string->symbol t)]))))]
                [(equal? (car current-node) 'fieldref)
                    (put-string
                        port
                        (format
                            "[~s ~s]~a"
                            (string->symbol (cadr current-node))
                            list-type
                            (if (null? (cdr l)) "" "\n")))
                    (list->code-aux port (cdr l) depth (cadr l) list-type)]
                [(pair? (car current-node))
                    (list->code-aux port l depth (car current-node) list-type)])]
        [else
            #f]))

(define (list->code l port)
    (list->code-aux port l 0 l ""))

;;code to be executed, for tests
(define filename
    (open-file-output-port "xproto.ss" (file-options no-fail) (buffer-mode block) tx))

(define xml
    (remove-xcb-header
        (remove-xml-prolog
            (remove-cdata
                (remove-comments
                    (remove-newlines
                        (file->string "../xml/xproto.xml")))))))

(define l (xml->list xml))

(pretty-print l)

(list->code l filename)

(close-port filename)

(exit)