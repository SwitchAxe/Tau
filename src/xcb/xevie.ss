(import (enums))
(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [client_major_version unsigned-16]
    [client_minor_version unsigned-16]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [server_major_version unsigned-16]
    [server_minor_version unsigned-16]
    [pad1 (array 20 unsigned-8)]))
(define start-opcode 1)
(define-ftype start
  (struct
    [screen unsigned-32]))
(define-ftype start-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [pad1 (array 24 unsigned-8)]))
(define end-opcode 2)
(define-ftype end
  (struct
    [cmap unsigned-32]))
(define-ftype end-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [pad1 (array 24 unsigned-8)]))
(define datatype (enum
  '((datatype-unmodified 0)
  (datatype-modified 0))))
(define-ftype event
  (struct
    [pad0 (array 32 unsigned-8)]))
(define send-opcode 3)
(define-ftype send
  (struct
    [event event]
    [data_type unsigned-32]
    [pad0 (array 64 unsigned-8)]))
(define-ftype send-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [pad1 (array 24 unsigned-8)]))
(define selectinput-opcode 4)
(define-ftype selectinput
  (struct
    [event_mask unsigned-32]))
(define-ftype selectinput-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [pad1 (array 24 unsigned-8)]))
