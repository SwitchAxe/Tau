(import (enums))
(load "xproto.ss")(define-ftype seg unsigned-32)
(define completion-number 0)
(define-ftype completion
    (struct
    [pad0 (array 1 unsigned-8)]
    [drawable unsigned-32]
    [minor_event unsigned-16]
    [major_event unsigned-8]
    [pad1 (array 1 unsigned-8)]
    [shmseg seg]
    [offset unsigned-32]))
(define-ftype queryversion-reply
  (struct
    [shared_pixmaps boolean]
    [major_version unsigned-16]
    [minor_version unsigned-16]
    [uid unsigned-16]
    [gid unsigned-16]
    [pixmap_format unsigned-8]
    [pad0 (array 15 unsigned-8)]))
(define attach-opcode 1)
(define-ftype attach
  (struct
    [shmseg seg]
    [shmid unsigned-32]
    [read_only boolean]
    [pad0 (array 3 unsigned-8)]))
(define detach-opcode 2)
(define-ftype detach
  (struct
    [shmseg seg]))
(define putimage-opcode 3)
(define-ftype putimage
  (struct
    [drawable unsigned-32]
    [gc unsigned-32]
    [total_width unsigned-16]
    [total_height unsigned-16]
    [src_x unsigned-16]
    [src_y unsigned-16]
    [src_width unsigned-16]
    [src_height unsigned-16]
    [dst_x integer-16]
    [dst_y integer-16]
    [depth unsigned-8]
    [format unsigned-8]
    [send_event boolean]
    [pad0 (array 1 unsigned-8)]
    [shmseg seg]
    [offset unsigned-32]))
(define getimage-opcode 4)
(define-ftype getimage
  (struct
    [drawable unsigned-32]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [plane_mask unsigned-32]
    [format unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [shmseg seg]
    [offset unsigned-32]))
(define-ftype getimage-reply
  (struct
    [depth unsigned-8]
    [visual unsigned-32]
    [size unsigned-32]))
(define createpixmap-opcode 5)
(define-ftype createpixmap
  (struct
    [pid unsigned-32]
    [drawable unsigned-32]
    [width unsigned-16]
    [height unsigned-16]
    [depth unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [shmseg seg]
    [offset unsigned-32]))
(define attachfd-opcode 6)
(define-ftype attachfd
  (struct
    [shmseg seg]
    [read_only boolean]
    [pad0 (array 3 unsigned-8)]))
(define createsegment-opcode 7)
(define-ftype createsegment
  (struct
    [shmseg seg]
    [size unsigned-32]
    [read_only boolean]
    [pad0 (array 3 unsigned-8)]))
(define-ftype createsegment-reply
  (struct
    [nfd unsigned-8]
    [pad0 (array 24 unsigned-8)]))
