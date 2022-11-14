(import (enums))
(load "xproto.ss")(define kind (enum
  '((kind-blanked 0)
  (kind-internal 0)
  (kind-external 1))))
(define event (enum
  '((event-notifymask 1)
  (event-cyclemask 1))))
(define state (enum
  '((state-off 0)
  (state-on 0)
  (state-cycle 1)
  (state-disabled 2))))
(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [client_major_version unsigned-8]
    [client_minor_version unsigned-8]
    [pad0 (array 2 unsigned-8)]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [server_major_version unsigned-16]
    [server_minor_version unsigned-16]
    [pad1 (array 20 unsigned-8)]))
(define queryinfo-opcode 1)
(define-ftype queryinfo
  (struct
    [drawable unsigned-32]))
(define-ftype queryinfo-reply
  (struct
    [state unsigned-8]
    [saver_window unsigned-32]
    [ms_until_server unsigned-32]
    [ms_since_user_input unsigned-32]
    [event_mask unsigned-32]
    [kind-enum unsigned-8]
    [pad0 (array 7 unsigned-8)]))
(define selectinput-opcode 2)
(define-ftype selectinput
  (struct
    [drawable unsigned-32]
    [event_mask-mask unsigned-32]))
(define setattributes-opcode 3)
(define-ftype setattributes
  (struct
    [drawable unsigned-32]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [border_width unsigned-16]
    [class-enum unsigned-8]
    [depth unsigned-8]
    [visual unsigned-32]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [BackPixmap unsigned-32]
    [background_pixmap unsigned-32]
    [background_pixel unsigned-32]
    [border_pixmap unsigned-32]
    [border_pixel unsigned-32]
    [bit_gravity-enum unsigned-32]
    [win_gravity-enum unsigned-32]
    [backing_store-enum unsigned-32]
    [backing_planes unsigned-32]
    [backing_pixel unsigned-32]
    [override_redirect unsigned-32]
    [save_under unsigned-32]
    [event_mask-mask unsigned-32]
    [do_not_propogate_mask-mask unsigned-32]
    [colormap unsigned-32]
    [cursor unsigned-32]))
(define unsetattributes-opcode 4)
(define-ftype unsetattributes
  (struct
    [drawable unsigned-32]))
(define suspend-opcode 5)
(define-ftype suspend
  (struct
    [suspend unsigned-32]))
(define notify-number 0)
(define-ftype notify
    (struct
    [state-enum unsigned-8]
    [time timestamp]
    [root unsigned-32]
    [window unsigned-32]
    [kind-enum unsigned-8]
    [forced boolean]
    [pad0 (array 14 unsigned-8)]))
