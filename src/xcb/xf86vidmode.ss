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
