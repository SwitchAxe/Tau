(import (enums))
(define-ftype context unsigned-32)
(define-ftype range8
  (struct
    [first unsigned-8]
    [last unsigned-8]))
(define-ftype range16
  (struct
    [first unsigned-16]
    [last unsigned-16]))
(define-ftype extrange
  (struct
    [major range8]
    [minor range16]))
(define-ftype range
  (struct
    [core_requests range8]
    [core_replies range8]
    [ext_requests extrange]
    [ext_replies extrange]
    [delivered_events range8]
    [device_events range8]
    [errors range8]
    [client_started boolean]
    [client_died boolean]))
(define htype (enum
  '((htype-fromservertime 1)
  (htype-fromclienttime 1)
  (htype-fromclientsequence 2))))
(define cs (enum
  '((cs-currentclients 1)
  (cs-futureclients 1)
  (cs-allclients 2))))
(define-ftype clientinfo
  (struct
    [client_resource unsigned-32]
    [num_ranges unsigned-32]
    [ranges (* range)]))
(define badcontext-error-number 0)
(define-ftype badcontext-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]
   [invalid_record unsigned-32]))
(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [major_version unsigned-16]
    [minor_version unsigned-16]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-16]
    [minor_version unsigned-16]))
(define createcontext-opcode 1)
(define-ftype createcontext
  (struct
    [context record:context]
    [element_header elementheader]
    [pad0 (array 3 unsigned-8)]
    [num_client_specs unsigned-32]
    [num_ranges unsigned-32]
    [client_specs (* unsigned-32)]
    [ranges (* range)]))
(define registerclients-opcode 2)
(define-ftype registerclients
  (struct
    [context record:context]
    [element_header elementheader]
    [pad0 (array 3 unsigned-8)]
    [num_client_specs unsigned-32]
    [num_ranges unsigned-32]
    [client_specs (* unsigned-32)]
    [ranges (* range)]))
(define unregisterclients-opcode 3)
(define-ftype unregisterclients
  (struct
    [context record:context]
    [num_client_specs unsigned-32]
    [client_specs (* unsigned-32)]))
(define getcontext-opcode 4)
(define-ftype getcontext
  (struct
    [context record:context]))
(define-ftype getcontext-reply
  (struct
    [enabled boolean]
    [element_header elementheader]
    [pad0 (array 3 unsigned-8)]
    [num_intercepted_clients unsigned-32]
    [pad1 (array 16 unsigned-8)]
    [intercepted_clients (* clientinfo)]))
(define enablecontext-opcode 5)
(define-ftype enablecontext
  (struct
    [context record:context]))
(define-ftype enablecontext-reply
  (struct
    [category unsigned-8]
    [element_header elementheader]
    [client_swapped boolean]
    [pad0 (array 2 unsigned-8)]
    [xid_base unsigned-32]
    [server_time unsigned-32]
    [rec_sequence_num unsigned-32]
    [pad1 (array 8 unsigned-8)]
    [data (array 4 unsigned-8)]))
(define disablecontext-opcode 6)
(define-ftype disablecontext
  (struct
    [context record:context]))
(define freecontext-opcode 7)
(define-ftype freecontext
  (struct
    [context record:context]))
