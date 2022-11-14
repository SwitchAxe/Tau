(import (enums))
(define getversion-opcode 0)
(define-ftype getversion
  (struct
    [client_major_version unsigned-16]
    [client_minor_version unsigned-16]))
(define-ftype getversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [server_major_version unsigned-16]
    [server_minor_version unsigned-16]))
(define-ftype getxidrange-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [start_id unsigned-32]
    [count unsigned-32]))
(define getxidlist-opcode 2)
(define-ftype getxidlist
  (struct
    [count unsigned-32]))
(define-ftype getxidlist-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [ids_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [ids (* unsigned-32)]))
