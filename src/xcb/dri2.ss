(import (enums))
(load "xproto.ss")(define attachment (enum
  '((attachment-bufferfrontleft 0)
  (attachment-bufferbackleft 0)
  (attachment-bufferfrontright 1)
  (attachment-bufferbackright 2)
  (attachment-bufferdepth 3)
  (attachment-bufferstencil 4)
  (attachment-bufferaccum 5)
  (attachment-bufferfakefrontleft 6)
  (attachment-bufferfakefrontright 7)
  (attachment-bufferdepthstencil 8)
  (attachment-bufferhiz 9))))
(define drivertype (enum
  '((drivertype-dri 0)
  (drivertype-vdpau 0))))
(define eventtype (enum
  '((eventtype-exchangecomplete 1)
  (eventtype-blitcomplete 1)
  (eventtype-flipcomplete 2))))
(define-ftype dri2buffer
  (struct
    [attachment-enum unsigned-32]
    [name unsigned-32]
    [pitch unsigned-32]
    [cpp unsigned-32]
    [flags unsigned-32]))
(define-ftype attachformat
  (struct
    [attachment-enum unsigned-32]
    [format unsigned-32]))
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
(define connect-opcode 1)
(define-ftype connect
  (struct
    [window unsigned-32]
    [driver_type-enum unsigned-32]))
(define-ftype connect-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [driver_name_length unsigned-32]
    [device_name_length unsigned-32]
    [pad1 (array 16 unsigned-8)]
    [driver_name (* unsigned-8)]
    [alignment_pad void*]
    [device_name (* unsigned-8)]))
(define authenticate-opcode 2)
(define-ftype authenticate
  (struct
    [window unsigned-32]
    [magic unsigned-32]))
(define-ftype authenticate-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [authenticated unsigned-32]))
(define createdrawable-opcode 3)
(define-ftype createdrawable
  (struct
    [drawable unsigned-32]))
(define destroydrawable-opcode 4)
(define-ftype destroydrawable
  (struct
    [drawable unsigned-32]))
(define getbuffers-opcode 5)
(define-ftype getbuffers
  (struct
    [drawable unsigned-32]
    [count unsigned-32]
    [attachments unsigned-32]))
(define-ftype getbuffers-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [width unsigned-32]
    [height unsigned-32]
    [count unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [buffers (* dri2buffer)]))
(define copyregion-opcode 6)
(define-ftype copyregion
  (struct
    [drawable unsigned-32]
    [region unsigned-32]
    [dest unsigned-32]
    [src unsigned-32]))
(define-ftype copyregion-reply
  (struct
    [pad0 (array 1 unsigned-8)]))
(define getbufferswithformat-opcode 7)
(define-ftype getbufferswithformat
  (struct
    [drawable unsigned-32]
    [count unsigned-32]
    [attachments attachformat]))
(define-ftype getbufferswithformat-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [width unsigned-32]
    [height unsigned-32]
    [count unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [buffers (* dri2buffer)]))
(define swapbuffers-opcode 8)
(define-ftype swapbuffers
  (struct
    [drawable unsigned-32]
    [target_msc_hi unsigned-32]
    [target_msc_lo unsigned-32]
    [divisor_hi unsigned-32]
    [divisor_lo unsigned-32]
    [remainder_hi unsigned-32]
    [remainder_lo unsigned-32]))
(define-ftype swapbuffers-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [swap_hi unsigned-32]
    [swap_lo unsigned-32]))
(define getmsc-opcode 9)
(define-ftype getmsc
  (struct
    [drawable unsigned-32]))
(define-ftype getmsc-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [ust_hi unsigned-32]
    [ust_lo unsigned-32]
    [msc_hi unsigned-32]
    [msc_lo unsigned-32]
    [sbc_hi unsigned-32]
    [sbc_lo unsigned-32]))
(define waitmsc-opcode 10)
(define-ftype waitmsc
  (struct
    [drawable unsigned-32]
    [target_msc_hi unsigned-32]
    [target_msc_lo unsigned-32]
    [divisor_hi unsigned-32]
    [divisor_lo unsigned-32]
    [remainder_hi unsigned-32]
    [remainder_lo unsigned-32]))
(define-ftype waitmsc-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [ust_hi unsigned-32]
    [ust_lo unsigned-32]
    [msc_hi unsigned-32]
    [msc_lo unsigned-32]
    [sbc_hi unsigned-32]
    [sbc_lo unsigned-32]))
(define waitsbc-opcode 11)
(define-ftype waitsbc
  (struct
    [drawable unsigned-32]
    [target_sbc_hi unsigned-32]
    [target_sbc_lo unsigned-32]))
(define-ftype waitsbc-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [ust_hi unsigned-32]
    [ust_lo unsigned-32]
    [msc_hi unsigned-32]
    [msc_lo unsigned-32]
    [sbc_hi unsigned-32]
    [sbc_lo unsigned-32]))
(define swapinterval-opcode 12)
(define-ftype swapinterval
  (struct
    [drawable unsigned-32]
    [interval unsigned-32]))
(define getparam-opcode 13)
(define-ftype getparam
  (struct
    [drawable unsigned-32]
    [param unsigned-32]))
(define-ftype getparam-reply
  (struct
    [is_param_recognized boolean]
    [value_hi unsigned-32]
    [value_lo unsigned-32]))
(define bufferswapcomplete-number 0)
(define-ftype bufferswapcomplete
    (struct
    [pad0 (array 1 unsigned-8)]
    [event_type-enum unsigned-16]
    [pad1 (array 2 unsigned-8)]
    [drawable unsigned-32]
    [ust_hi unsigned-32]
    [ust_lo unsigned-32]
    [msc_hi unsigned-32]
    [msc_lo unsigned-32]
    [sbc unsigned-32]))
(define invalidatebuffers-number 1)
(define-ftype invalidatebuffers
    (struct
    [pad2 (array 1 unsigned-8)]
    [drawable unsigned-32]))
