(import (enums))
(define redirect (enum
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
