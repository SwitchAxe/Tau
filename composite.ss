(load "enum.ss")

(define redirect (enum '((redirect-automatic 0)
    (redirect-manual 1))))
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
[window unsigned-32]
    [window unsigned-32]
    [update-enum unsigned-8]
    [pad2 (array 3 unsigned-8)]))
[window unsigned-32]
    [window unsigned-32]
    [update-enum unsigned-8]
    [pad3 (array 3 unsigned-8)]))
[window unsigned-32]
    [window unsigned-32]
    [update-enum unsigned-8]
    [pad4 (array 3 unsigned-8)]))
[window unsigned-32]
    [window unsigned-32]
    [update-enum unsigned-8]
    [pad5 (array 3 unsigned-8)]))
[region region]
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
