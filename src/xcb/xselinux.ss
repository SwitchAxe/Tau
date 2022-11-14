(import (enums))
(load "xproto.ss")(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [client_major unsigned-8]
    [client_minor unsigned-8]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [server_major unsigned-16]
    [server_minor unsigned-16]))
(define setdevicecreatecontext-opcode 1)
(define-ftype setdevicecreatecontext
  (struct
    [context_len unsigned-32]
    [context (* unsigned-8)]))
(define-ftype getdevicecreatecontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
(define setdevicecontext-opcode 3)
(define-ftype setdevicecontext
  (struct
    [device unsigned-32]
    [context_len unsigned-32]
    [context (* unsigned-8)]))
(define getdevicecontext-opcode 4)
(define-ftype getdevicecontext
  (struct
    [device unsigned-32]))
(define-ftype getdevicecontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
(define setwindowcreatecontext-opcode 5)
(define-ftype setwindowcreatecontext
  (struct
    [context_len unsigned-32]
    [context (* unsigned-8)]))
(define-ftype getwindowcreatecontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
(define getwindowcontext-opcode 7)
(define-ftype getwindowcontext
  (struct
    [window unsigned-32]))
(define-ftype getwindowcontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
(define-ftype listitem
  (struct
    [name unsigned-32]
    [object_context_len unsigned-32]
    [data_context_len unsigned-32]
    [object_context (* unsigned-8)]
    [pad0 (array 4 unsigned-8)]
    [data_context (* unsigned-8)]
    [pad1 (array 4 unsigned-8)]))
(define setpropertycreatecontext-opcode 8)
(define-ftype setpropertycreatecontext
  (struct
    [context_len unsigned-32]
    [context (* unsigned-8)]))
(define-ftype getpropertycreatecontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
(define setpropertyusecontext-opcode 10)
(define-ftype setpropertyusecontext
  (struct
    [context_len unsigned-32]
    [context (* unsigned-8)]))
(define-ftype getpropertyusecontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
(define getpropertycontext-opcode 12)
(define-ftype getpropertycontext
  (struct
    [window unsigned-32]
    [property unsigned-32]))
(define-ftype getpropertycontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
(define getpropertydatacontext-opcode 13)
(define-ftype getpropertydatacontext
  (struct
    [window unsigned-32]
    [property unsigned-32]))
(define-ftype getpropertydatacontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
(define listproperties-opcode 14)
(define-ftype listproperties
  (struct
    [window unsigned-32]))
(define-ftype listproperties-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [properties_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [properties (* listitem)]))
(define setselectioncreatecontext-opcode 15)
(define-ftype setselectioncreatecontext
  (struct
    [context_len unsigned-32]
    [context (* unsigned-8)]))
(define-ftype getselectioncreatecontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
(define setselectionusecontext-opcode 17)
(define-ftype setselectionusecontext
  (struct
    [context_len unsigned-32]
    [context (* unsigned-8)]))
(define-ftype getselectionusecontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
(define getselectioncontext-opcode 19)
(define-ftype getselectioncontext
  (struct
    [selection unsigned-32]))
(define-ftype getselectioncontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
(define getselectiondatacontext-opcode 20)
(define-ftype getselectiondatacontext
  (struct
    [selection unsigned-32]))
(define-ftype getselectiondatacontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
(define-ftype listselections-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [selections_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [selections (* listitem)]))
(define getclientcontext-opcode 22)
(define-ftype getclientcontext
  (struct
    [resource unsigned-32]))
(define-ftype getclientcontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [context (* unsigned-8)]))
