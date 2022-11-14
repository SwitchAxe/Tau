(import (enums))
(load "xproto.ss")(define getversion-opcode 0)
(define-ftype getversion
  (struct
    [major_version unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [minor_version unsigned-16]))
(define-ftype getversion-reply
  (struct
    [major_version unsigned-8]
    [minor_version unsigned-16]))
(define cursor (enum
  '((cursor-none 0)
  (cursor-current 0))))
(define comparecursor-opcode 1)
(define-ftype comparecursor
  (struct
    [window unsigned-32]
    [cursor unsigned-32]))
(define-ftype comparecursor-reply
  (struct
    [same boolean]))
(define fakeinput-opcode 2)
(define-ftype fakeinput
  (struct
    [type unsigned-8]
    [detail unsigned-8]
    [pad0 (array 2 unsigned-8)]
    [time unsigned-32]
    [root unsigned-32]
    [pad1 (array 8 unsigned-8)]
    [rootx integer-16]
    [rooty integer-16]
    [pad2 (array 7 unsigned-8)]
    [deviceid unsigned-8]))
(define grabcontrol-opcode 3)
(define-ftype grabcontrol
  (struct
    [impervious boolean]
    [pad0 (array 3 unsigned-8)]))
