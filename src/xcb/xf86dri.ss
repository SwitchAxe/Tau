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
(define-ftype drmcliprect-iterator
  (struct
    [data (* drmcliprect)]
    [rem int]
    [index int]))
(define-ftype modeinfo-iterator
  (struct
    [data (* modeinfo)]
    [rem int]
    [index int]))
(define-ftype screeninfo-iterator
  (struct
    [data (* screeninfo)]
    [rem int]
    [index int]))
(define-ftype info-iterator
  (struct
    [data (* info)]
    [rem int]
    [index int]))
(define-ftype inputinfo-iterator
  (struct
    [data (* inputinfo)]
    [rem int]
    [index int]))
(define-ftype valuatorinfo-iterator
  (struct
    [data (* valuatorinfo)]
    [rem int]
    [index int]))
(define-ftype axisinfo-iterator
  (struct
    [data (* axisinfo)]
    [rem int]
    [index int]))
(define-ftype buttoninfo-iterator
  (struct
    [data (* buttoninfo)]
    [rem int]
    [index int]))
(define-ftype keyinfo-iterator
  (struct
    [data (* keyinfo)]
    [rem int]
    [index int]))
(define-ftype deviceinfo-iterator
  (struct
    [data (* deviceinfo)]
    [rem int]
    [index int]))
(define-ftype fp3232-iterator
  (struct
    [data (* fp3232)]
    [rem int]
    [index int]))
(define-ftype details-iterator
  (struct
    [data (* details)]
    [rem int]
    [index int]))
(define-ftype action-iterator
  (struct
    [data (* action)]
    [rem int]
    [index int]))
(define-ftype syminterpret-iterator
  (struct
    [data (* syminterpret)]
    [rem int]
    [index int]))
(define-ftype siaction-iterator
  (struct
    [data (* siaction)]
    [rem int]
    [index int]))
(define-ftype sadevicevaluator-iterator
  (struct
    [data (* sadevicevaluator)]
    [rem int]
    [index int]))
(define-ftype salockdevicebtn-iterator
  (struct
    [data (* salockdevicebtn)]
    [rem int]
    [index int]))
(define-ftype sadevicebtn-iterator
  (struct
    [data (* sadevicebtn)]
    [rem int]
    [index int]))
(define-ftype saredirectkey-iterator
  (struct
    [data (* saredirectkey)]
    [rem int]
    [index int]))
(define-ftype saactionmessage-iterator
  (struct
    [data (* saactionmessage)]
    [rem int]
    [index int]))
(define-ftype sasetcontrols-iterator
  (struct
    [data (* sasetcontrols)]
    [rem int]
    [index int]))
(define-ftype saswitchscreen-iterator
  (struct
    [data (* saswitchscreen)]
    [rem int]
    [index int]))
(define-ftype saterminate-iterator
  (struct
    [data (* saterminate)]
    [rem int]
    [index int]))
(define-ftype saisolock-iterator
  (struct
    [data (* saisolock)]
    [rem int]
    [index int]))
(define-ftype sasetptrdflt-iterator
  (struct
    [data (* sasetptrdflt)]
    [rem int]
    [index int]))
(define-ftype salockptrbtn-iterator
  (struct
    [data (* salockptrbtn)]
    [rem int]
    [index int]))
(define-ftype saptrbtn-iterator
  (struct
    [data (* saptrbtn)]
    [rem int]
    [index int]))
(define-ftype samoveptr-iterator
  (struct
    [data (* samoveptr)]
    [rem int]
    [index int]))
(define-ftype sasetgroup-iterator
  (struct
    [data (* sasetgroup)]
    [rem int]
    [index int]))
(define-ftype sasetmods-iterator
  (struct
    [data (* sasetmods)]
    [rem int]
    [index int]))
(define-ftype sanoaction-iterator
  (struct
    [data (* sanoaction)]
    [rem int]
    [index int]))
(define-ftype deviceledinfo-iterator
  (struct
    [data (* deviceledinfo)]
    [rem int]
    [index int]))
(define-ftype listing-iterator
  (struct
    [data (* listing)]
    [rem int]
    [index int]))
(define-ftype row-iterator
  (struct
    [data (* row)]
    [rem int]
    [index int]))
