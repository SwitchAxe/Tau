(import (enums))
(load "xproto.ss")(define picttype (enum
  '((picttype-indexed 0)
  (picttype-direct 0))))
(define picture (enum
  '((picture-none 0))))
(define pictop (enum
  '((pictop-clear 0)
  (pictop-src 0)
  (pictop-dst 1)
  (pictop-over 2)
  (pictop-overreverse 3)
  (pictop-in 4)
  (pictop-inreverse 5)
  (pictop-out 6)
  (pictop-outreverse 7)
  (pictop-atop 8)
  (pictop-atopreverse 9)
  (pictop-xor 10)
  (pictop-add 11)
  (pictop-saturate 12)
  (pictop-disjointclear 13)
  (pictop-disjointsrc 16)
  (pictop-disjointdst 17)
  (pictop-disjointover 18)
  (pictop-disjointoverreverse 19)
  (pictop-disjointin 20)
  (pictop-disjointinreverse 21)
  (pictop-disjointout 22)
  (pictop-disjointoutreverse 23)
  (pictop-disjointatop 24)
  (pictop-disjointatopreverse 25)
  (pictop-disjointxor 26)
  (pictop-conjointclear 27)
  (pictop-conjointsrc 32)
  (pictop-conjointdst 33)
  (pictop-conjointover 34)
  (pictop-conjointoverreverse 35)
  (pictop-conjointin 36)
  (pictop-conjointinreverse 37)
  (pictop-conjointout 38)
  (pictop-conjointoutreverse 39)
  (pictop-conjointatop 40)
  (pictop-conjointatopreverse 41)
  (pictop-conjointxor 42)
  (pictop-multiply 43)
  (pictop-screen 48)
  (pictop-overlay 49)
  (pictop-darken 50)
  (pictop-lighten 51)
  (pictop-colordodge 52)
  (pictop-colorburn 53)
  (pictop-hardlight 54)
  (pictop-softlight 55)
  (pictop-difference 56)
  (pictop-exclusion 57)
  (pictop-hslhue 58)
  (pictop-hslsaturation 59)
  (pictop-hslcolor 60)
  (pictop-hslluminosity 61))))
(define polyedge (enum
  '((polyedge-sharp 0)
  (polyedge-smooth 0))))
(define polymode (enum
  '((polymode-precise 0)
  (polymode-imprecise 0))))
(define cp (enum
  '((cp-repeat 1)
  (cp-alphamap 1)
  (cp-alphaxorigin 2)
  (cp-alphayorigin 4)
  (cp-clipxorigin 8)
  (cp-clipyorigin 16)
  (cp-clipmask 32)
  (cp-graphicsexposure 64)
  (cp-subwindowmode 128)
  (cp-polyedge 256)
  (cp-polymode 512)
  (cp-dither 1024)
  (cp-componentalpha 2048))))
(define subpixel (enum
  '((subpixel-unknown 0)
  (subpixel-horizontalrgb 0)
  (subpixel-horizontalbgr 1)
  (subpixel-verticalrgb 2)
  (subpixel-verticalbgr 3)
  (subpixel-none 4))))
(define repeat (enum
  '((repeat-none 0)
  (repeat-normal 0)
  (repeat-pad 1)
  (repeat-reflect 2))))
(define-ftype glyphset unsigned-32)
(define-ftype picture unsigned-32)
(define-ftype pictformat unsigned-32)
(define pictformat-error-number 0)
(define-ftype pictformat-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define picture-error-number 1)
(define-ftype picture-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define pictop-error-number 2)
(define-ftype pictop-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define glyphset-error-number 3)
(define-ftype glyphset-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define glyph-error-number 4)
(define-ftype glyph-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define-ftype directformat
  (struct
    [red_shift unsigned-16]
    [red_mask unsigned-16]
    [green_shift unsigned-16]
    [green_mask unsigned-16]
    [blue_shift unsigned-16]
    [blue_mask unsigned-16]
    [alpha_shift unsigned-16]
    [alpha_mask unsigned-16]))
(define-ftype pictforminfo
  (struct
    [id pictformat]
    [type-enum unsigned-8]
    [depth unsigned-8]
    [pad0 (array 2 unsigned-8)]
    [direct directformat]
    [colormap unsigned-32]))
(define-ftype pictvisual
  (struct
    [visual unsigned-32]
    [format pictformat]))
