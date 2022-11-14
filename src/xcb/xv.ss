(import (enums))
(load "xproto.ss")(load "shm.ss")(define-ftype port unsigned-32)
(define-ftype encoding unsigned-32)
(define type (enum
  '((type-inputmask 1)
  (type-outputmask 1)
  (type-videomask 2)
  (type-stillmask 4)
  (type-imagemask 8))))
(define imageformatinfotype (enum
  '((imageformatinfotype-rgb 0)
  (imageformatinfotype-yuv 0))))
(define imageformatinfoformat (enum
  '((imageformatinfoformat-packed 0)
  (imageformatinfoformat-planar 0))))
(define attributeflag (enum
  '((attributeflag-gettable 1)
  (attributeflag-settable 1))))
(define videonotifyreason (enum
  '((videonotifyreason-started 0)
  (videonotifyreason-stopped 0)
  (videonotifyreason-busy 1)
  (videonotifyreason-preempted 2)
  (videonotifyreason-harderror 3))))
(define scanlineorder (enum
  '((scanlineorder-toptobottom 0)
  (scanlineorder-bottomtotop 0))))
(define grabportstatus (enum
  '((grabportstatus-success 0)
  (grabportstatus-badextension 0)
  (grabportstatus-alreadygrabbed 1)
  (grabportstatus-invalidtime 2)
  (grabportstatus-badreply 3)
  (grabportstatus-badalloc 4))))
(define-ftype rational
  (struct
    [numerator integer-32]
    [denominator integer-32]))
(define-ftype format
  (struct
    [visual unsigned-32]
    [depth unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define-ftype adaptorinfo
  (struct
    [base_id port]
    [name_size unsigned-16]
    [num_ports unsigned-16]
    [num_formats unsigned-16]
    [type-mask unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [name (* unsigned-8)]
    [pad1 (array 4 unsigned-8)]
    [formats (* format)]))
(define-ftype encodinginfo
  (struct
    [encoding encoding]
    [name_size unsigned-16]
    [width unsigned-16]
    [height unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [rate rational]
    [name (* unsigned-8)]
    [pad1 (array 4 unsigned-8)]))
(define-ftype image
  (struct
    [id unsigned-32]
    [width unsigned-16]
    [height unsigned-16]
    [data_size unsigned-32]
    [num_planes unsigned-32]
    [pitches (* unsigned-32)]
    [offsets (* unsigned-32)]
    [data (* unsigned-8)]))
(define-ftype attributeinfo
  (struct
    [flags-mask unsigned-32]
    [min integer-32]
    [max integer-32]
    [size unsigned-32]
    [name (* unsigned-8)]
    [pad0 (array 4 unsigned-8)]))
(define-ftype imageformatinfo
  (struct
    [id unsigned-32]
    [type-enum unsigned-8]
    [byte_order-enum unsigned-8]
    [pad0 (array 2 unsigned-8)]
    [guid (array 16 (* unsigned-8))]
    [bpp unsigned-8]
    [num_planes unsigned-8]
    [pad1 (array 2 unsigned-8)]
    [depth unsigned-8]
    [pad2 (array 3 unsigned-8)]
    [red_mask unsigned-32]
    [green_mask unsigned-32]
    [blue_mask unsigned-32]
    [format-enum unsigned-8]
    [pad3 (array 3 unsigned-8)]
    [y_sample_bits unsigned-32]
    [u_sample_bits unsigned-32]
    [v_sample_bits unsigned-32]
    [vhorz_y_period unsigned-32]
    [vhorz_u_period unsigned-32]
    [vhorz_v_period unsigned-32]
    [vvert_y_period unsigned-32]
    [vvert_u_period unsigned-32]
    [vvert_v_period unsigned-32]
    [vcomp_order (array 32 (* unsigned-8))]
    [vscanline_order-enum unsigned-8]
    [pad4 (array 11 unsigned-8)]))
(define badport-error-number 0)
(define-ftype badport-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define badencoding-error-number 1)
(define-ftype badencoding-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define badcontrol-error-number 2)
(define-ftype badcontrol-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define videonotify-number 0)
(define-ftype videonotify
    (struct
    [reason-enum unsigned-8]
    [time timestamp]
    [drawable unsigned-32]
    [port port]))
(define portnotify-number 1)
(define-ftype portnotify
    (struct
    [pad5 (array 1 unsigned-8)]
    [time timestamp]
    [port port]
    [attribute unsigned-32]
    [value integer-32]))
(define-ftype queryextension-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major unsigned-16]
    [minor unsigned-16]))
(define queryadaptors-opcode 1)
(define-ftype queryadaptors
  (struct
    [window unsigned-32]))
(define-ftype queryadaptors-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_adaptors unsigned-16]
    [pad1 (array 22 unsigned-8)]
    [info (* adaptorinfo)]))
(define queryencodings-opcode 2)
(define-ftype queryencodings
  (struct
    [port port]))
(define-ftype queryencodings-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_encodings unsigned-16]
    [pad1 (array 22 unsigned-8)]
    [info (* encodinginfo)]))
(define grabport-opcode 3)
(define-ftype grabport
  (struct
    [port port]
    [time timestamp]))
(define-ftype grabport-reply
  (struct
    [result-enum unsigned-8]))
(define ungrabport-opcode 4)
(define-ftype ungrabport
  (struct
    [port port]
    [time timestamp]))
(define putvideo-opcode 5)
(define-ftype putvideo
  (struct
    [port port]
    [drawable unsigned-32]
    [gc unsigned-32]
    [vid_x integer-16]
    [vid_y integer-16]
    [vid_w unsigned-16]
    [vid_h unsigned-16]
    [drw_x integer-16]
    [drw_y integer-16]
    [drw_w unsigned-16]
    [drw_h unsigned-16]))
