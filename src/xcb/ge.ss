(import (enums))
(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [client_major_version unsigned-16]
    [client_minor_version unsigned-16]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-16]
    [minor_version unsigned-16]
    [pad1 (array 20 unsigned-8)]))
