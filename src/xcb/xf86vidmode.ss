(import (enums))
(define modeflag (enum
  '((modeflag-positive_hsync 1)
  (modeflag-negative_hsync 1)
  (modeflag-positive_vsync 2)
  (modeflag-negative_vsync 4)
  (modeflag-interlace 8)
  (modeflag-composite_sync 16)
  (modeflag-positive_csync 32)
  (modeflag-negative_csync 64)
  (modeflag-hskew 128)
  (modeflag-broadcast 256)
  (modeflag-pixmux 512)
  (modeflag-double_clock 1024)
  (modeflag-half_clock 2048))))
(define clockflag (enum
  '((clockflag-programable 1))))
(define permission (enum
  '((permission-read 1)
  (permission-write 1))))
(define-ftype modeinfo
  (struct
    [dotclock unsigned-32]
    [hdisplay unsigned-16]
    [hsyncstart unsigned-16]
    [hsyncend unsigned-16]
    [htotal unsigned-16]
    [hskew unsigned-32]
    [vdisplay unsigned-16]
    [vsyncstart unsigned-16]
    [vsyncend unsigned-16]
    [vtotal unsigned-16]
    [pad0 (array 4 unsigned-8)]
    [flags-mask unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [privsize unsigned-32]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-16]
    [minor_version unsigned-16]))
(define getmodeline-opcode 1)
(define-ftype getmodeline
  (struct
    [screen unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define-ftype getmodeline-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [dotclock unsigned-32]
    [hdisplay unsigned-16]
    [hsyncstart unsigned-16]
    [hsyncend unsigned-16]
    [htotal unsigned-16]
    [hskew unsigned-16]
    [vdisplay unsigned-16]
    [vsyncstart unsigned-16]
    [vsyncend unsigned-16]
    [vtotal unsigned-16]
    [pad1 (array 2 unsigned-8)]
    [flags-mask unsigned-32]
    [pad2 (array 12 unsigned-8)]
    [privsize unsigned-32]
    [private (* unsigned-8)]))
(define modmodeline-opcode 2)
(define-ftype modmodeline
  (struct
    [screen unsigned-32]
    [hdisplay unsigned-16]
    [hsyncstart unsigned-16]
    [hsyncend unsigned-16]
    [htotal unsigned-16]
    [hskew unsigned-16]
    [vdisplay unsigned-16]
    [vsyncstart unsigned-16]
    [vsyncend unsigned-16]
    [vtotal unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [flags-mask unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [privsize unsigned-32]
    [private (* unsigned-8)]))
(define switchmode-opcode 3)
(define-ftype switchmode
  (struct
    [screen unsigned-16]
    [zoom unsigned-16]))
(define getmonitor-opcode 4)
(define-ftype getmonitor
  (struct
    [screen unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define-ftype getmonitor-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [vendor_length unsigned-8]
    [model_length unsigned-8]
    [num_hsync unsigned-8]
    [num_vsync unsigned-8]
    [pad1 (array 20 unsigned-8)]
    [hsync (* unsigned-32)]
    [vsync (* unsigned-32)]
    [vendor (* unsigned-8)]
    [alignment_pad void*]
    [model (* unsigned-8)]))
(define lockmodeswitch-opcode 5)
(define-ftype lockmodeswitch
  (struct
    [screen unsigned-16]
    [lock unsigned-16]))
(define getallmodelines-opcode 6)
(define-ftype getallmodelines
  (struct
    [screen unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define-ftype getallmodelines-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [modecount unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [modeinfo (* modeinfo)]))
(define addmodeline-opcode 7)
(define-ftype addmodeline
  (struct
    [screen unsigned-32]
    [dotclock unsigned-32]
    [hdisplay unsigned-16]
    [hsyncstart unsigned-16]
    [hsyncend unsigned-16]
    [htotal unsigned-16]
    [hskew unsigned-16]
    [vdisplay unsigned-16]
    [vsyncstart unsigned-16]
    [vsyncend unsigned-16]
    [vtotal unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [flags-mask unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [privsize unsigned-32]
    [after_dotclock unsigned-32]
    [after_hdisplay unsigned-16]
    [after_hsyncstart unsigned-16]
    [after_hsyncend unsigned-16]
    [after_htotal unsigned-16]
    [after_hskew unsigned-16]
    [after_vdisplay unsigned-16]
    [after_vsyncstart unsigned-16]
    [after_vsyncend unsigned-16]
    [after_vtotal unsigned-16]
    [pad2 (array 2 unsigned-8)]
    [after_flags-mask unsigned-32]
    [pad3 (array 12 unsigned-8)]
    [private (* unsigned-8)]))
(define deletemodeline-opcode 8)
(define-ftype deletemodeline
  (struct
    [screen unsigned-32]
    [dotclock unsigned-32]
    [hdisplay unsigned-16]
    [hsyncstart unsigned-16]
    [hsyncend unsigned-16]
    [htotal unsigned-16]
    [hskew unsigned-16]
    [vdisplay unsigned-16]
    [vsyncstart unsigned-16]
    [vsyncend unsigned-16]
    [vtotal unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [flags-mask unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [privsize unsigned-32]
    [private (* unsigned-8)]))
(define validatemodeline-opcode 9)
(define-ftype validatemodeline
  (struct
    [screen unsigned-32]
    [dotclock unsigned-32]
    [hdisplay unsigned-16]
    [hsyncstart unsigned-16]
    [hsyncend unsigned-16]
    [htotal unsigned-16]
    [hskew unsigned-16]
    [vdisplay unsigned-16]
    [vsyncstart unsigned-16]
    [vsyncend unsigned-16]
    [vtotal unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [flags-mask unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [privsize unsigned-32]
    [private (* unsigned-8)]))
(define-ftype validatemodeline-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [status unsigned-32]
    [pad1 (array 20 unsigned-8)]))
(define switchtomode-opcode 10)
(define-ftype switchtomode
  (struct
    [screen unsigned-32]
    [dotclock unsigned-32]
    [hdisplay unsigned-16]
    [hsyncstart unsigned-16]
    [hsyncend unsigned-16]
    [htotal unsigned-16]
    [hskew unsigned-16]
    [vdisplay unsigned-16]
    [vsyncstart unsigned-16]
    [vsyncend unsigned-16]
    [vtotal unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [flags-mask unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [privsize unsigned-32]
    [private (* unsigned-8)]))
(define getviewport-opcode 11)
(define-ftype getviewport
  (struct
    [screen unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define-ftype getviewport-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [x unsigned-32]
    [y unsigned-32]
    [pad1 (array 16 unsigned-8)]))
(define setviewport-opcode 12)
(define-ftype setviewport
  (struct
    [screen unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [x unsigned-32]
    [y unsigned-32]))
(define getdotclocks-opcode 13)
(define-ftype getdotclocks
  (struct
    [screen unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define-ftype getdotclocks-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [flags-mask unsigned-32]
    [clocks unsigned-32]
    [maxclocks unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [clock (array 1 unsigned-32)]))
(define setclientversion-opcode 14)
(define-ftype setclientversion
  (struct
    [major unsigned-16]
    [minor unsigned-16]))
(define setgamma-opcode 15)
(define-ftype setgamma
  (struct
    [screen unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [red unsigned-32]
    [green unsigned-32]
    [blue unsigned-32]
    [pad1 (array 12 unsigned-8)]))
(define getgamma-opcode 16)
(define-ftype getgamma
  (struct
    [screen unsigned-16]
    [pad0 (array 26 unsigned-8)]))
(define-ftype getgamma-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [red unsigned-32]
    [green unsigned-32]
    [blue unsigned-32]
    [pad1 (array 12 unsigned-8)]))
(define getgammaramp-opcode 17)
(define-ftype getgammaramp
  (struct
    [screen unsigned-16]
    [size unsigned-16]))
(define-ftype getgammaramp-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [size unsigned-16]
    [pad1 (array 22 unsigned-8)]
    [red (* unsigned-16)]
    [green (* unsigned-16)]
    [blue (* unsigned-16)]))
(define setgammaramp-opcode 18)
(define-ftype setgammaramp
  (struct
    [screen unsigned-16]
    [size unsigned-16]
    [red (* unsigned-16)]
    [green (* unsigned-16)]
    [blue (* unsigned-16)]))
(define getgammarampsize-opcode 19)
(define-ftype getgammarampsize
  (struct
    [screen unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define-ftype getgammarampsize-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [size unsigned-16]
    [pad1 (array 22 unsigned-8)]))
(define getpermissions-opcode 20)
(define-ftype getpermissions
  (struct
    [screen unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define-ftype getpermissions-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [permissions-mask unsigned-32]
    [pad1 (array 20 unsigned-8)]))
(define badclock-error-number 0)
(define-ftype badclock-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define badhtimings-error-number 1)
(define-ftype badhtimings-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define badvtimings-error-number 2)
(define-ftype badvtimings-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define modeunsuitable-error-number 3)
(define-ftype modeunsuitable-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define extensiondisabled-error-number 4)
(define-ftype extensiondisabled-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define clientnotlocal-error-number 5)
(define-ftype clientnotlocal-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define zoomlocked-error-number 6)
(define-ftype zoomlocked-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define-ftype modeinfo-iterator (struct
  [data (* modeinfo)]
[rem int]
  [index int]))
(define-ftype screeninfo-iterator (struct
  [data (* screeninfo)]
[rem int]
  [index int]))
(define-ftype info-iterator (struct
  [data (* info)]
[rem int]
  [index int]))
(define-ftype inputinfo-iterator (struct
  [data (* inputinfo)]
[rem int]
  [index int]))
(define-ftype valuatorinfo-iterator (struct
  [data (* valuatorinfo)]
[rem int]
  [index int]))
(define-ftype axisinfo-iterator (struct
  [data (* axisinfo)]
[rem int]
  [index int]))
(define-ftype buttoninfo-iterator (struct
  [data (* buttoninfo)]
[rem int]
  [index int]))
(define-ftype keyinfo-iterator (struct
  [data (* keyinfo)]
[rem int]
  [index int]))
(define-ftype deviceinfo-iterator (struct
  [data (* deviceinfo)]
[rem int]
  [index int]))
(define-ftype fp3232-iterator (struct
  [data (* fp3232)]
[rem int]
  [index int]))
(define-ftype details-iterator (struct
  [data (* details)]
[rem int]
  [index int]))
(define-ftype action-iterator (struct
  [data (* action)]
[rem int]
  [index int]))
(define-ftype syminterpret-iterator (struct
  [data (* syminterpret)]
[rem int]
  [index int]))
(define-ftype siaction-iterator (struct
  [data (* siaction)]
[rem int]
  [index int]))
(define-ftype sadevicevaluator-iterator (struct
  [data (* sadevicevaluator)]
[rem int]
  [index int]))
(define-ftype salockdevicebtn-iterator (struct
  [data (* salockdevicebtn)]
[rem int]
  [index int]))
(define-ftype sadevicebtn-iterator (struct
  [data (* sadevicebtn)]
[rem int]
  [index int]))
(define-ftype saredirectkey-iterator (struct
  [data (* saredirectkey)]
[rem int]
  [index int]))
(define-ftype saactionmessage-iterator (struct
  [data (* saactionmessage)]
[rem int]
  [index int]))
(define-ftype sasetcontrols-iterator (struct
  [data (* sasetcontrols)]
[rem int]
  [index int]))
(define-ftype saswitchscreen-iterator (struct
  [data (* saswitchscreen)]
[rem int]
  [index int]))
(define-ftype saterminate-iterator (struct
  [data (* saterminate)]
[rem int]
  [index int]))
(define-ftype saisolock-iterator (struct
  [data (* saisolock)]
[rem int]
  [index int]))
(define-ftype sasetptrdflt-iterator (struct
  [data (* sasetptrdflt)]
[rem int]
  [index int]))
(define-ftype salockptrbtn-iterator (struct
  [data (* salockptrbtn)]
[rem int]
  [index int]))
(define-ftype saptrbtn-iterator (struct
  [data (* saptrbtn)]
[rem int]
  [index int]))
(define-ftype samoveptr-iterator (struct
  [data (* samoveptr)]
[rem int]
  [index int]))
(define-ftype sasetgroup-iterator (struct
  [data (* sasetgroup)]
[rem int]
  [index int]))
(define-ftype sasetmods-iterator (struct
  [data (* sasetmods)]
[rem int]
  [index int]))
(define-ftype sanoaction-iterator (struct
  [data (* sanoaction)]
[rem int]
  [index int]))
(define-ftype deviceledinfo-iterator (struct
  [data (* deviceledinfo)]
[rem int]
  [index int]))
(define-ftype listing-iterator (struct
  [data (* listing)]
[rem int]
  [index int]))
(define-ftype row-iterator (struct
  [data (* row)]
[rem int]
  [index int]))
(define-ftype overlay-iterator (struct
  [data (* overlay)]
[rem int]
  [index int]))
(define-ftype overlayrow-iterator (struct
  [data (* overlayrow)]
[rem int]
  [index int]))
(define-ftype overlaykey-iterator (struct
  [data (* overlaykey)]
[rem int]
  [index int]))
(define-ftype key-iterator (struct
  [data (* key)]
[rem int]
  [index int]))
(define-ftype shape-iterator (struct
  [data (* shape)]
[rem int]
  [index int]))
(define-ftype outline-iterator (struct
  [data (* outline)]
[rem int]
  [index int]))
(define-ftype setkeytype-iterator (struct
  [data (* setkeytype)]
[rem int]
  [index int]))
(define-ftype ktsetmapentry-iterator (struct
  [data (* ktsetmapentry)]
[rem int]
  [index int]))
(define-ftype keyvmodmap-iterator (struct
  [data (* keyvmodmap)]
[rem int]
  [index int]))
(define-ftype keymodmap-iterator (struct
  [data (* keymodmap)]
[rem int]
  [index int]))
(define-ftype setexplicit-iterator (struct
  [data (* setexplicit)]
[rem int]
  [index int]))
(define-ftype setbehavior-iterator (struct
  [data (* setbehavior)]
[rem int]
  [index int]))
(define-ftype behavior-iterator (struct
  [data (* behavior)]
[rem int]
  [index int]))
(define-ftype overlaybehavior-iterator (struct
  [data (* overlaybehavior)]
[rem int]
  [index int]))
(define-ftype radiogroupbehavior-iterator (struct
  [data (* radiogroupbehavior)]
[rem int]
  [index int]))
(define-ftype defaultbehavior-iterator (struct
  [data (* defaultbehavior)]
[rem int]
  [index int]))
(define-ftype commonbehavior-iterator (struct
  [data (* commonbehavior)]
[rem int]
  [index int]))
(define-ftype keysymmap-iterator (struct
  [data (* keysymmap)]
[rem int]
  [index int]))
(define-ftype keytype-iterator (struct
  [data (* keytype)]
[rem int]
  [index int]))
(define-ftype ktmapentry-iterator (struct
  [data (* ktmapentry)]
[rem int]
  [index int]))
(define-ftype countedstring16-iterator (struct
  [data (* countedstring16)]
[rem int]
  [index int]))
(define-ftype keyalias-iterator (struct
  [data (* keyalias)]
[rem int]
  [index int]))
(define-ftype keyname-iterator (struct
  [data (* keyname)]
[rem int]
  [index int]))
(define-ftype moddef-iterator (struct
  [data (* moddef)]
[rem int]
  [index int]))
(define-ftype indicatormap-iterator (struct
  [data (* indicatormap)]
[rem int]
  [index int]))
(define-ftype printer-iterator (struct
  [data (* printer)]
[rem int]
  [index int]))
(define-ftype listitem-iterator (struct
  [data (* listitem)]
[rem int]
  [index int]))
(define-ftype imageformatinfo-iterator (struct
  [data (* imageformatinfo)]
[rem int]
  [index int]))
(define-ftype attributeinfo-iterator (struct
  [data (* attributeinfo)]
[rem int]
  [index int]))
(define-ftype image-iterator (struct
  [data (* image)]
[rem int]
  [index int]))
(define-ftype encodinginfo-iterator (struct
  [data (* encodinginfo)]
[rem int]
  [index int]))
(define-ftype adaptorinfo-iterator (struct
  [data (* adaptorinfo)]
[rem int]
  [index int]))
(define-ftype format-iterator (struct
  [data (* format)]
[rem int]
  [index int]))
(define-ftype rational-iterator (struct
  [data (* rational)]
[rem int]
  [index int]))
(define-ftype surfaceinfo-iterator (struct
  [data (* surfaceinfo)]
[rem int]
  [index int]))
(define-ftype keycode-iterator
  (struct
    [data (* unsigned-8)]
    [rem int]
    [index int]))
