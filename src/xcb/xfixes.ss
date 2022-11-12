(import (enums))
(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [client_major_version unsigned-32]
    [client_minor_version unsigned-32]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-32]
    [minor_version unsigned-32]
    [pad1 (array 16 unsigned-8)]))
(define savesetmode (enum
  '((savesetmode-insert 0)
  (savesetmode-delete 0))))
(define savesettarget (enum
  '((savesettarget-nearest 0)
  (savesettarget-root 0))))
(define savesetmapping (enum
  '((savesetmapping-map 0)
  (savesetmapping-unmap 0))))
(define changesaveset-opcode 1)
(define-ftype changesaveset
  (struct
    [mode-enum unsigned-8]
    [target-enum unsigned-8]
    [map-enum unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))
(define selectionevent (enum
  '((selectionevent-setselectionowner 0)
  (selectionevent-selectionwindowdestroy 0)
  (selectionevent-selectionclientclose 1))))
(define selectioneventmask (enum
  '((selectioneventmask-setselectionowner 1)
  (selectioneventmask-selectionwindowdestroy 1)
  (selectioneventmask-selectionclientclose 2))))
(define selectionnotify-number 0)
(define-ftype selectionnotify
    (struct
    [subtype-enum unsigned-8]
    [window unsigned-32]
    [owner unsigned-32]
    [selection unsigned-32]
    [timestamp timestamp]
    [selection_timestamp timestamp]
    [pad0 (array 8 unsigned-8)]))
(define selectselectioninput-opcode 2)
(define-ftype selectselectioninput
  (struct
    [window unsigned-32]
    [selection unsigned-32]
    [event_mask-mask unsigned-32]))