(define-ftype overlay-iterator
  (struct
    [data (* overlay)]
    [rem int]
    [index int]))
(define-ftype overlayrow-iterator
  (struct
    [data (* overlayrow)]
    [rem int]
    [index int]))
(define-ftype overlaykey-iterator
  (struct
    [data (* overlaykey)]
    [rem int]
    [index int]))
(define-ftype key-iterator
  (struct
    [data (* key)]
    [rem int]
    [index int]))
(define-ftype shape-iterator
  (struct
    [data (* shape)]
    [rem int]
    [index int]))
(define-ftype outline-iterator
  (struct
    [data (* outline)]
    [rem int]
    [index int]))
(define-ftype setkeytype-iterator
  (struct
    [data (* setkeytype)]
    [rem int]
    [index int]))
(define-ftype ktsetmapentry-iterator
  (struct
    [data (* ktsetmapentry)]
    [rem int]
    [index int]))
(define-ftype keyvmodmap-iterator
  (struct
    [data (* keyvmodmap)]
    [rem int]
    [index int]))
(define-ftype keymodmap-iterator
  (struct
    [data (* keymodmap)]
    [rem int]
    [index int]))
(define-ftype setexplicit-iterator
  (struct
    [data (* setexplicit)]
    [rem int]
    [index int]))
(define-ftype setbehavior-iterator
  (struct
    [data (* setbehavior)]
    [rem int]
    [index int]))
(define-ftype behavior-iterator
  (struct
    [data (* behavior)]
    [rem int]
    [index int]))
(define-ftype overlaybehavior-iterator
  (struct
    [data (* overlaybehavior)]
    [rem int]
    [index int]))
(define-ftype radiogroupbehavior-iterator
  (struct
    [data (* radiogroupbehavior)]
    [rem int]
    [index int]))
(define-ftype defaultbehavior-iterator
  (struct
    [data (* defaultbehavior)]
    [rem int]
    [index int]))
(define-ftype commonbehavior-iterator
  (struct
    [data (* commonbehavior)]
    [rem int]
    [index int]))
(define-ftype keysymmap-iterator
  (struct
    [data (* keysymmap)]
    [rem int]
    [index int]))
(define-ftype keytype-iterator
  (struct
    [data (* keytype)]
    [rem int]
    [index int]))
(define-ftype ktmapentry-iterator
  (struct
    [data (* ktmapentry)]
    [rem int]
    [index int]))
(define-ftype countedstring16-iterator
  (struct
    [data (* countedstring16)]
    [rem int]
    [index int]))
(define-ftype keyalias-iterator
  (struct
    [data (* keyalias)]
    [rem int]
    [index int]))
(define-ftype keyname-iterator
  (struct
    [data (* keyname)]
    [rem int]
    [index int]))
(define-ftype moddef-iterator
  (struct
    [data (* moddef)]
    [rem int]
    [index int]))
(define-ftype indicatormap-iterator
  (struct
    [data (* indicatormap)]
    [rem int]
    [index int]))
(define-ftype printer-iterator
  (struct
    [data (* printer)]
    [rem int]
    [index int]))
(define-ftype listitem-iterator
  (struct
    [data (* listitem)]
    [rem int]
    [index int]))
(define-ftype imageformatinfo-iterator
  (struct
    [data (* imageformatinfo)]
    [rem int]
    [index int]))
(define-ftype attributeinfo-iterator
  (struct
    [data (* attributeinfo)]
    [rem int]
    [index int]))
(define-ftype image-iterator
  (struct
    [data (* image)]
    [rem int]
    [index int]))
(define-ftype encodinginfo-iterator
  (struct
    [data (* encodinginfo)]
    [rem int]
    [index int]))
(define-ftype adaptorinfo-iterator
  (struct
    [data (* adaptorinfo)]
    [rem int]
    [index int]))
(define-ftype format-iterator
  (struct
    [data (* format)]
    [rem int]
    [index int]))
(define-ftype rational-iterator
  (struct
    [data (* rational)]
    [rem int]
    [index int]))
(define-ftype surfaceinfo-iterator
  (struct
    [data (* surfaceinfo)]
    [rem int]
    [index int]))
(define-ftype keycode-iterator
  (struct
    [data (* unsigned-8)]
    [rem int]
    [index int]))
