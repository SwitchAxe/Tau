(import (enums))
(load "xproto.ss")(define-ftype client
  (struct
    [resource_base unsigned-32]
    [resource_mask unsigned-32]))
(define-ftype type
  (struct
    [resource_type unsigned-32]
    [count unsigned-32]))
(define clientidmask (enum
  '((clientidmask-clientxid 1)
  (clientidmask-localclientpid 1))))
(define-ftype clientidspec
  (struct
    [client unsigned-32]
    [mask-mask unsigned-32]))
(define-ftype clientidvalue
  (struct
    [spec clientidspec]
    [length unsigned-32]
    [value (array 4 unsigned-32)]))
(define-ftype resourceidspec
  (struct
    [resource unsigned-32]
    [type unsigned-32]))
(define-ftype resourcesizespec
  (struct
    [spec resourceidspec]
    [bytes unsigned-32]
    [ref_count unsigned-32]
    [use_count unsigned-32]))
(define-ftype resourcesizevalue
  (struct
    [size resourcesizespec]
    [num_cross_references unsigned-32]
    [cross_references (* resourcesizespec)]))
(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [client_major unsigned-8]
    [client_minor unsigned-8]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [server_major unsigned-16]
    [server_minor unsigned-16]))
(define-ftype queryclients-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_clients unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [clients (* client)]))
(define queryclientresources-opcode 2)
(define-ftype queryclientresources
  (struct
    [xid unsigned-32]))
(define-ftype queryclientresources-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_types unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [types (* type)]))
(define queryclientpixmapbytes-opcode 3)
(define-ftype queryclientpixmapbytes
  (struct
    [xid unsigned-32]))
(define-ftype queryclientpixmapbytes-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [bytes unsigned-32]
    [bytes_overflow unsigned-32]))
(define queryclientids-opcode 4)
(define-ftype queryclientids
  (struct
    [num_specs unsigned-32]
    [specs (* clientidspec)]))
(define-ftype queryclientids-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_ids unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [ids (* clientidvalue)]))
(define queryresourcebytes-opcode 5)
(define-ftype queryresourcebytes
  (struct
    [client unsigned-32]
    [num_specs unsigned-32]
    [specs (* resourceidspec)]))
(define-ftype queryresourcebytes-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_sizes unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [sizes (* resourcesizevalue)]))