(define-ftype pictdepth
  (struct
    [depth unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [num_visuals unsigned-16]
    [pad1 (array 4 unsigned-8)]
    [visuals (* pictvisual)]))
(define-ftype pictscreen
  (struct
    [num_depths unsigned-32]
    [fallback pictformat]
    [depths (* pictdepth)]))
(define-ftype indexvalue
  (struct
    [pixel unsigned-32]
    [red unsigned-16]
    [green unsigned-16]
    [blue unsigned-16]
    [alpha unsigned-16]))
(define-ftype color
  (struct
    [red unsigned-16]
    [green unsigned-16]
    [blue unsigned-16]
    [alpha unsigned-16]))
(define-ftype pointfix
  (struct
    [x integer-32]
    [y integer-32]))
(define-ftype linefix
  (struct
    [p1 pointfix]
    [p2 pointfix]))
(define-ftype triangle
  (struct
    [p1 pointfix]
    [p2 pointfix]
    [p3 pointfix]))
(define-ftype trapezoid
  (struct
    [top integer-32]
    [bottom integer-32]
    [left linefix]
    [right linefix]))
(define-ftype glyphinfo
  (struct
    [width unsigned-16]
    [height unsigned-16]
    [x integer-16]
    [y integer-16]
    [x_off integer-16]
    [y_off integer-16]))
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
(define-ftype querypictformats-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_formats unsigned-32]
    [num_screens unsigned-32]
    [num_depths unsigned-32]
    [num_visuals unsigned-32]
    [num_subpixel unsigned-32]
    [pad1 (array 4 unsigned-8)]
    [formats (* pictforminfo)]
    [screens (* pictscreen)]
    [subpixels (* unsigned-32)]))
(define querypictindexvalues-opcode 2)
(define-ftype querypictindexvalues
  (struct
    [format pictformat]))
(define-ftype querypictindexvalues-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_values unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [values (* indexvalue)]))
(define createpicture-opcode 4)
(define-ftype createpicture
  (struct
    [pid picture]
    [drawable unsigned-32]
    [format pictformat]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [Repeat unsigned-32]
    [repeat-enum unsigned-32]
    [alphamap picture]
    [alphaxorigin integer-32]
    [alphayorigin integer-32]
    [clipxorigin integer-32]
    [clipyorigin integer-32]
    [clipmask unsigned-32]
    [graphicsexposure unsigned-32]
    [subwindowmode-enum unsigned-32]
    [polyedge-enum unsigned-32]
    [polymode-enum unsigned-32]
    [dither unsigned-32]
    [componentalpha unsigned-32]))
(define changepicture-opcode 5)
(define-ftype changepicture
  (struct
    [picture picture]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [Repeat unsigned-32]
    [repeat-enum unsigned-32]
    [alphamap picture]
    [alphaxorigin integer-32]
    [alphayorigin integer-32]
    [clipxorigin integer-32]
    [clipyorigin integer-32]
    [clipmask unsigned-32]
    [graphicsexposure unsigned-32]
    [subwindowmode-enum unsigned-32]
    [polyedge-enum unsigned-32]
    [polymode-enum unsigned-32]
    [dither unsigned-32]
    [componentalpha unsigned-32]))
(define setpicturecliprectangles-opcode 6)
(define-ftype setpicturecliprectangles
  (struct
    [picture picture]
    [clip_x_origin integer-16]
    [clip_y_origin integer-16]
    [rectangles rectangle]))
(define freepicture-opcode 7)
(define-ftype freepicture
  (struct
    [picture picture]))
