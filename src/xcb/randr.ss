(import (enums))
(load "xproto.ss")(load "render.ss")(define-ftype mode unsigned-32)
(define-ftype crtc unsigned-32)
(define-ftype output unsigned-32)
(define-ftype provider unsigned-32)
(define-ftype lease unsigned-32)
(define badoutput-error-number 0)
(define-ftype badoutput-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define badcrtc-error-number 1)
(define-ftype badcrtc-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define badmode-error-number 2)
(define-ftype badmode-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define badprovider-error-number 3)
(define-ftype badprovider-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define rotation (enum
  '((rotation-rotate_0 1)
  (rotation-rotate_90 1)
  (rotation-rotate_180 2)
  (rotation-rotate_270 4)
  (rotation-reflect_x 8)
  (rotation-reflect_y 16))))
(define-ftype screensize
  (struct
    [width unsigned-16]
    [height unsigned-16]
    [mwidth unsigned-16]
    [mheight unsigned-16]))
(define-ftype refreshrates
  (struct
    [nrates unsigned-16]
    [rates (* unsigned-16)]))
(define queryversion-opcode 0)
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
(define setconfig (enum
  '((setconfig-success 0)
  (setconfig-invalidconfigtime 0)
  (setconfig-invalidtime 1)
  (setconfig-failed 2))))
(define setscreenconfig-opcode 2)
(define-ftype setscreenconfig
  (struct
    [window unsigned-32]
    [timestamp timestamp]
    [config_timestamp timestamp]
    [sizeid unsigned-16]
    [rotation-mask unsigned-16]
    [rate unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define-ftype setscreenconfig-reply
  (struct
    [status-enum unsigned-8]
    [new_timestamp timestamp]
    [config_timestamp timestamp]
    [root unsigned-32]
    [subpixel_order-enum unsigned-16]
    [pad0 (array 10 unsigned-8)]))
(define notifymask (enum
  '((notifymask-screenchange 1)
  (notifymask-crtcchange 1)
  (notifymask-outputchange 2)
  (notifymask-outputproperty 4)
  (notifymask-providerchange 8)
  (notifymask-providerproperty 16)
  (notifymask-resourcechange 32)
  (notifymask-lease 64))))
(define selectinput-opcode 4)
(define-ftype selectinput
  (struct
    [window unsigned-32]
    [enable-mask unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define getscreeninfo-opcode 5)
(define-ftype getscreeninfo
  (struct
    [window unsigned-32]))
(define-ftype getscreeninfo-reply
  (struct
    [rotations-mask unsigned-8]
    [root unsigned-32]
    [timestamp timestamp]
    [config_timestamp timestamp]
    [nsizes unsigned-16]
    [sizeid unsigned-16]
    [rotation-mask unsigned-16]
    [rate unsigned-16]
    [ninfo unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [sizes (* screensize)]
    [rates (* refreshrates)]))
(define getscreensizerange-opcode 6)
(define-ftype getscreensizerange
  (struct
    [window unsigned-32]))
(define-ftype getscreensizerange-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [min_width unsigned-16]
    [min_height unsigned-16]
    [max_width unsigned-16]
    [max_height unsigned-16]
    [pad1 (array 16 unsigned-8)]))
(define setscreensize-opcode 7)
(define-ftype setscreensize
  (struct
    [window unsigned-32]
    [width unsigned-16]
    [height unsigned-16]
    [mm_width unsigned-32]
    [mm_height unsigned-32]))
(define modeflag (enum
  '((modeflag-hsyncpositive 1)
  (modeflag-hsyncnegative 1)
  (modeflag-vsyncpositive 2)
  (modeflag-vsyncnegative 4)
  (modeflag-interlace 8)
  (modeflag-doublescan 16)
  (modeflag-csync 32)
  (modeflag-csyncpositive 64)
  (modeflag-csyncnegative 128)
  (modeflag-hskewpresent 256)
  (modeflag-bcast 512)
  (modeflag-pixelmultiplex 1024)
  (modeflag-doubleclock 2048)
  (modeflag-halveclock 4096))))
(define-ftype modeinfo
  (struct
    [id unsigned-32]
    [width unsigned-16]
    [height unsigned-16]
    [dot_clock unsigned-32]
    [hsync_start unsigned-16]
    [hsync_end unsigned-16]
    [htotal unsigned-16]
    [hskew unsigned-16]
    [vsync_start unsigned-16]
    [vsync_end unsigned-16]
    [vtotal unsigned-16]
    [name_len unsigned-16]
    [mode_flags-mask unsigned-32]))
(define getscreenresources-opcode 8)
(define-ftype getscreenresources
  (struct
    [window unsigned-32]))
(define-ftype getscreenresources-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [timestamp timestamp]
    [config_timestamp timestamp]
    [num_crtcs unsigned-16]
    [num_outputs unsigned-16]
    [num_modes unsigned-16]
    [names_len unsigned-16]
    [pad1 (array 8 unsigned-8)]
    [crtcs (* crtc)]
    [outputs (* output)]
    [modes (* modeinfo)]
    [names (* unsigned-8)]))
(define connection (enum
  '((connection-connected 0)
  (connection-disconnected 0)
  (connection-unknown 1))))
