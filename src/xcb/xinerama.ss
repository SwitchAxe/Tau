(import (enums))
(load "xproto.ss")(define-ftype screeninfo
  (struct
    [x_org integer-16]
    [y_org integer-16]
    [width unsigned-16]
    [height unsigned-16]))
(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [major unsigned-8]
    [minor unsigned-8]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major unsigned-16]
    [minor unsigned-16]))
(define getstate-opcode 1)
(define-ftype getstate
  (struct
    [window unsigned-32]))
(define-ftype getstate-reply
  (struct
    [state unsigned-8]
    [window unsigned-32]))
(define getscreencount-opcode 2)
(define-ftype getscreencount
  (struct
    [window unsigned-32]))
(define-ftype getscreencount-reply
  (struct
    [screen_count unsigned-8]
    [window unsigned-32]))
(define getscreensize-opcode 3)
(define-ftype getscreensize
  (struct
    [window unsigned-32]
    [screen unsigned-32]))
(define-ftype getscreensize-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [width unsigned-32]
    [height unsigned-32]
    [window unsigned-32]
    [screen unsigned-32]))
(define-ftype isactive-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [state unsigned-32]))
(define-ftype queryscreens-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [number unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [screen_info (* screeninfo)]))
