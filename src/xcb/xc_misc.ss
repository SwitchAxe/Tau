(import (enums))
(define getversion-opcode 0)
(define-ftype getversion
  (struct
    [client_major_version unsigned-16]
    [client_minor_version unsigned-16]))
(define-ftype getversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [server_major_version unsigned-16]
    [server_minor_version unsigned-16]))
(define-ftype getxidrange-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [start_id unsigned-32]
    [count unsigned-32]))
(define getxidlist-opcode 2)
(define-ftype getxidlist
  (struct
    [count unsigned-32]))
(define-ftype getxidlist-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [ids_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [ids (* unsigned-32)]))
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