(define getoutputinfo-opcode 9)
(define-ftype getoutputinfo
  (struct
    [output output]
    [config_timestamp timestamp]))
(define-ftype getoutputinfo-reply
  (struct
    [status-enum unsigned-8]
    [timestamp timestamp]
    [crtc crtc]
    [mm_width unsigned-32]
    [mm_height unsigned-32]
    [connection-enum unsigned-8]
    [subpixel_order-enum unsigned-8]
    [num_crtcs unsigned-16]
    [num_modes unsigned-16]
    [num_preferred unsigned-16]
    [num_clones unsigned-16]
    [name_len unsigned-16]
    [crtcs (* crtc)]
    [modes (* mode)]
    [clones (* output)]
    [name (* unsigned-8)]))
(define listoutputproperties-opcode 10)
(define-ftype listoutputproperties
  (struct
    [output output]))
(define-ftype listoutputproperties-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_atoms unsigned-16]
    [pad1 (array 22 unsigned-8)]
    [atoms (* unsigned-32)]))
(define queryoutputproperty-opcode 11)
(define-ftype queryoutputproperty
  (struct
    [output output]
    [property unsigned-32]))
(define-ftype queryoutputproperty-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [pending boolean]
    [range boolean]
    [immutable boolean]
    [pad1 (array 21 unsigned-8)]
    [validvalues (* integer-32)]))
(define configureoutputproperty-opcode 12)
(define-ftype configureoutputproperty
  (struct
    [output output]
    [property unsigned-32]
    [pending boolean]
    [range boolean]
    [pad0 (array 2 unsigned-8)]
    [values integer-32]))
(define changeoutputproperty-opcode 13)
(define-ftype changeoutputproperty
  (struct
    [output output]
    [property unsigned-32]
    [type unsigned-32]
    [format unsigned-8]
    [mode-enum unsigned-8]
    [pad0 (array 2 unsigned-8)]
    [num_units unsigned-32]
    [data void*]))
(define deleteoutputproperty-opcode 14)
(define-ftype deleteoutputproperty
  (struct
    [output output]
    [property unsigned-32]))
(define getoutputproperty-opcode 15)
(define-ftype getoutputproperty
  (struct
    [output output]
    [property unsigned-32]
    [type unsigned-32]
    [long_offset unsigned-32]
    [long_length unsigned-32]
    [delete boolean]
    [pending boolean]
    [pad0 (array 2 unsigned-8)]))
(define-ftype getoutputproperty-reply
  (struct
    [format unsigned-8]
    [type unsigned-32]
    [bytes_after unsigned-32]
    [num_items unsigned-32]
    [pad0 (array 12 unsigned-8)]
    [data (* unsigned-8)]))
(define createmode-opcode 16)
(define-ftype createmode
  (struct
    [window unsigned-32]
    [mode_info modeinfo]
    [name unsigned-8]))
(define-ftype createmode-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [mode mode]
    [pad1 (array 20 unsigned-8)]))
(define destroymode-opcode 17)
(define-ftype destroymode
  (struct
    [mode mode]))
(define addoutputmode-opcode 18)
(define-ftype addoutputmode
  (struct
    [output output]
    [mode mode]))