(define putstill-opcode 6)
(define-ftype putstill
  (struct
    [port port]
    [drawable unsigned-32]
    [gc unsigned-32]
    [vid_x integer-16]
    [vid_y integer-16]
    [vid_w unsigned-16]
    [vid_h unsigned-16]
    [drw_x integer-16]
    [drw_y integer-16]
    [drw_w unsigned-16]
    [drw_h unsigned-16]))
(define getvideo-opcode 7)
(define-ftype getvideo
  (struct
    [port port]
    [drawable unsigned-32]
    [gc unsigned-32]
    [vid_x integer-16]
    [vid_y integer-16]
    [vid_w unsigned-16]
    [vid_h unsigned-16]
    [drw_x integer-16]
    [drw_y integer-16]
    [drw_w unsigned-16]
    [drw_h unsigned-16]))
(define getstill-opcode 8)
(define-ftype getstill
  (struct
    [port port]
    [drawable unsigned-32]
    [gc unsigned-32]
    [vid_x integer-16]
    [vid_y integer-16]
    [vid_w unsigned-16]
    [vid_h unsigned-16]
    [drw_x integer-16]
    [drw_y integer-16]
    [drw_w unsigned-16]
    [drw_h unsigned-16]))
(define stopvideo-opcode 9)
(define-ftype stopvideo
  (struct
    [port port]
    [drawable unsigned-32]))
(define selectvideonotify-opcode 10)
(define-ftype selectvideonotify
  (struct
    [drawable unsigned-32]
    [onoff boolean]
    [pad0 (array 3 unsigned-8)]))
(define selectportnotify-opcode 11)
(define-ftype selectportnotify
  (struct
    [port port]
    [onoff boolean]
    [pad0 (array 3 unsigned-8)]))
(define querybestsize-opcode 12)
(define-ftype querybestsize
  (struct
    [port port]
    [vid_w unsigned-16]
    [vid_h unsigned-16]
    [drw_w unsigned-16]
    [drw_h unsigned-16]
    [motion boolean]
    [pad0 (array 3 unsigned-8)]))
(define-ftype querybestsize-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [actual_width unsigned-16]
    [actual_height unsigned-16]))
(define setportattribute-opcode 13)
(define-ftype setportattribute
  (struct
    [port port]
    [attribute unsigned-32]
    [value integer-32]))
(define getportattribute-opcode 14)
(define-ftype getportattribute
  (struct
    [port port]
    [attribute unsigned-32]))
(define-ftype getportattribute-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [value integer-32]))
(define queryportattributes-opcode 15)
(define-ftype queryportattributes
  (struct
    [port port]))
(define-ftype queryportattributes-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_attributes unsigned-32]
    [text_size unsigned-32]
    [pad1 (array 16 unsigned-8)]
    [attributes (* attributeinfo)]))
(define listimageformats-opcode 16)
(define-ftype listimageformats
  (struct
    [port port]))
(define-ftype listimageformats-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_formats unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [format (* imageformatinfo)]))
(define queryimageattributes-opcode 17)
(define-ftype queryimageattributes
  (struct
    [port port]
    [id unsigned-32]
    [width unsigned-16]
    [height unsigned-16]))
(define-ftype queryimageattributes-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_planes unsigned-32]
    [data_size unsigned-32]
    [width unsigned-16]
    [height unsigned-16]
    [pad1 (array 12 unsigned-8)]
    [pitches (* unsigned-32)]
    [offsets (* unsigned-32)]))
(define putimage-opcode 18)
(define-ftype putimage
  (struct
    [port port]
    [drawable unsigned-32]
    [gc unsigned-32]
    [id unsigned-32]
    [src_x integer-16]
    [src_y integer-16]
    [src_w unsigned-16]
    [src_h unsigned-16]
    [drw_x integer-16]
    [drw_y integer-16]
    [drw_w unsigned-16]
    [drw_h unsigned-16]
    [width unsigned-16]
    [height unsigned-16]
    [data unsigned-8]))
(define shmputimage-opcode 19)
(define-ftype shmputimage
  (struct
    [port port]
    [drawable unsigned-32]
    [gc unsigned-32]
    [shmseg seg]
    [id unsigned-32]
    [offset unsigned-32]
    [src_x integer-16]
    [src_y integer-16]
    [src_w unsigned-16]
    [src_h unsigned-16]
    [drw_x integer-16]
    [drw_y integer-16]
    [drw_w unsigned-16]
    [drw_h unsigned-16]
    [width unsigned-16]
    [height unsigned-16]
    [send_event unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define-ftype imageformatinfo-iterator
  (struct
    [data (* imageformatinfo)]
    [rem int]
    [index int]))
(define-ftype attributeinfo-iterator
  (struct
    [data (* attributeinfo)]
    [rem int]
    [index int]))
(define-ftype image-iterator
  (struct
    [data (* image)]
    [rem int]
    [index int]))
(define-ftype encodinginfo-iterator
  (struct
    [data (* encodinginfo)]
    [rem int]
    [index int]))
(define-ftype adaptorinfo-iterator
  (struct
    [data (* adaptorinfo)]
    [rem int]
    [index int]))
(define-ftype format-iterator
  (struct
    [data (* format)]
    [rem int]
    [index int]))
(define-ftype rational-iterator
  (struct
    [data (* rational)]
    [rem int]
    [index int]))
(define-ftype surfaceinfo-iterator
  (struct
    [data (* surfaceinfo)]
    [rem int]
    [index int]))
(define-ftype byte-iterator
  (struct
    [data (* unsigned-8)]
    [rem int]
    [index int]))
