(import (enums))
(load "xproto.ss")(load "xfixes.ss")(define-ftype damage unsigned-32)
(define reportlevel (enum
  '((reportlevel-rawrectangles 0)
  (reportlevel-deltarectangles 0)
  (reportlevel-boundingbox 1)
  (reportlevel-nonempty 2))))
(define baddamage-error-number 0)
(define-ftype baddamage-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
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
(define create-opcode 1)
(define-ftype create
  (struct
    [damage damage]
    [drawable unsigned-32]
    [level-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define destroy-opcode 2)
(define-ftype destroy
  (struct
    [damage damage]))
(define subtract-opcode 3)
(define-ftype subtract
  (struct
    [damage damage]
    [repair region]
    [parts region]))
(define add-opcode 4)
(define-ftype add
  (struct
    [drawable unsigned-32]
    [region region]))
(define notify-number 0)
(define-ftype notify
    (struct
    [level-enum unsigned-8]
    [drawable unsigned-32]
    [damage damage]
    [timestamp timestamp]
    [area rectangle]
    [geometry rectangle]))
