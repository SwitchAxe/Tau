(import (enums))
(load "xproto.ss")(define-ftype printer
  (struct
    [namelen unsigned-32]
    [name (* unsigned-8)]
    [pad0 (array 4 unsigned-8)]
    [desclen unsigned-32]
    [description (* unsigned-8)]
    [pad1 (array 4 unsigned-8)]))
(define-ftype pcontext unsigned-32)
(define getdoc (enum
  '((getdoc-finished 0)
  (getdoc-secondconsumer 0))))
(define evmask (enum
  '((evmask-noeventmask 0)
  (evmask-printmask 0)
  (evmask-attributemask 1))))
(define detail (enum
  '((detail-startjobnotify 1)
  (detail-endjobnotify 1)
  (detail-startdocnotify 2)
  (detail-enddocnotify 3)
  (detail-startpagenotify 4)
  (detail-endpagenotify 5))))
(define attr (enum
  '((attr-jobattr 1)
  (attr-docattr 1)
  (attr-pageattr 2)
  (attr-printerattr 3)
  (attr-serverattr 4)
  (attr-mediumattr 5)
  (attr-spoolerattr 6))))
(define-ftype printqueryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-16]
    [minor_version unsigned-16]))
(define printgetprinterlist-opcode 1)
(define-ftype printgetprinterlist
  (struct
    [printernamelen unsigned-32]
    [localelen unsigned-32]
    [printer_name (* unsigned-8)]
    [pad0 (array 4 unsigned-8)]
    [locale (* unsigned-8)]))
(define-ftype printgetprinterlist-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [listcount unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [printers (* printer)]))
(define printrehashprinterlist-opcode 20)
(define-ftype printrehashprinterlist
  (struct
    (define createcontext-opcode 2)
(define-ftype createcontext
  (struct
    [context_id unsigned-32]
    [printernamelen unsigned-32]
    [localelen unsigned-32]
    [printername (* unsigned-8)]
    [pad0 (array 4 unsigned-8)]
    [locale (* unsigned-8)]))
(define printsetcontext-opcode 3)
(define-ftype printsetcontext
  (struct
    [context unsigned-32]))
(define-ftype printgetcontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context unsigned-32]))
(define printdestroycontext-opcode 5)
(define-ftype printdestroycontext
  (struct
    [context unsigned-32]))
(define-ftype printgetscreenofcontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [root unsigned-32]))
(define printstartjob-opcode 7)
(define-ftype printstartjob
  (struct
    [output_mode unsigned-8]))
(define printendjob-opcode 8)
(define-ftype printendjob
  (struct
    [cancel boolean]))
(define printstartdoc-opcode 9)
(define-ftype printstartdoc
  (struct
    [driver_mode unsigned-8]))
(define printenddoc-opcode 10)
(define-ftype printenddoc
  (struct
    [cancel boolean]))
(define printputdocumentdata-opcode 11)
(define-ftype printputdocumentdata
  (struct
    [drawable unsigned-32]
    [len_data unsigned-32]
    [len_fmt unsigned-16]
    [len_options unsigned-16]
    [data (* unsigned-8)]
    [pad0 (array 4 unsigned-8)]
    [doc_format (* unsigned-8)]
    [pad1 (array 4 unsigned-8)]
    [options (* unsigned-8)]))
(define printgetdocumentdata-opcode 12)
(define-ftype printgetdocumentdata
  (struct
    [context pcontext]
    [max_bytes unsigned-32]))
(define-ftype printgetdocumentdata-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [status_code unsigned-32]
    [finished_flag unsigned-32]
    [datalen unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [data (* unsigned-8)]))
(define printstartpage-opcode 13)
(define-ftype printstartpage
  (struct
    [window unsigned-32]))
(define printendpage-opcode 14)
(define-ftype printendpage
  (struct
    [cancel boolean]
    [pad0 (array 3 unsigned-8)]))
(define printselectinput-opcode 15)
(define-ftype printselectinput
  (struct
    [context pcontext]
    [event_mask unsigned-32]))
(define printinputselected-opcode 16)
(define-ftype printinputselected
  (struct
    [context pcontext]))
(define-ftype printinputselected-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [event_mask unsigned-32]
    [all_events_mask unsigned-32]))
(define printgetattributes-opcode 17)
(define-ftype printgetattributes
  (struct
    [context pcontext]
    [pool unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define-ftype printgetattributes-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [stringlen unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [attributes (* unsigned-8)]))
(define printgetoneattributes-opcode 19)
(define-ftype printgetoneattributes
  (struct
    [context pcontext]
    [namelen unsigned-32]
    [pool unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [name (* unsigned-8)]))
(define-ftype printgetoneattributes-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [valuelen unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [value (* unsigned-8)]))
(define printsetattributes-opcode 18)
(define-ftype printsetattributes
  (struct
    [context pcontext]
    [stringlen unsigned-32]
    [pool unsigned-8]
    [rule unsigned-8]
    [pad0 (array 2 unsigned-8)]
    [attributes unsigned-8]))
(define printgetpagedimensions-opcode 21)
(define-ftype printgetpagedimensions
  (struct
    [context pcontext]))
(define-ftype printgetpagedimensions-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [width unsigned-16]
    [height unsigned-16]
    [offset_x unsigned-16]
    [offset_y unsigned-16]
    [reproducible_width unsigned-16]
    [reproducible_height unsigned-16]))
(define-ftype printqueryscreens-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [listcount unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [roots (* unsigned-32)]))
(define printsetimageresolution-opcode 23)
(define-ftype printsetimageresolution
  (struct
    [context pcontext]
    [image_resolution unsigned-16]))
(define-ftype printsetimageresolution-reply
  (struct
    [status boolean]
    [previous_resolutions unsigned-16]))
(define printgetimageresolution-opcode 24)
(define-ftype printgetimageresolution
  (struct
    [context pcontext]))
(define-ftype printgetimageresolution-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [image_resolution unsigned-16]))
(define notify-number 0)
(define-ftype notify
    (struct
    [detail unsigned-8]
    [context pcontext]
    [cancel boolean]))
(define attributnotify-number 1)
(define-ftype attributnotify
    (struct
    [detail unsigned-8]
    [context pcontext]))
(define badcontext-error-number 0)
(define-ftype badcontext-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define badsequence-error-number 1)
(define-ftype badsequence-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define-ftype printer-iterator (struct
  [data (* printer)]
[rem int]
  [index int]))
(define-ftype listitem-iterator (struct
  [data (* listitem)]
[rem int]
  [index int]))
(define-ftype imageformatinfo-iterator (struct
  [data (* imageformatinfo)]
[rem int]
  [index int]))
(define-ftype attributeinfo-iterator (struct
  [data (* attributeinfo)]
[rem int]
  [index int]))
(define-ftype image-iterator (struct
  [data (* image)]
[rem int]
  [index int]))
(define-ftype encodinginfo-iterator (struct
  [data (* encodinginfo)]
[rem int]
  [index int]))
(define-ftype adaptorinfo-iterator (struct
  [data (* adaptorinfo)]
[rem int]
  [index int]))
(define-ftype format-iterator (struct
  [data (* format)]
[rem int]
  [index int]))
(define-ftype rational-iterator (struct
  [data (* rational)]
[rem int]
  [index int]))
(define-ftype surfaceinfo-iterator (struct
  [data (* surfaceinfo)]
[rem int]
  [index int]))
(define-ftype string8-iterator
  (struct
    [data (* unsigned-8)]
    [rem int]
    [index int]))
