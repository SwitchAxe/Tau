(import (enums))
(load "xproto.ss")(define swapaction (enum
  '((swapaction-undefined 0)
  (swapaction-background 0)
  (swapaction-untouched 1)
  (swapaction-copied 2))))
(define-ftype swapinfo
  (struct
    (define-ftype swapinfo
  (struct
    [window unsigned-32]
    [swap_action-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define-ftype bufferattributes
  (struct
    [window unsigned-32]))
(define-ftype visualinfo
  (struct
    [visual_id unsigned-32]
    [depth unsigned-8]
    [perf_level unsigned-8]
    [pad0 (array 2 unsigned-8)]))
(define-ftype visualinfos
  (struct
    [n_infos unsigned-32]
    [infos (* visualinfo)]))
(define badbuffer-error-number 0)
(define-ftype badbuffer-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]
   [bad_buffer unsigned-32]))
(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [major_version unsigned-8]
    [minor_version unsigned-8]
    [pad0 (array 2 unsigned-8)]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-8]
    [minor_version unsigned-8]
    [pad1 (array 22 unsigned-8)]))
(define allocatebackbuffer-opcode 1)
(define-ftype allocatebackbuffer
  (struct
    [window unsigned-32]
    [buffer unsigned-32]
    [swap_action unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define deallocatebackbuffer-opcode 2)
(define-ftype deallocatebackbuffer
  (struct
    [buffer unsigned-32]))
(define swapbuffers-opcode 3)
(define-ftype swapbuffers
  (struct
    [n_actions unsigned-32]
    [actions (* swapinfo)]))
(define beginidiom-opcode 4)
(define-ftype beginidiom
  (struct
    (define endidiom-opcode 5)
(define-ftype endidiom
  (struct
    (define getvisualinfo-opcode 6)
(define-ftype getvisualinfo
  (struct
    [n_drawables unsigned-32]
    [drawables (* unsigned-32)]))
(define-ftype getvisualinfo-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [n_supported_visuals unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [supported_visuals (* visualinfos)]))
(define getbackbufferattributes-opcode 7)
(define-ftype getbackbufferattributes
  (struct
    [buffer unsigned-32]))
(define-ftype getbackbufferattributes-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [attributes bufferattributes]
    [pad1 (array 20 unsigned-8)]))
