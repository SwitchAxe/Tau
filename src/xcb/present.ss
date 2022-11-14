(import (enums))
(load "xproto.ss")(load "randr.ss")(load "xfixes.ss")(load "sync.ss")(define event (enum
  '((event-configurenotify 0)
  (event-completenotify 0)
  (event-idlenotify 1)
  (event-redirectnotify 2))))
(define eventmask (enum
  '((eventmask-noevent 0)
  (eventmask-configurenotify 0)
  (eventmask-completenotify 1)
  (eventmask-idlenotify 2)
  (eventmask-redirectnotify 4))))
(define option (enum
  '((option-none 0)
  (option-async 0)
  (option-copy 1)
  (option-ust 2)
  (option-suboptimal 4))))
(define capability (enum
  '((capability-none 0)
  (capability-async 0)
  (capability-fence 1)
  (capability-ust 2))))
(define completekind (enum
  '((completekind-pixmap 0)
  (completekind-notifymsc 0))))
(define completemode (enum
  '((completemode-copy 0)
  (completemode-flip 0)
  (completemode-skip 1)
  (completemode-suboptimalcopy 2))))
(define-ftype notify
  (struct
    [window unsigned-32]
    [serial unsigned-32]))
(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [major_version unsigned-32]
    [minor_version unsigned-32]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-32]
    [minor_version unsigned-32]))
(define pixmap-opcode 1)
(define-ftype pixmap
  (struct
    