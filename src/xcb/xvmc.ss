(import (enums))
(load "xv.ss")(define-ftype context unsigned-32)
(define-ftype surface unsigned-32)
(define-ftype subpicture unsigned-32)
(define-ftype surfaceinfo
  (struct
    [id surface]
    [chroma_format unsigned-16]
    [pad0 unsigned-16]
    [max_width unsigned-16]
    [max_height unsigned-16]
    [subpicture_max_width unsigned-16]
    [subpicture_max_height unsigned-16]
    [mc_type unsigned-32]
    [flags unsigned-32]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major unsigned-32]
    [minor unsigned-32]))
(define listsurfacetypes-opcode 1)
(define-ftype listsurfacetypes
  (struct
    [port_id port]))
(define-ftype listsurfacetypes-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [surfaces (* surfaceinfo)]))
(define createcontext-opcode 2)
(define-ftype createcontext
  (struct
    [context_id context]
    [port_id port]
    [surface_id surface]
    [width unsigned-16]
    [height unsigned-16]
    [flags unsigned-32]))
(define-ftype createcontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [width_actual unsigned-16]
    [height_actual unsigned-16]
    [flags_return unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [priv_data (* unsigned-32)]))
(define destroycontext-opcode 3)
(define-ftype destroycontext
  (struct
    [context_id context]))
(define createsurface-opcode 4)
(define-ftype createsurface
  (struct
    [surface_id surface]
    [context_id context]))
(define-ftype createsurface-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [pad1 (array 24 unsigned-8)]
    [priv_data (* unsigned-32)]))
(define destroysurface-opcode 5)
(define-ftype destroysurface
  (struct
    [surface_id surface]))
(define createsubpicture-opcode 6)
(define-ftype createsubpicture
  (struct
    [subpicture_id subpicture]
    [context context]
    [xvimage_id unsigned-32]
    [width unsigned-16]
    [height unsigned-16]))
(define-ftype createsubpicture-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [width_actual unsigned-16]
    [height_actual unsigned-16]
    [num_palette_entries unsigned-16]
    [entry_bytes unsigned-16]
    [component_order (array 4 (* unsigned-8))]
    [pad1 (array 12 unsigned-8)]
    [priv_data (* unsigned-32)]))
(define destroysubpicture-opcode 7)
(define-ftype destroysubpicture
  (struct
    [subpicture_id subpicture]))
(define listsubpicturetypes-opcode 8)
(define-ftype listsubpicturetypes
  (struct
    [port_id port]
    [surface_id surface]))
(define-ftype listsubpicturetypes-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [types (* imageformatinfo)]))
(define-ftype surfaceinfo-iterator (struct
  [data (* surfaceinfo)]
[rem int]
  [index int]))
(define-ftype byte-iterator
  (struct
    [data (* unsigned-8)]
    [rem int]
    [index int]))
