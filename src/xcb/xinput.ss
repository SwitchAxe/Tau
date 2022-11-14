(import (enums))
(load "xfixes.ss")(load "xproto.ss")(define-ftype fp3232
  (struct
    [integral integer-32]
    [frac unsigned-32]))
(define getextensionversion-opcode 1)
(define-ftype getextensionversion
  (struct
    [name_len unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [name (* unsigned-8)]))
(define-ftype getextensionversion-reply
  (struct
    [xi_reply_type unsigned-8]
    [server_major unsigned-16]
    [server_minor unsigned-16]
    [present boolean]
    [pad0 (array 19 unsigned-8)]))
(define deviceuse (enum
  '((deviceuse-isxpointer 0)
  (deviceuse-isxkeyboard 0)
  (deviceuse-isxextensiondevice 1)
  (deviceuse-isxextensionkeyboard 2)
  (deviceuse-isxextensionpointer 3))))
(define inputclass (enum
  '((inputclass-key 0)
  (inputclass-button 0)
  (inputclass-valuator 1)
  (inputclass-feedback 2)
  (inputclass-proximity 3)
  (inputclass-focus 4)
  (inputclass-other 5))))
(define valuatormode (enum
  '((valuatormode-relative 0)
  (valuatormode-absolute 0))))
(define-ftype deviceinfo
  (struct
    [device_type unsigned-32]
    [device_id unsigned-8]
    [num_class_info unsigned-8]
    [device_use-enum unsigned-8]
    [pad0 (array 1 unsigned-8)]))
(define-ftype keyinfo
  (struct
    [class_id-enum unsigned-8]
    [len unsigned-8]
    [min_keycode unsigned-8]
    [max_keycode unsigned-8]
    [num_keys unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define-ftype buttoninfo
  (struct
    [class_id-enum unsigned-8]
    [len unsigned-8]
    [num_buttons unsigned-16]))
(define-ftype axisinfo
  (struct
    [resolution unsigned-32]
    [minimum integer-32]
    [maximum integer-32]))
(define-ftype valuatorinfo
  (struct
    [class_id-enum unsigned-8]
    [len unsigned-8]
    [axes_len unsigned-8]
    [mode-enum unsigned-8]
    [motion_size unsigned-32]
    [axes (* axisinfo)]))
(define-ftype inputinfo
  (struct
    [class_id-enum unsigned-8]
    [len unsigned-8]))
(define-ftype info
  (struct
    