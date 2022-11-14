(import (enums))
(load "xproto.ss")(define-ftype pixmap unsigned-32)
(define-ftype context unsigned-32)
(define-ftype pbuffer unsigned-32)
(define-ftype window unsigned-32)
(define-ftype fbconfig unsigned-32)
(define-ftype drawable
  (union
    [xproto:window "xproto:window"]
    [pbuffer "pbuffer"]
    [glx:pixmap "glx:pixmap"]
    [glx:window "glx:window"]))
(define generic-error-number -1)
(define-ftype generic-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]
   [bad_value unsigned-32]
    [minor_opcode unsigned-16]
    [major_opcode unsigned-8]
    [pad0 (array 21 unsigned-8)]))
(define pbufferclobber-number 0)
(define-ftype pbufferclobber
    (struct
    [pad1 (array 1 unsigned-8)]
    [event_type unsigned-16]
    [draw_type unsigned-16]
    [drawable glx:drawable]
    [b_mask unsigned-32]
    [aux_buffer unsigned-16]
    [x unsigned-16]
    [y unsigned-16]
    [width unsigned-16]
    [height unsigned-16]
    [count unsigned-16]
    [pad2 (array 4 unsigned-8)]))
(define bufferswapcomplete-number 1)
(define-ftype bufferswapcomplete
    (struct
    [pad3 (array 1 unsigned-8)]
    [event_type unsigned-16]
    [pad4 (array 2 unsigned-8)]
    [drawable glx:drawable]
    [ust_hi unsigned-32]
    [ust_lo unsigned-32]
    [msc_hi unsigned-32]
    [msc_lo unsigned-32]
    [sbc unsigned-32]))
(define pbcet (enum
  '((pbcet-damaged 32791)
  (pbcet-saved 32791))))
(define pbcdt (enum
  '((pbcdt-window 32793)
  (pbcdt-pbuffer 32793))))
(define render-opcode 1)
(define-ftype render
  (struct
    [context_tag unsigned-32]
    [data unsigned-8]))
(define renderlarge-opcode 2)
(define-ftype renderlarge
  (struct
    [context_tag unsigned-32]
    [request_num unsigned-16]
    [request_total unsigned-16]
    [data_len unsigned-32]
    [data (* unsigned-8)]))
(define createcontext-opcode 3)
(define-ftype createcontext
  (struct
    [context glx:context]
    [visual unsigned-32]
    [screen unsigned-32]
    [share_list glx:context]
    [is_direct boolean]
    [pad0 (array 3 unsigned-8)]))
(define destroycontext-opcode 4)
(define-ftype destroycontext
  (struct
    [context glx:context]))
(define makecurrent-opcode 5)
(define-ftype makecurrent
  (struct
    [drawable glx:drawable]
    [context glx:context]
    [old_context_tag unsigned-32]))
(define-ftype makecurrent-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_tag unsigned-32]
    [pad1 (array 20 unsigned-8)]))
(define isdirect-opcode 6)
(define-ftype isdirect
  (struct
    [context glx:context]))
(define-ftype isdirect-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [is_direct boolean]
    [pad1 (array 23 unsigned-8)]))
(define queryversion-opcode 7)
(define-ftype queryversion
  (struct
    [major_version unsigned-32]
    [minor_version unsigned-32]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-32]
    [minor_version unsigned-32]
    [pad1 (array 16 unsigned-8)]))
(define waitgl-opcode 8)
(define-ftype waitgl
  (struct
    [context_tag unsigned-32]))
(define waitx-opcode 9)
(define-ftype waitx
  (struct
    [context_tag unsigned-32]))
(define copycontext-opcode 10)
(define-ftype copycontext
  (struct
    [src glx:context]
    [dest glx:context]
    [mask unsigned-32]
    [src_context_tag unsigned-32]))
(define gc (enum
  '((gc-gl_current_bit 1)
  (gc-gl_point_bit 1)
  (gc-gl_line_bit 2)
  (gc-gl_polygon_bit 4)
  (gc-gl_polygon_stipple_bit 8)
  (gc-gl_pixel_mode_bit 16)
  (gc-gl_lighting_bit 32)
  (gc-gl_fog_bit 64)
  (gc-gl_depth_buffer_bit 128)
  (gc-gl_accum_buffer_bit 256)
  (gc-gl_stencil_buffer_bit 512)
  (gc-gl_viewport_bit 1024)
  (gc-gl_transform_bit 2048)
  (gc-gl_enable_bit 4096)
  (gc-gl_color_buffer_bit 8192)
  (gc-gl_hint_bit 16384)
  (gc-gl_eval_bit 32768)
  (gc-gl_list_bit 65536)
  (gc-gl_texture_bit 131072)
  (gc-gl_scissor_bit 262144)
  (gc-gl_all_attrib_bits 524288))))