(define composite-opcode 8)
(define-ftype composite
  (struct
    [op-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [src picture]
    [mask picture]
    [dst picture]
    [src_x integer-16]
    [src_y integer-16]
    [mask_x integer-16]
    [mask_y integer-16]
    [dst_x integer-16]
    [dst_y integer-16]
    [width unsigned-16]
    [height unsigned-16]))
(define trapezoids-opcode 10)
(define-ftype trapezoids
  (struct
    [op-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [src picture]
    [dst picture]
    [mask_format pictformat]
    [src_x integer-16]
    [src_y integer-16]
    [traps trapezoid]))
(define triangles-opcode 11)
(define-ftype triangles
  (struct
    [op-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [src picture]
    [dst picture]
    [mask_format pictformat]
    [src_x integer-16]
    [src_y integer-16]
    [triangles triangle]))
(define tristrip-opcode 12)
(define-ftype tristrip
  (struct
    [op-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [src picture]
    [dst picture]
    [mask_format pictformat]
    [src_x integer-16]
    [src_y integer-16]
    [points pointfix]))
(define trifan-opcode 13)
(define-ftype trifan
  (struct
    [op-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [src picture]
    [dst picture]
    [mask_format pictformat]
    [src_x integer-16]
    [src_y integer-16]
    [points pointfix]))
(define createglyphset-opcode 17)
(define-ftype createglyphset
  (struct
    [gsid glyphset]
    [format pictformat]))
(define referenceglyphset-opcode 18)
(define-ftype referenceglyphset
  (struct
    [gsid glyphset]
    [existing glyphset]))
(define freeglyphset-opcode 19)
(define-ftype freeglyphset
  (struct
    [glyphset glyphset]))
(define addglyphs-opcode 20)
(define-ftype addglyphs
  (struct
    [glyphset glyphset]
    [glyphs_len unsigned-32]
    [glyphids (* unsigned-32)]
    [glyphs (* glyphinfo)]
    [data unsigned-8]))
(define freeglyphs-opcode 22)
(define-ftype freeglyphs
  (struct
    [glyphset glyphset]
    [glyphs unsigned-32]))
(define compositeglyphs8-opcode 23)
(define-ftype compositeglyphs8
  (struct
    [op-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [src picture]
    [dst picture]
    [mask_format pictformat]
    [glyphset glyphset]
    [src_x integer-16]
    [src_y integer-16]
    [glyphcmds unsigned-8]))
(define compositeglyphs16-opcode 24)
(define-ftype compositeglyphs16
  (struct
    [op-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [src picture]
    [dst picture]
    [mask_format pictformat]
    [glyphset glyphset]
    [src_x integer-16]
    [src_y integer-16]
    [glyphcmds unsigned-8]))
(define compositeglyphs32-opcode 25)
(define-ftype compositeglyphs32
  (struct
    [op-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [src picture]
    [dst picture]
    [mask_format pictformat]
    [glyphset glyphset]
    [src_x integer-16]
    [src_y integer-16]
    [glyphcmds unsigned-8]))
(define fillrectangles-opcode 26)
(define-ftype fillrectangles
  (struct
    [op-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [dst picture]
    [color color]
    [rects rectangle]))
(define createcursor-opcode 27)
(define-ftype createcursor
  (struct
    [cid unsigned-32]
    [source picture]
    [x unsigned-16]
    [y unsigned-16]))
(define-ftype transform
  (struct
    [matrix11 integer-32]
    [matrix12 integer-32]
    [matrix13 integer-32]
    [matrix21 integer-32]
    [matrix22 integer-32]
    [matrix23 integer-32]
    [matrix31 integer-32]
    [matrix32 integer-32]
    [matrix33 integer-32]))
(define setpicturetransform-opcode 28)
(define-ftype setpicturetransform
  (struct
    [picture picture]
    [transform transform]))
(define queryfilters-opcode 29)
(define-ftype queryfilters
  (struct
    [drawable unsigned-32]))
(define-ftype queryfilters-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_aliases unsigned-32]
    [num_filters unsigned-32]
    [pad1 (array 16 unsigned-8)]
    [aliases (* unsigned-16)]
    [filters (* str)]))
(define setpicturefilter-opcode 30)
(define-ftype setpicturefilter
  (struct
    [picture picture]
    [filter_len unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [filter (* unsigned-8)]
    [pad1 (array 4 unsigned-8)]
    [values integer-32]))
(define-ftype animcursorelt
  (struct
    [cursor unsigned-32]
    [delay unsigned-32]))
(define createanimcursor-opcode 31)
(define-ftype createanimcursor
  (struct
    [cid unsigned-32]
    [cursors animcursorelt]))
(define-ftype spanfix
  (struct
    [l integer-32]
    [r integer-32]
    [y integer-32]))
(define-ftype trap
  (struct
    [top spanfix]
    [bot spanfix]))
(define addtraps-opcode 32)
(define-ftype addtraps
  (struct
    [picture picture]
    [x_off integer-16]
    [y_off integer-16]
    [traps trap]))
(define createsolidfill-opcode 33)
(define-ftype createsolidfill
  (struct
    [picture picture]
    [color color]))
(define createlineargradient-opcode 34)
(define-ftype createlineargradient
  (struct
    [picture picture]
    [p1 pointfix]
    [p2 pointfix]
    [num_stops unsigned-32]
    [stops (* integer-32)]
    [colors (* color)]))
(define createradialgradient-opcode 35)
(define-ftype createradialgradient
  (struct
    [picture picture]
    [inner pointfix]
    [outer pointfix]
    [inner_radius integer-32]
    [outer_radius integer-32]
    [num_stops unsigned-32]
    [stops (* integer-32)]
    [colors (* color)]))
(define createconicalgradient-opcode 36)
(define-ftype createconicalgradient
  (struct
    [picture picture]
    [center pointfix]
    [angle integer-32]
    [num_stops unsigned-32]
    [stops (* integer-32)]
    [colors (* color)]))
