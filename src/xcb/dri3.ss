(import (enums))
(load "xproto.ss")(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [major_version unsigned-32]
    [minor_version unsigned-32]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-32]
    [minor_version unsigned-32]))
(define open-opcode 1)
(define-ftype open
  (struct
    [drawable unsigned-32]
    [provider unsigned-32]))
(define-ftype open-reply
  (struct
    [nfd unsigned-8]
    [pad0 (array 24 unsigned-8)]))
(define pixmapfrombuffer-opcode 2)
(define-ftype pixmapfrombuffer
  (struct
    [pixmap unsigned-32]
    [drawable unsigned-32]
    [size unsigned-32]
    [width unsigned-16]
    [height unsigned-16]
    [stride unsigned-16]
    [depth unsigned-8]
    [bpp unsigned-8]))
(define bufferfrompixmap-opcode 3)
(define-ftype bufferfrompixmap
  (struct
    [pixmap unsigned-32]))
(define-ftype bufferfrompixmap-reply
  (struct
    [nfd unsigned-8]
    [size unsigned-32]
    [width unsigned-16]
    [height unsigned-16]
    [stride unsigned-16]
    [depth unsigned-8]
    [bpp unsigned-8]
    [pad0 (array 12 unsigned-8)]))
(define fencefromfd-opcode 4)
(define-ftype fencefromfd
  (struct
    [drawable unsigned-32]
    [fence unsigned-32]
    [initially_triggered boolean]
    [pad0 (array 3 unsigned-8)]))
(define fdfromfence-opcode 5)
(define-ftype fdfromfence
  (struct
    [drawable unsigned-32]
    [fence unsigned-32]))
(define-ftype fdfromfence-reply
  (struct
    [nfd unsigned-8]
    [pad0 (array 24 unsigned-8)]))
(define getsupportedmodifiers-opcode 6)
(define-ftype getsupportedmodifiers
  (struct
    [window unsigned-32]
    [depth unsigned-8]
    [bpp unsigned-8]
    [pad0 (array 2 unsigned-8)]))
(define-ftype getsupportedmodifiers-reply
  (struct
    