(define swapbuffers-opcode 11)
(define-ftype swapbuffers
  (struct
    [context_tag unsigned-32]
    [drawable glx:drawable]))
(define usexfont-opcode 12)
(define-ftype usexfont
  (struct
    [context_tag unsigned-32]
    [font unsigned-32]
    [first unsigned-32]
    [count unsigned-32]
    [list_base unsigned-32]))
(define createglxpixmap-opcode 13)
(define-ftype createglxpixmap
  (struct
    [screen unsigned-32]
    [visual unsigned-32]
    [pixmap xproto:pixmap]
    [glx_pixmap glx:pixmap]))
(define getvisualconfigs-opcode 14)
(define-ftype getvisualconfigs
  (struct
    [screen unsigned-32]))
(define-ftype getvisualconfigs-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_visuals unsigned-32]
    [num_properties unsigned-32]
    [pad1 (array 16 unsigned-8)]
    [property_list (* unsigned-32)]))
(define destroyglxpixmap-opcode 15)
(define-ftype destroyglxpixmap
  (struct
    [glx_pixmap glx:pixmap]))
(define vendorprivate-opcode 16)
(define-ftype vendorprivate
  (struct
    [vendor_code unsigned-32]
    [context_tag unsigned-32]
    [data unsigned-8]))
(define vendorprivatewithreply-opcode 17)
(define-ftype vendorprivatewithreply
  (struct
    [vendor_code unsigned-32]
    [context_tag unsigned-32]
    [data unsigned-8]))
(define-ftype vendorprivatewithreply-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [retval unsigned-32]
    [data1 (array 24 (* unsigned-8))]
    [data2 (array 4 unsigned-8)]))
(define queryextensionsstring-opcode 18)
(define-ftype queryextensionsstring
  (struct
    [screen unsigned-32]))
(define-ftype queryextensionsstring-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [pad1 (array 4 unsigned-8)]
    [n unsigned-32]
    [pad2 (array 16 unsigned-8)]))
(define queryserverstring-opcode 19)
(define-ftype queryserverstring
  (struct
    [screen unsigned-32]
    [name unsigned-32]))
(define-ftype queryserverstring-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [pad1 (array 4 unsigned-8)]
    [str_len unsigned-32]
    [pad2 (array 16 unsigned-8)]
    [string (* unsigned-8)]))
(define clientinfo-opcode 20)
(define-ftype clientinfo
  (struct
    [major_version unsigned-32]
    [minor_version unsigned-32]
    [str_len unsigned-32]
    [string (* unsigned-8)]))
(define getfbconfigs-opcode 21)
(define-ftype getfbconfigs
  (struct
    [screen unsigned-32]))
(define-ftype getfbconfigs-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_fb_configs unsigned-32]
    [num_properties unsigned-32]
    [pad1 (array 16 unsigned-8)]
    [property_list (* unsigned-32)]))
(define createpixmap-opcode 22)
(define-ftype createpixmap
  (struct
    [screen unsigned-32]
    [fbconfig fbconfig]
    [pixmap xproto:pixmap]
    [glx_pixmap glx:pixmap]
    [num_attribs unsigned-32]
    [attribs (array 2 unsigned-32)]))
(define destroypixmap-opcode 23)
(define-ftype destroypixmap
  (struct
    [glx_pixmap glx:pixmap]))
(define createnewcontext-opcode 24)
(define-ftype createnewcontext
  (struct
    [context glx:context]
    [fbconfig fbconfig]
    [screen unsigned-32]
    [render_type unsigned-32]
    [share_list glx:context]
    [is_direct boolean]
    [pad0 (array 3 unsigned-8)]))
(define querycontext-opcode 25)
(define-ftype querycontext
  (struct
    [context glx:context]))
(define-ftype querycontext-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_attribs unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [attribs (array 2 unsigned-32)]))
(define makecontextcurrent-opcode 26)
(define-ftype makecontextcurrent
  (struct
    [old_context_tag unsigned-32]
    [drawable glx:drawable]
    [read_drawable glx:drawable]
    [context glx:context]))
(define-ftype makecontextcurrent-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [context_tag unsigned-32]
    [pad1 (array 20 unsigned-8)]))
(define createpbuffer-opcode 27)
(define-ftype createpbuffer
  (struct
    [screen unsigned-32]
    [fbconfig fbconfig]
    [pbuffer pbuffer]
    [num_attribs unsigned-32]
    [attribs (array 2 unsigned-32)]))
(define destroypbuffer-opcode 28)
(define-ftype destroypbuffer
  (struct
    [pbuffer pbuffer]))
(define getdrawableattributes-opcode 29)
(define-ftype getdrawableattributes
  (struct
    [drawable glx:drawable]))
(define-ftype getdrawableattributes-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_attribs unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [attribs (array 2 unsigned-32)]))
(define changedrawableattributes-opcode 30)
(define-ftype changedrawableattributes
  (struct
    [drawable glx:drawable]
    [num_attribs unsigned-32]
    [attribs (array 2 unsigned-32)]))
