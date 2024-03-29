(import (enums))
(load "xproto.ss")(load "xfixes.ss")(define redirect (enum
  '((redirect-automatic 0)
  (redirect-manual 0))))
(define queryversion-opcode 0)
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
(define redirectwindow-opcode 1)
(define-ftype redirectwindow
  (struct
    [window unsigned-32]
    [update-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define redirectsubwindows-opcode 2)
(define-ftype redirectsubwindows
  (struct
    [window unsigned-32]
    [update-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define unredirectwindow-opcode 3)
(define-ftype unredirectwindow
  (struct
    [window unsigned-32]
    [update-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define unredirectsubwindows-opcode 4)
(define-ftype unredirectsubwindows
  (struct
    [window unsigned-32]
    [update-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define createregionfromborderclip-opcode 5)
(define-ftype createregionfromborderclip
  (struct
    [region region]
    [window unsigned-32]))
(define namewindowpixmap-opcode 6)
(define-ftype namewindowpixmap
  (struct
    [window unsigned-32]
    [pixmap unsigned-32]))
(define getoverlaywindow-opcode 7)
(define-ftype getoverlaywindow
  (struct
    [window unsigned-32]))
(define-ftype getoverlaywindow-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [overlay_win unsigned-32]
    [pad1 (array 20 unsigned-8)]))
(define releaseoverlaywindow-opcode 8)
(define-ftype releaseoverlaywindow
  (struct
    [window unsigned-32]))
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
