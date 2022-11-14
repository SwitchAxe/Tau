(import (enums))
(load "xproto.ss")(load "render.ss")(load "shape.ss")(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [client_major_version unsigned-32]
    [client_minor_version unsigned-32]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-32]
    [minor_version unsigned-32]
    [pad1 (array 16 unsigned-8)]))
(define savesetmode (enum
  '((savesetmode-insert 0)
  (savesetmode-delete 0))))
(define savesettarget (enum
  '((savesettarget-nearest 0)
  (savesettarget-root 0))))
(define savesetmapping (enum
  '((savesetmapping-map 0)
  (savesetmapping-unmap 0))))
(define changesaveset-opcode 1)
(define-ftype changesaveset
  (struct
    [mode-enum unsigned-8]
    [target-enum unsigned-8]
    [map-enum unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))
(define selectionevent (enum
  '((selectionevent-setselectionowner 0)
  (selectionevent-selectionwindowdestroy 0)
  (selectionevent-selectionclientclose 1))))
(define selectioneventmask (enum
  '((selectioneventmask-setselectionowner 1)
  (selectioneventmask-selectionwindowdestroy 1)
  (selectioneventmask-selectionclientclose 2))))
(define selectionnotify-number 0)
(define-ftype selectionnotify
    (struct
    [subtype-enum unsigned-8]
    [window unsigned-32]
    [owner unsigned-32]
    [selection unsigned-32]
    [timestamp timestamp]
    [selection_timestamp timestamp]
    [pad0 (array 8 unsigned-8)]))
(define selectselectioninput-opcode 2)
(define-ftype selectselectioninput
  (struct
    [window unsigned-32]
    [selection unsigned-32]
    [event_mask-mask unsigned-32]))
