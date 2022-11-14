(import (enums))
(load "xproto.ss")(define-ftype seg unsigned-32)
(define completion-number 0)
(define-ftype completion
    (struct
    [pad0 (array 1 unsigned-8)]
    [drawable unsigned-32]
    [minor_event unsigned-16]
    [major_event unsigned-8]
    [pad1 (array 1 unsigned-8)]
    [shmseg seg]
    [offset unsigned-32]))
(define-ftype queryversion-reply
  (struct
    [shared_pixmaps boolean]
    [major_version unsigned-16]
    [minor_version unsigned-16]
    [uid unsigned-16]
    [gid unsigned-16]
    [pixmap_format unsigned-8]
    [pad0 (array 15 unsigned-8)]))
(define attach-opcode 1)
(define-ftype attach
  (struct
    [shmseg seg]
    [shmid unsigned-32]
    [read_only boolean]
    [pad0 (array 3 unsigned-8)]))
(define detach-opcode 2)
(define-ftype detach
  (struct
    [shmseg seg]))
(define putimage-opcode 3)
(define-ftype putimage
  (struct
    [drawable unsigned-32]
    [gc unsigned-32]
    [total_width unsigned-16]
    [total_height unsigned-16]
    [src_x unsigned-16]
    [src_y unsigned-16]
    [src_width unsigned-16]
    [src_height unsigned-16]
    [dst_x integer-16]
    [dst_y integer-16]
    [depth unsigned-8]
    [format unsigned-8]
    [send_event boolean]
    [pad0 (array 1 unsigned-8)]
    [shmseg seg]
    [offset unsigned-32]))
(define getimage-opcode 4)
(define-ftype getimage
  (struct
    [drawable unsigned-32]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [plane_mask unsigned-32]
    [format unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [shmseg seg]
    [offset unsigned-32]))
(define-ftype getimage-reply
  (struct
    [depth unsigned-8]
    [visual unsigned-32]
    [size unsigned-32]))
(define createpixmap-opcode 5)
(define-ftype createpixmap
  (struct
    [pid unsigned-32]
    [drawable unsigned-32]
    [width unsigned-16]
    [height unsigned-16]
    [depth unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [shmseg seg]
    [offset unsigned-32]))
(define attachfd-opcode 6)
(define-ftype attachfd
  (struct
    [shmseg seg]
    [read_only boolean]
    [pad0 (array 3 unsigned-8)]))
(define createsegment-opcode 7)
(define-ftype createsegment
  (struct
    [shmseg seg]
    [size unsigned-32]
    [read_only boolean]
    [pad0 (array 3 unsigned-8)]))
(define-ftype createsegment-reply
  (struct
    [nfd unsigned-8]
    [pad0 (array 24 unsigned-8)]))
(define-ftype value_list-iterator
  (struct
    [data (* value_list)]
    [rem int]
    [index int]))
(define-ftype value_list-iterator
  (struct
    [data (* value_list)]
    [rem int]
    [index int]))
(define-ftype waitcondition-iterator
  (struct
    [data (* waitcondition)]
    [rem int]
    [index int]))
(define-ftype trigger-iterator
  (struct
    [data (* trigger)]
    [rem int]
    [index int]))
(define-ftype systemcounter-iterator
  (struct
    [data (* systemcounter)]
    [rem int]
    [index int]))
(define-ftype int64-iterator
  (struct
    [data (* int64)]
    [rem int]
    [index int]))
(define-ftype event-iterator
  (struct
    [data (* event)]
    [rem int]
    [index int]))
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