(define cursornotify (enum
  '((cursornotify-displaycursor 0))))
(define cursornotifymask (enum
  '((cursornotifymask-displaycursor 1))))
(define cursornotify-number 1)
(define-ftype cursornotify
    (struct
    [subtype-enum unsigned-8]
    [window unsigned-32]
    [cursor_serial unsigned-32]
    [timestamp timestamp]
    [name unsigned-32]
    [pad0 (array 12 unsigned-8)]))
(define selectcursorinput-opcode 3)
(define-ftype selectcursorinput
  (struct
    [window unsigned-32]
    [event_mask-mask unsigned-32]))
(define-ftype getcursorimage-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [xhot unsigned-16]
    [yhot unsigned-16]
    [cursor_serial unsigned-32]
    [pad1 (array 8 unsigned-8)]
    [cursor_image (* unsigned-32)]))
(define-ftype region unsigned-32)
(define badregion-error-number 0)
(define-ftype badregion-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define region (enum
  '((region-none 0))))
(define createregion-opcode 5)
(define-ftype createregion
  (struct
    [region region]
    [rectangles rectangle]))
(define createregionfrombitmap-opcode 6)
(define-ftype createregionfrombitmap
  (struct
    [region region]
    [bitmap unsigned-32]))
(define createregionfromwindow-opcode 7)
(define-ftype createregionfromwindow
  (struct
    [region region]
    [window unsigned-32]
    [kind-enum shape:kind]
    [pad0 (array 3 unsigned-8)]))
(define createregionfromgc-opcode 8)
(define-ftype createregionfromgc
  (struct
    [region region]
    [gc unsigned-32]))
(define createregionfrompicture-opcode 9)
(define-ftype createregionfrompicture
  (struct
    [region region]
    [picture picture]))
(define destroyregion-opcode 10)
(define-ftype destroyregion
  (struct
    [region region]))
(define setregion-opcode 11)
(define-ftype setregion
  (struct
    [region region]
    [rectangles rectangle]))
(define copyregion-opcode 12)
(define-ftype copyregion
  (struct
    [source region]
    [destination region]))
(define unionregion-opcode 13)
(define-ftype unionregion
  (struct
    [source1 region]
    [source2 region]
    [destination region]))
(define intersectregion-opcode 14)
(define-ftype intersectregion
  (struct
    [source1 region]
    [source2 region]
    [destination region]))
(define subtractregion-opcode 15)
(define-ftype subtractregion
  (struct
    [source1 region]
    [source2 region]
    [destination region]))
(define invertregion-opcode 16)
(define-ftype invertregion
  (struct
    [source region]
    [bounds rectangle]
    [destination region]))
(define translateregion-opcode 17)
(define-ftype translateregion
  (struct
    [region region]
    [dx integer-16]
    [dy integer-16]))
(define regionextents-opcode 18)
(define-ftype regionextents
  (struct
    [source region]
    [destination region]))
(define fetchregion-opcode 19)
(define-ftype fetchregion
  (struct
    [region region]))
(define-ftype fetchregion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [extents rectangle]
    [pad1 (array 16 unsigned-8)]
    [rectangles (array 2 rectangle)]))
(define setgcclipregion-opcode 20)
(define-ftype setgcclipregion
  (struct
    [gc unsigned-32]
    [region region]
    [x_origin integer-16]
    [y_origin integer-16]))
(define setwindowshaperegion-opcode 21)
(define-ftype setwindowshaperegion
  (struct
    [dest unsigned-32]
    [dest_kind-enum shape:kind]
    [pad0 (array 3 unsigned-8)]
    [x_offset integer-16]
    [y_offset integer-16]
    [region region]))
(define setpictureclipregion-opcode 22)
(define-ftype setpictureclipregion
  (struct
    [picture picture]
    [region region]
    [x_origin integer-16]
    [y_origin integer-16]))
(define setcursorname-opcode 23)
(define-ftype setcursorname
  (struct
    [cursor unsigned-32]
    [nbytes unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [name (* unsigned-8)]))
(define getcursorname-opcode 24)
(define-ftype getcursorname
  (struct
    [cursor unsigned-32]))
(define-ftype getcursorname-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [atom unsigned-32]
    [nbytes unsigned-16]
    [pad1 (array 18 unsigned-8)]
    [name (* unsigned-8)]))
(define-ftype getcursorimageandname-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [xhot unsigned-16]
    [yhot unsigned-16]
    [cursor_serial unsigned-32]
    [cursor_atom unsigned-32]
    [nbytes unsigned-16]
    [pad1 (array 2 unsigned-8)]
    [cursor_image (* unsigned-32)]
    [name (* unsigned-8)]))
(define changecursor-opcode 26)
(define-ftype changecursor
  (struct
    [source unsigned-32]
    [destination unsigned-32]))
(define changecursorbyname-opcode 27)
(define-ftype changecursorbyname
  (struct
    [src unsigned-32]
    [nbytes unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [name (* unsigned-8)]))
(define expandregion-opcode 28)
(define-ftype expandregion
  (struct
    [source region]
    [destination region]
    [left unsigned-16]
    [right unsigned-16]
    [top unsigned-16]
    [bottom unsigned-16]))
(define hidecursor-opcode 29)
(define-ftype hidecursor
  (struct
    [window unsigned-32]))
(define showcursor-opcode 30)
(define-ftype showcursor
  (struct
    [window unsigned-32]))
(define-ftype barrier unsigned-32)
(define barrierdirections (enum
  '((barrierdirections-positivex 1)
  (barrierdirections-positivey 1)
  (barrierdirections-negativex 2)
  (barrierdirections-negativey 4))))
(define createpointerbarrier-opcode 31)
(define-ftype createpointerbarrier
  (struct
    [barrier barrier]
    [window unsigned-32]
    [x1 unsigned-16]
    [y1 unsigned-16]
    [x2 unsigned-16]
    [y2 unsigned-16]
    [directions-mask unsigned-32]
    [pad0 (array 2 unsigned-8)]
    [num_devices unsigned-16]
    [devices (* unsigned-16)]))
(define deletepointerbarrier-opcode 32)
(define-ftype deletepointerbarrier
  (struct
    [barrier barrier]))
(define clientdisconnectflags (enum
  '((clientdisconnectflags-default 0)
  (clientdisconnectflags-terminate 0))))
(define setclientdisconnectmode-opcode 33)
(define-ftype setclientdisconnectmode
  (struct
    [disconnect_mode-mask unsigned-32]))
(define-ftype getclientdisconnectmode-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [disconnect_mode-mask unsigned-32]
    [pad1 (array 20 unsigned-8)]))
