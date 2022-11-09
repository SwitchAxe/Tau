(load "enum.ss")
(define-ftype char2b
  (struct
    [byte1 unsigned-8]
    [byte2 unsigned-8]))
(define-ftype window unsigned-32)
(define-ftype pixmap unsigned-32)
(define-ftype cursor unsigned-32)
(define-ftype font unsigned-32)
(define-ftype gcontext unsigned-32)
(define-ftype colormap unsigned-32)
(define-ftype atom unsigned-32)
(define-ftype drawable
  (union
    [window unsigned-32]
    [pixmap unsigned-32]))
(define-ftype fontable
  (union
    [font unsigned-32]
    [gcontext unsigned-32]))
(define-ftype point
  (struct
    [x integer-16]
    [y integer-16]))
(define-ftype rectangle
  (struct
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]))
(define-ftype arc
  (struct
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [angle1 integer-16]
    [angle2 integer-16]))
(define-ftype format
  (struct
    [depth unsigned-8]
    [bits_per_pixel unsigned-8]
    [scanline_pad unsigned-8]
    [pad0 (array 5 unsigned-8)]))

(define visualclass (enum '((visualclass-staticgray 0)
    (visualclass-grayscale 1)
    (visualclass-staticcolor 2)
    (visualclass-pseudocolor 3)
    (visualclass-truecolor 4)
    (visualclass-directcolor 5))))
(define-ftype visualtype
  (struct
    [visual_id unsigned-32]
    [class-enum unsigned-8]
    [bits_per_rgb_value unsigned-8]
    [colormap_entries unsigned-16]
    [red_mask unsigned-32]
    [green_mask unsigned-32]
    [blue_mask unsigned-32]
    [pad0 (array 4 unsigned-8)]))
(define-ftype depth
  (struct
    [depth unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [visuals_len unsigned-16]
    [pad1 (array 4 unsigned-8)]
    [visuals (* visualtype)]))