(define deleteoutputmode-opcode 19)
(define-ftype deleteoutputmode
  (struct
    [output output]
    [mode mode]))
(define getcrtcinfo-opcode 20)
(define-ftype getcrtcinfo
  (struct
    [crtc crtc]
    [config_timestamp timestamp]))
(define-ftype getcrtcinfo-reply
  (struct
    [status-enum unsigned-8]
    [timestamp timestamp]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [mode mode]
    [rotation-mask unsigned-16]
    [rotations-mask unsigned-16]
    [num_outputs unsigned-16]
    [num_possible_outputs unsigned-16]
    [outputs (* output)]
    [possible (* output)]))
(define setcrtcconfig-opcode 21)
(define-ftype setcrtcconfig
  (struct
    [crtc crtc]
    [timestamp timestamp]
    [config_timestamp timestamp]
    [x integer-16]
    [y integer-16]
    [mode mode]
    [rotation-mask unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [outputs output]))
(define-ftype setcrtcconfig-reply
  (struct
    [status-enum unsigned-8]
    [timestamp timestamp]
    [pad0 (array 20 unsigned-8)]))
(define getcrtcgammasize-opcode 22)
(define-ftype getcrtcgammasize
  (struct
    [crtc crtc]))
(define-ftype getcrtcgammasize-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [size unsigned-16]
    [pad1 (array 22 unsigned-8)]))
(define getcrtcgamma-opcode 23)
(define-ftype getcrtcgamma
  (struct
    [crtc crtc]))
(define-ftype getcrtcgamma-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [size unsigned-16]
    [pad1 (array 22 unsigned-8)]
    [red (* unsigned-16)]
    [green (* unsigned-16)]
    [blue (* unsigned-16)]))
(define setcrtcgamma-opcode 24)
(define-ftype setcrtcgamma
  (struct
    [crtc crtc]
    [size unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [red (* unsigned-16)]
    [green (* unsigned-16)]
    [blue (* unsigned-16)]))
(define getscreenresourcescurrent-opcode 25)
(define-ftype getscreenresourcescurrent
  (struct
    [window unsigned-32]))
(define-ftype getscreenresourcescurrent-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [timestamp timestamp]
    [config_timestamp timestamp]
    [num_crtcs unsigned-16]
    [num_outputs unsigned-16]
    [num_modes unsigned-16]
    [names_len unsigned-16]
    [pad1 (array 8 unsigned-8)]
    [crtcs (* crtc)]
    [outputs (* output)]
    [modes (* modeinfo)]
    [names (* unsigned-8)]))
(define transform (enum
  '((transform-unit 1)
  (transform-scaleup 1)
  (transform-scaledown 2)
  (transform-projective 4))))
(define setcrtctransform-opcode 26)
(define-ftype setcrtctransform
  (struct
    [crtc crtc]
    [transform transform]
    [filter_len unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [filter_name (* unsigned-8)]
    [pad1 (array 4 unsigned-8)]
    [filter_params fixed]))
(define getcrtctransform-opcode 27)
(define-ftype getcrtctransform
  (struct
    [crtc crtc]))
(define-ftype getcrtctransform-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [pending_transform transform]
    [has_transforms boolean]
    [pad1 (array 3 unsigned-8)]
    [current_transform transform]
    [pad2 (array 4 unsigned-8)]
    [pending_len unsigned-16]
    [pending_nparams unsigned-16]
    [current_len unsigned-16]
    [current_nparams unsigned-16]
    [pending_filter_name (* unsigned-8)]
    [pad3 (array 4 unsigned-8)]
    [pending_params (* fixed)]
    [current_filter_name (* unsigned-8)]
    [pad4 (array 4 unsigned-8)]
    [current_params (* fixed)]))
(define getpanning-opcode 28)
(define-ftype getpanning
  (struct
    [crtc crtc]))
(define-ftype getpanning-reply
  (struct
    [status-enum unsigned-8]
    [timestamp timestamp]
    [left unsigned-16]
    [top unsigned-16]
    [width unsigned-16]
    [height unsigned-16]
    [track_left unsigned-16]
    [track_top unsigned-16]
    [track_width unsigned-16]
    [track_height unsigned-16]
    [border_left integer-16]
    [border_top integer-16]
    [border_right integer-16]
    [border_bottom integer-16]))
