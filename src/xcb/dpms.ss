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
(define-ftype capable-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [capable boolean]
    [pad1 (array 23 unsigned-8)]))
(define-ftype gettimeouts-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [standby_timeout unsigned-16]
    [suspend_timeout unsigned-16]
    [off_timeout unsigned-16]
    [pad1 (array 18 unsigned-8)]))
(define settimeouts-opcode 3)
(define-ftype settimeouts
  (struct
    [standby_timeout unsigned-16]
    [suspend_timeout unsigned-16]
    [off_timeout unsigned-16]))
(define enable-opcode 4)
(define-ftype enable
  (struct
    (define disable-opcode 5)
(define-ftype disable
  (struct
    (define dpmsmode (enum
  '((dpmsmode-on 0)
  (dpmsmode-standby 0)
  (dpmsmode-suspend 1)
  (dpmsmode-off 2))))
(define forcelevel-opcode 6)
(define-ftype forcelevel
  (struct
    [power_level-enum unsigned-16]))
(define-ftype info-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [power_level-enum unsigned-16]
    [state boolean]
    [pad1 (array 21 unsigned-8)]))
