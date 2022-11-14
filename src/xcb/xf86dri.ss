(import (enums))
(define-ftype drmcliprect
  (struct
    [x1 integer-16]
    [y1 integer-16]
    [x2 integer-16]
    [x3 integer-16]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [dri_major_version unsigned-16]
    [dri_minor_version unsigned-16]
    [dri_minor_patch unsigned-32]))
(define querydirectrenderingcapable-opcode 1)
(define-ftype querydirectrenderingcapable
  (struct
    [screen unsigned-32]))
(define-ftype querydirectrenderingcapable-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [is_capable boolean]))
(define openconnection-opcode 2)
(define-ftype openconnection
  (struct
    [screen unsigned-32]))
(define-ftype openconnection-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [sarea_handle_low unsigned-32]
    [sarea_handle_high unsigned-32]
    [bus_id_len unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [bus_id (* unsigned-8)]))
(define closeconnection-opcode 3)
(define-ftype closeconnection
  (struct
    [screen unsigned-32]))
(define getclientdrivername-opcode 4)
(define-ftype getclientdrivername
  (struct
    [screen unsigned-32]))
(define-ftype getclientdrivername-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [client_driver_major_version unsigned-32]
    [client_driver_minor_version unsigned-32]
    [client_driver_patch_version unsigned-32]
    [client_driver_name_len unsigned-32]
    [pad1 (array 8 unsigned-8)]
    [client_driver_name (* unsigned-8)]))
(define createcontext-opcode 5)
(define-ftype createcontext
  (struct
    [screen unsigned-32]
    [visual unsigned-32]
    [context unsigned-32]))
(define-ftype createcontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [hw_context unsigned-32]))
(define destroycontext-opcode 6)
(define-ftype destroycontext
  (struct
    [screen unsigned-32]
    [context unsigned-32]))
(define createdrawable-opcode 7)
(define-ftype createdrawable
  (struct
    [screen unsigned-32]
    [drawable unsigned-32]))
(define-ftype createdrawable-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [hw_drawable_handle unsigned-32]))
(define destroydrawable-opcode 8)
(define-ftype destroydrawable
  (struct
    [screen unsigned-32]
    [drawable unsigned-32]))
(define getdrawableinfo-opcode 9)
(define-ftype getdrawableinfo
  (struct
    [screen unsigned-32]
    [drawable unsigned-32]))
(define-ftype getdrawableinfo-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [drawable_table_index unsigned-32]
    [drawable_table_stamp unsigned-32]
    [drawable_origin_x integer-16]
    [drawable_origin_y integer-16]
    [drawable_size_w integer-16]
    [drawable_size_h integer-16]
    [num_clip_rects unsigned-32]
    [back_x integer-16]
    [back_y integer-16]
    [num_back_clip_rects unsigned-32]
    [clip_rects (* drmcliprect)]
    [back_clip_rects (* drmcliprect)]))
(define getdeviceinfo-opcode 10)
(define-ftype getdeviceinfo
  (struct
    [screen unsigned-32]))
(define-ftype getdeviceinfo-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [framebuffer_handle_low unsigned-32]
    [framebuffer_handle_high unsigned-32]
    [framebuffer_origin_offset unsigned-32]
    [framebuffer_size unsigned-32]
    [framebuffer_stride unsigned-32]
    [device_private_size unsigned-32]
    [device_private (* unsigned-32)]))
(define authconnection-opcode 11)
(define-ftype authconnection
  (struct
    [screen unsigned-32]
    [magic unsigned-32]))
(define-ftype authconnection-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [authenticated unsigned-32]))