(define setpanning-opcode 29)
(define-ftype setpanning
  (struct
    [crtc crtc]
    [timestamp timestamp]
    [left unsigned-16]
    [top unsigned-16]
    [width unsigned-16]
    [height unsigned-16]
    [track_left unsigned-16]
    [track_top unsigned-16]
    [track_width unsigned-16]
    [track_height unsigned-16]
    [border_left integer-16]
    [border_top integer-16]
    [border_right integer-16]
    [border_bottom integer-16]))
(define-ftype setpanning-reply
  (struct
    [status-enum unsigned-8]
    [timestamp timestamp]))
(define setoutputprimary-opcode 30)
(define-ftype setoutputprimary
  (struct
    [window unsigned-32]
    [output output]))
(define getoutputprimary-opcode 31)
(define-ftype getoutputprimary
  (struct
    [window unsigned-32]))
(define-ftype getoutputprimary-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [output output]))
(define getproviders-opcode 32)
(define-ftype getproviders
  (struct
    [window unsigned-32]))
(define-ftype getproviders-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [timestamp timestamp]
    [num_providers unsigned-16]
    [pad1 (array 18 unsigned-8)]
    [providers (* provider)]))
(define providercapability (enum
  '((providercapability-sourceoutput 1)
  (providercapability-sinkoutput 1)
  (providercapability-sourceoffload 2)
  (providercapability-sinkoffload 4))))
(define getproviderinfo-opcode 33)
(define-ftype getproviderinfo
  (struct
    [provider provider]
    [config_timestamp timestamp]))
(define-ftype getproviderinfo-reply
  (struct
    [status unsigned-8]
    [timestamp timestamp]
    [capabilities-mask unsigned-32]
    [num_crtcs unsigned-16]
    [num_outputs unsigned-16]
    [num_associated_providers unsigned-16]
    [name_len unsigned-16]
    [pad0 (array 8 unsigned-8)]
    [crtcs (* crtc)]
    [outputs (* output)]
    [associated_providers (* provider)]
    [associated_capability (* unsigned-32)]
    [name (* unsigned-8)]))
(define setprovideroffloadsink-opcode 34)
(define-ftype setprovideroffloadsink
  (struct
    [provider provider]
    [sink_provider provider]
    [config_timestamp timestamp]))
(define setprovideroutputsource-opcode 35)
(define-ftype setprovideroutputsource
  (struct
    [provider provider]
    [source_provider provider]
    [config_timestamp timestamp]))
(define listproviderproperties-opcode 36)
(define-ftype listproviderproperties
  (struct
    [provider provider]))
(define-ftype listproviderproperties-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [num_atoms unsigned-16]
    [pad1 (array 22 unsigned-8)]
    [atoms (* unsigned-32)]))
(define queryproviderproperty-opcode 37)
(define-ftype queryproviderproperty
  (struct
    [provider provider]
    [property unsigned-32]))
(define-ftype queryproviderproperty-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [pending boolean]
    [range boolean]
    [immutable boolean]
    [pad1 (array 21 unsigned-8)]
    [valid_values (* integer-32)]))
(define configureproviderproperty-opcode 38)
(define-ftype configureproviderproperty
  (struct
    [provider provider]
    [property unsigned-32]
    [pending boolean]
    [range boolean]
    [pad0 (array 2 unsigned-8)]
    [values integer-32]))
(define changeproviderproperty-opcode 39)
(define-ftype changeproviderproperty
  (struct
    [provider provider]
    [property unsigned-32]
    [type unsigned-32]
    [format unsigned-8]
    [mode unsigned-8]
    [pad0 (array 2 unsigned-8)]
    [num_items unsigned-32]
    [data void*]))
(define deleteproviderproperty-opcode 40)
(define-ftype deleteproviderproperty
  (struct
    [provider provider]
    [property unsigned-32]))
(define getproviderproperty-opcode 41)
(define-ftype getproviderproperty
  (struct
    [provider provider]
    [property unsigned-32]
    [type unsigned-32]
    [long_offset unsigned-32]
    [long_length unsigned-32]
    [delete boolean]
    [pending boolean]
    [pad0 (array 2 unsigned-8)]))
