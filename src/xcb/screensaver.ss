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
(define-ftype kind-iterator
  (struct
    [data (* unsigned-8)]
    [rem int]
    [index int]))