(define createwindow-opcode 31)
(define-ftype createwindow
  (struct
    [screen unsigned-32]
    [fbconfig fbconfig]
    [window xproto:window]
    [glx_window glx:window]
    [num_attribs unsigned-32]
    [attribs (array 2 unsigned-32)]))
(define deletewindow-opcode 32)
(define-ftype deletewindow
  (struct
    [glxwindow glx:window]))
(define setclientinfoarb-opcode 33)
(define-ftype setclientinfoarb
  (struct
    [major_version unsigned-32]
    [minor_version unsigned-32]
    [num_versions unsigned-32]
    [gl_str_len unsigned-32]
    [glx_str_len unsigned-32]
    [gl_versions (array 2 unsigned-32)]
    [gl_extension_string (* unsigned-8)]
    [pad0 (array 4 unsigned-8)]
    [glx_extension_string (* unsigned-8)]))
(define createcontextattribsarb-opcode 34)
(define-ftype createcontextattribsarb
  (struct
    [context glx:context]
    [fbconfig fbconfig]
    [screen unsigned-32]
    [share_list glx:context]
    [is_direct boolean]
    [pad0 (array 3 unsigned-8)]
    [num_attribs unsigned-32]
    [attribs (array 2 unsigned-32)]))
(define setclientinfo2arb-opcode 35)
(define-ftype setclientinfo2arb
  (struct
    [major_version unsigned-32]
    [minor_version unsigned-32]
    [num_versions unsigned-32]
    [gl_str_len unsigned-32]
    [glx_str_len unsigned-32]
    [gl_versions (array 3 unsigned-32)]
    [gl_extension_string (* unsigned-8)]
    [pad0 (array 4 unsigned-8)]
    [glx_extension_string (* unsigned-8)]))
(define newlist-opcode 101)
(define-ftype newlist
  (struct
    [context_tag unsigned-32]
    [list unsigned-32]
    [mode unsigned-32]))
(define endlist-opcode 102)
(define-ftype endlist
  (struct
    [context_tag unsigned-32]))
(define deletelists-opcode 103)
(define-ftype deletelists
  (struct
    [context_tag unsigned-32]
    [list unsigned-32]
    [range integer-32]))
(define genlists-opcode 104)
(define-ftype genlists
  (struct
    [context_tag unsigned-32]
    [range integer-32]))
(define-ftype genlists-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [ret_val unsigned-32]))
(define feedbackbuffer-opcode 105)
(define-ftype feedbackbuffer
  (struct
    [context_tag unsigned-32]
    [size integer-32]
    [type integer-32]))
(define selectbuffer-opcode 106)
(define-ftype selectbuffer
  (struct
    [context_tag unsigned-32]
    [size integer-32]))
(define rendermode-opcode 107)
(define-ftype rendermode
  (struct
    [context_tag unsigned-32]
    [mode unsigned-32]))
(define-ftype rendermode-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [ret_val unsigned-32]
    [n unsigned-32]
    [new_mode unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [data (* unsigned-32)]))
(define rm (enum
  '((rm-gl_render 7168)
  (rm-gl_feedback 7168)
  (rm-gl_select 7169))))
(define finish-opcode 108)
(define-ftype finish
  (struct
    [context_tag unsigned-32]))
(define-ftype finish-reply
  (struct
    [pad0 (array 1 unsigned-8)]))
(define pixelstoref-opcode 109)
(define-ftype pixelstoref
  (struct
    [context_tag unsigned-32]
    [pname unsigned-32]
    [datum float32]))
(define pixelstorei-opcode 110)
(define-ftype pixelstorei
  (struct
    [context_tag unsigned-32]
    [pname unsigned-32]
    [datum integer-32]))
(define readpixels-opcode 111)
(define-ftype readpixels
  (struct
    [context_tag unsigned-32]
    [x integer-32]
    [y integer-32]
    [width integer-32]
    [height integer-32]
    [format unsigned-32]
    [type unsigned-32]
    [swap_bytes boolean]
    [lsb_first boolean]))
(define-ftype readpixels-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [pad1 (array 24 unsigned-8)]
    [data (array 4 unsigned-8)]))
(define getbooleanv-opcode 112)
(define-ftype getbooleanv
  (struct
    [context_tag unsigned-32]
    [pname integer-32]))
(define-ftype getbooleanv-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [pad1 (array 4 unsigned-8)]
    [n unsigned-32]
    [datum boolean]
    [pad2 (array 15 unsigned-8)]
    [data (* boolean)]))
(define getclipplane-opcode 113)
(define-ftype getclipplane
  (struct
    [context_tag unsigned-32]
    [plane integer-32]))
(define-ftype getclipplane-reply
  (struct
    