(define-ftype getproviderproperty-reply
  (struct
    [format unsigned-8]
    [type unsigned-32]
    [bytes_after unsigned-32]
    [num_items unsigned-32]
    [pad0 (array 12 unsigned-8)]
    [data void*]))
(define screenchangenotify-number 0)
(define-ftype screenchangenotify
    (struct
    [rotation-mask unsigned-8]
    [timestamp timestamp]
    [config_timestamp timestamp]
    [root unsigned-32]
    [request_window unsigned-32]
    [sizeid unsigned-16]
    [subpixel_order-enum unsigned-16]
    [width unsigned-16]
    [height unsigned-16]
    [mwidth unsigned-16]
    [mheight unsigned-16]))
(define notify (enum
  '((notify-crtcchange 0)
  (notify-outputchange 0)
  (notify-outputproperty 1)
  (notify-providerchange 2)
  (notify-providerproperty 3)
  (notify-resourcechange 4)
  (notify-lease 5))))
(define-ftype crtcchange
  (struct
    [timestamp timestamp]
    [window unsigned-32]
    [crtc crtc]
    [mode mode]
    [rotation-mask unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]))
(define-ftype outputchange
  (struct
    [timestamp timestamp]
    [config_timestamp timestamp]
    [window unsigned-32]
    [output output]
    [crtc crtc]
    [mode mode]
    [rotation-mask unsigned-16]
    [connection-enum unsigned-8]
    [subpixel_order-enum unsigned-8]))
(define-ftype outputproperty
  (struct
    [window unsigned-32]
    [output output]
    [atom unsigned-32]
    [timestamp timestamp]
    [status-enum unsigned-8]
    [pad0 (array 11 unsigned-8)]))
(define-ftype providerchange
  (struct
    [timestamp timestamp]
    [window unsigned-32]
    [provider provider]
    [pad0 (array 16 unsigned-8)]))
(define-ftype providerproperty
  (struct
    [window unsigned-32]
    [provider provider]
    [atom unsigned-32]
    [timestamp timestamp]
    [state unsigned-8]
    [pad0 (array 11 unsigned-8)]))
(define-ftype resourcechange
  (struct
    [timestamp timestamp]
    [window unsigned-32]
    [pad0 (array 20 unsigned-8)]))
(define-ftype monitorinfo
  (struct
    [name unsigned-32]
    [primary boolean]
    [automatic boolean]
    [noutput unsigned-16]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [width_in_millimeters unsigned-32]
    [height_in_millimeters unsigned-32]
    [outputs (* output)]))
(define getmonitors-opcode 42)
(define-ftype getmonitors
  (struct
    [window unsigned-32]
    [get_active boolean]))
(define-ftype getmonitors-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [timestamp timestamp]
    [nmonitors unsigned-32]
    [noutputs unsigned-32]
    [pad1 (array 12 unsigned-8)]
    [monitors (* monitorinfo)]))
(define setmonitor-opcode 43)
(define-ftype setmonitor
  (struct
    [window unsigned-32]
    [monitorinfo monitorinfo]))
(define deletemonitor-opcode 44)
(define-ftype deletemonitor
  (struct
    [window unsigned-32]
    [name unsigned-32]))
(define createlease-opcode 45)
(define-ftype createlease
  (struct
    [window unsigned-32]
    [lid lease]
    [num_crtcs unsigned-16]
    [num_outputs unsigned-16]
    [crtcs (* crtc)]
    [outputs (* output)]))
(define-ftype createlease-reply
  (struct
    [nfd unsigned-8]
    [pad0 (array 24 unsigned-8)]))
(define freelease-opcode 46)
(define-ftype freelease
  (struct
    [lid lease]
    [terminate unsigned-8]))
(define-ftype leasenotify
  (struct
    [timestamp timestamp]
    [window unsigned-32]
    [lease lease]
    [created unsigned-8]
    [pad0 (array 15 unsigned-8)]))
(define-ftype notifydata
  (union
    [cc crtcchange]
    [oc outputchange]
    [op outputproperty]
    [pc providerchange]
    [pp providerproperty]
    [rc resourcechange]
    [lc leasenotify]))
(define notify-number 1)
(define-ftype notify
    (struct
    [subcode-enum unsigned-8]
    [u notifydata]))