(define cursornotify (enum
  '((cursornotify-displaycursor 0))))
(define cursornotifymask (enum
  '((cursornotifymask-displaycursor 1))))
(define cursornotify-number 1)
(define-ftype cursornotify
    (struct
    [subtype-enum unsigned-8]
    [window unsigned-32]
    [cursor_serial unsigned-32]
    [timestamp timestamp]
    [name unsigned-32]
    [pad0 (array 12 unsigned-8)]))
(define selectcursorinput-opcode 3)
(define-ftype selectcursorinput
  (struct
    [window unsigned-32]
    [event_mask-mask unsigned-32]))
(define-ftype getcursorimage-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [xhot unsigned-16]
    [yhot unsigned-16]
    [cursor_serial unsigned-32]
    [pad1 (array 8 unsigned-8)]
    [cursor_image (* unsigned-32)]))
(define-ftype region unsigned-32)
(define badregion-error-number 0)
(define-ftype badregion-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define region (enum
  '((region-none 0))))
(define createregion-opcode 5)
(define-ftype createregion
  (struct
    [region region]
    [rectangles rectangle]))
(define createregionfrombitmap-opcode 6)
(define-ftype createregionfrombitmap
  (struct
    [region region]
    [bitmap unsigned-32]))
(define createregionfromwindow-opcode 7)
(define-ftype createregionfromwindow
  (struct
    [region region]
    [window unsigned-32]
    [kind-enum shape:kind]
    [pad0 (array 3 unsigned-8)]))
(define createregionfromgc-opcode 8)
(define-ftype createregionfromgc
  (struct
    [region region]
    [gc unsigned-32]))
(define createregionfrompicture-opcode 9)
(define-ftype createregionfrompicture
  (struct
    [region region]
    [picture picture]))
(define destroyregion-opcode 10)
(define-ftype destroyregion
  (struct
    [region region]))
(define setregion-opcode 11)
(define-ftype setregion
  (struct
    [region region]
    [rectangles rectangle]))
(define copyregion-opcode 12)
(define-ftype copyregion
  (struct
    [source region]
    [destination region]))
(define unionregion-opcode 13)
(define-ftype unionregion
  (struct
    [source1 region]
    [source2 region]
    [destination region]))
(define intersectregion-opcode 14)
(define-ftype intersectregion
  (struct
    [source1 region]
    [source2 region]
    [destination region]))
(define subtractregion-opcode 15)
(define-ftype subtractregion
  (struct
    [source1 region]
    [source2 region]
    [destination region]))
(define invertregion-opcode 16)
(define-ftype invertregion
  (struct
    [source region]
    [bounds rectangle]
    [destination region]))
(define translateregion-opcode 17)
(define-ftype translateregion
  (struct
    [region region]
    [dx integer-16]
    [dy integer-16]))
(define regionextents-opcode 18)
(define-ftype regionextents
  (struct
    [source region]
    [destination region]))
(define fetchregion-opcode 19)
(define-ftype fetchregion
  (struct
    [region region]))
(define-ftype fetchregion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [extents rectangle]
    [pad1 (array 16 unsigned-8)]
    [rectangles (array 2 rectangle)]))
(define setgcclipregion-opcode 20)
(define-ftype setgcclipregion
  (struct
    [gc unsigned-32]
    [region region]
    [x_origin integer-16]
    [y_origin integer-16]))
(define setwindowshaperegion-opcode 21)
(define-ftype setwindowshaperegion
  (struct
    [dest unsigned-32]
    [dest_kind-enum shape:kind]
    [pad0 (array 3 unsigned-8)]
    [x_offset integer-16]
    [y_offset integer-16]
    [region region]))
(define setpictureclipregion-opcode 22)
(define-ftype setpictureclipregion
  (struct
    [picture picture]
    [region region]
    [x_origin integer-16]
    [y_origin integer-16]))
(define setcursorname-opcode 23)
(define-ftype setcursorname
  (struct
    [cursor unsigned-32]
    [nbytes unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [name (* unsigned-8)]))
(define getcursorname-opcode 24)
(define-ftype getcursorname
  (struct
    [cursor unsigned-32]))
(define-ftype getcursorname-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [atom unsigned-32]
    [nbytes unsigned-16]
    [pad1 (array 18 unsigned-8)]
    [name (* unsigned-8)]))
(define-ftype getcursorimageandname-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [xhot unsigned-16]
    [yhot unsigned-16]
    [cursor_serial unsigned-32]
    [cursor_atom unsigned-32]
    [nbytes unsigned-16]
    [pad1 (array 2 unsigned-8)]
    [cursor_image (* unsigned-32)]
    [name (* unsigned-8)]))
(define changecursor-opcode 26)
(define-ftype changecursor
  (struct
    [source unsigned-32]
    [destination unsigned-32]))
(define changecursorbyname-opcode 27)
(define-ftype changecursorbyname
  (struct
    [src unsigned-32]
    [nbytes unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [name (* unsigned-8)]))
(define expandregion-opcode 28)
(define-ftype expandregion
  (struct
    [source region]
    [destination region]
    [left unsigned-16]
    [right unsigned-16]
    [top unsigned-16]
    [bottom unsigned-16]))
(define hidecursor-opcode 29)
(define-ftype hidecursor
  (struct
    [window unsigned-32]))
(define showcursor-opcode 30)
(define-ftype showcursor
  (struct
    [window unsigned-32]))
(define-ftype barrier unsigned-32)
(define barrierdirections (enum
  '((barrierdirections-positivex 1)
  (barrierdirections-positivey 1)
  (barrierdirections-negativex 2)
  (barrierdirections-negativey 4))))
(define createpointerbarrier-opcode 31)
(define-ftype createpointerbarrier
  (struct
    [barrier barrier]
    [window unsigned-32]
    [x1 unsigned-16]
    [y1 unsigned-16]
    [x2 unsigned-16]
    [y2 unsigned-16]
    [directions-mask unsigned-32]
    [pad0 (array 2 unsigned-8)]
    [num_devices unsigned-16]
    [devices (* unsigned-16)]))
(define deletepointerbarrier-opcode 32)
(define-ftype deletepointerbarrier
  (struct
    [barrier barrier]))
(define clientdisconnectflags (enum
  '((clientdisconnectflags-default 0)
  (clientdisconnectflags-terminate 0))))
(define setclientdisconnectmode-opcode 33)
(define-ftype setclientdisconnectmode
  (struct
    [disconnect_mode-mask unsigned-32]))
(define-ftype getclientdisconnectmode-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [disconnect_mode-mask unsigned-32]
    [pad1 (array 20 unsigned-8)]))
(define-ftype trap-iterator
  (struct
    [data (* trap)]
    [rem int]
    [index int]))
(define-ftype spanfix-iterator
  (struct
    [data (* spanfix)]
    [rem int]
    [index int]))
(define-ftype animcursorelt-iterator
  (struct
    [data (* animcursorelt)]
    [rem int]
    [index int]))
(define-ftype transform-iterator
  (struct
    [data (* transform)]
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
(define-ftype glyphinfo-iterator
  (struct
    [data (* glyphinfo)]
    [rem int]
    [index int]))
(define-ftype trapezoid-iterator
  (struct
    [data (* trapezoid)]
    [rem int]
    [index int]))
(define-ftype triangle-iterator
  (struct
    [data (* triangle)]
    [rem int]
    [index int]))
(define-ftype linefix-iterator
  (struct
    [data (* linefix)]
    [rem int]
    [index int]))
(define-ftype pointfix-iterator
  (struct
    [data (* pointfix)]
    [rem int]
    [index int]))
(define-ftype color-iterator
  (struct
    [data (* color)]
    [rem int]
    [index int]))
(define-ftype indexvalue-iterator
  (struct
    [data (* indexvalue)]
    [rem int]
    [index int]))
(define-ftype pictscreen-iterator
  (struct
    [data (* pictscreen)]
    [rem int]
    [index int]))
(define-ftype pictdepth-iterator
  (struct
    [data (* pictdepth)]
    [rem int]
    [index int]))
(define-ftype pictvisual-iterator
  (struct
    [data (* pictvisual)]
    [rem int]
    [index int]))
(define-ftype pictforminfo-iterator
  (struct
    [data (* pictforminfo)]
    [rem int]
    [index int]))
(define-ftype directformat-iterator
  (struct
    [data (* directformat)]
    [rem int]
    [index int]))
(define-ftype visualinfos-iterator
  (struct
    [data (* visualinfos)]
    [rem int]
    [index int]))
(define-ftype visualinfo-iterator
  (struct
    [data (* visualinfo)]
    [rem int]
    [index int]))
(define-ftype bufferattributes-iterator
  (struct
    [data (* bufferattributes)]
    [rem int]
    [index int]))
(define-ftype swapinfo-iterator
  (struct
    [data (* swapinfo)]
    [rem int]
    [index int]))
(define-ftype swapinfo-iterator
  (struct
    [data (* swapinfo)]
    [rem int]
    [index int]))
(define-ftype attachformat-iterator
  (struct
    [data (* attachformat)]
    [rem int]
    [index int]))
(define-ftype dri2buffer-iterator
  (struct
    [data (* dri2buffer)]
    [rem int]
    [index int]))
(define-ftype drawable-iterator
  (struct
    [data (* drawable)]
    [rem int]
    [index int]))
(define-ftype notify-iterator
  (struct
    [data (* notify)]
    [rem int]
    [index int]))
(define-ftype notifydata-iterator
  (struct
    [data (* notifydata)]
    [rem int]
    [index int]))
(define-ftype leasenotify-iterator
  (struct
    [data (* leasenotify)]
    [rem int]
    [index int]))
(define-ftype monitorinfo-iterator
  (struct
    [data (* monitorinfo)]
    [rem int]
    [index int]))
(define-ftype resourcechange-iterator
  (struct
    [data (* resourcechange)]
    [rem int]
    [index int]))
(define-ftype providerproperty-iterator
  (struct
    [data (* providerproperty)]
    [rem int]
    [index int]))
(define-ftype providerchange-iterator
  (struct
    [data (* providerchange)]
    [rem int]
    [index int]))
(define-ftype outputproperty-iterator
  (struct
    [data (* outputproperty)]
    [rem int]
    [index int]))
(define-ftype outputchange-iterator
  (struct
    [data (* outputchange)]
    [rem int]
    [index int]))
(define-ftype crtcchange-iterator
  (struct
    [data (* crtcchange)]
    [rem int]
    [index int]))
(define-ftype modeinfo-iterator
  (struct
    [data (* modeinfo)]
    [rem int]
    [index int]))
(define-ftype refreshrates-iterator
  (struct
    [data (* refreshrates)]
    [rem int]
    [index int]))
(define-ftype screensize-iterator
  (struct
    [data (* screensize)]
    [rem int]
    [index int]))
(define-ftype clientinfo-iterator
  (struct
    [data (* clientinfo)]
    [rem int]
    [index int]))
(define-ftype range-iterator
  (struct
    [data (* range)]
    [rem int]
    [index int]))
(define-ftype extrange-iterator
  (struct
    [data (* extrange)]
    [rem int]
    [index int]))
(define-ftype range16-iterator
  (struct
    [data (* range16)]
    [rem int]
    [index int]))
(define-ftype range8-iterator
  (struct
    [data (* range8)]
    [rem int]
    [index int]))
(define-ftype resourcesizevalue-iterator
  (struct
    [data (* resourcesizevalue)]
    [rem int]
    [index int]))
(define-ftype resourcesizespec-iterator
  (struct
    [data (* resourcesizespec)]
    [rem int]
    [index int]))
(define-ftype resourceidspec-iterator
  (struct
    [data (* resourceidspec)]
    [rem int]
    [index int]))
(define-ftype clientidvalue-iterator
  (struct
    [data (* clientidvalue)]
    [rem int]
    [index int]))
(define-ftype clientidspec-iterator
  (struct
    [data (* clientidspec)]
    [rem int]
    [index int]))
(define-ftype type-iterator
  (struct
    [data (* type)]
    [rem int]
    [index int]))
(define-ftype client-iterator
  (struct
    [data (* client)]
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
