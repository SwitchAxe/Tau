(import (enums))
(load "xproto.ss")(define so (enum
  '((so-set 0)
  (so-union 0)
  (so-intersect 1)
  (so-subtract 2)
  (so-invert 3))))
(define sk (enum
  '((sk-bounding 0)
  (sk-clip 0)
  (sk-input 1))))
(define notify-number 0)
(define-ftype notify
    (struct
    [shape_kind-enum unsigned-8]
    [affected_window unsigned-32]
    [extents_x integer-16]
    [extents_y integer-16]
    [extents_width unsigned-16]
    [extents_height unsigned-16]
    [server_time timestamp]
    [shaped boolean]
    [pad0 (array 11 unsigned-8)]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-16]
    [minor_version unsigned-16]))
(define rectangles-opcode 1)
(define-ftype rectangles
  (struct
    [operation-enum unsigned-8]
    [destination_kind-enum unsigned-8]
    [ordering-enum unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [destination_window unsigned-32]
    [x_offset integer-16]
    [y_offset integer-16]
    [rectangles rectangle]))
(define mask-opcode 2)
(define-ftype mask
  (struct
    [operation-enum unsigned-8]
    [destination_kind-enum unsigned-8]
    [pad0 (array 2 unsigned-8)]
    [destination_window unsigned-32]
    [x_offset integer-16]
    [y_offset integer-16]
    [source_bitmap unsigned-32]))
(define combine-opcode 3)
(define-ftype combine
  (struct
    [operation-enum unsigned-8]
    [destination_kind-enum unsigned-8]
    [source_kind-enum unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [destination_window unsigned-32]
    [x_offset integer-16]
    [y_offset integer-16]
    [source_window unsigned-32]))
(define offset-opcode 4)
(define-ftype offset
  (struct
    [destination_kind-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [destination_window unsigned-32]
    [x_offset integer-16]
    [y_offset integer-16]))
(define queryextents-opcode 5)
(define-ftype queryextents
  (struct
    [destination_window unsigned-32]))
(define-ftype queryextents-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [bounding_shaped boolean]
    [clip_shaped boolean]
    [pad1 (array 2 unsigned-8)]
    [bounding_shape_extents_x integer-16]
    [bounding_shape_extents_y integer-16]
    [bounding_shape_extents_width unsigned-16]
    [bounding_shape_extents_height unsigned-16]
    [clip_shape_extents_x integer-16]
    [clip_shape_extents_y integer-16]
    [clip_shape_extents_width unsigned-16]
    [clip_shape_extents_height unsigned-16]))
(define selectinput-opcode 6)
(define-ftype selectinput
  (struct
    [destination_window unsigned-32]
    [enable boolean]
    [pad0 (array 3 unsigned-8)]))
(define inputselected-opcode 7)
(define-ftype inputselected
  (struct
    [destination_window unsigned-32]))
(define-ftype inputselected-reply
  (struct
    [enabled boolean]))
(define getrectangles-opcode 8)
(define-ftype getrectangles
  (struct
    [window unsigned-32]
    [source_kind-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define-ftype getrectangles-reply
  (struct
    [ordering-enum unsigned-8]
    [rectangles_len unsigned-32]
    [pad0 (array 20 unsigned-8)]
    [rectangles (* rectangle)]))
