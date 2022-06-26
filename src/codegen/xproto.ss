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
    [pad (array 5 unsigned-8)]))

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
    [pad (array 4 unsigned-8)]))
(define-ftype depth
  (struct
    [depth unsigned-8]
    [pad (array 1 unsigned-8)]
    [visuals_len unsigned-16]
    [pad (array 4 unsigned-8)]))

(define eventmask (enum '((eventmask-noevent 0)
    (eventmask-keypress 1)
    (eventmask-keyrelease 2)
    (eventmask-buttonpress 4)
    (eventmask-buttonrelease 8)
    (eventmask-enterwindow 16)
    (eventmask-leavewindow 32)
    (eventmask-pointermotion 64)
    (eventmask-pointermotionhint 128)
    (eventmask-button1motion 256)
    (eventmask-button2motion 512)
    (eventmask-button3motion 1024)
    (eventmask-button4motion 2048)
    (eventmask-button5motion 4096)
    (eventmask-buttonmotion 8192)
    (eventmask-keymapstate 16384)
    (eventmask-exposure 32768)
    (eventmask-visibilitychange 65536)
    (eventmask-structurenotify 131072)
    (eventmask-resizeredirect 262144)
    (eventmask-substructurenotify 524288)
    (eventmask-substructureredirect 1048576)
    (eventmask-focuschange 2097152)
    (eventmask-propertychange 4194304)
    (eventmask-colormapchange 8388608)
    (eventmask-ownergrabbutton 16777216))))

(define backingstore (enum '((backingstore-notuseful 0)
    (backingstore-whenmapped 1)
    (backingstore-always 2))))
(define-ftype screen
  (struct
    [root unsigned-32]
    [default_colormap unsigned-32]
    [white_pixel unsigned-32]
    [black_pixel unsigned-32]
    [current_input_masks-mask unsigned-32]
    [width_in_pixels unsigned-16]
    [height_in_pixels unsigned-16]
    [width_in_millimeters unsigned-16]
    [height_in_millimeters unsigned-16]
    [min_installed_maps unsigned-16]
    [max_installed_maps unsigned-16]
    [root_visual unsigned-32]
    [backing_stores-enum unsigned-8]
    [save_unders boolean]
    [root_depth unsigned-8]
    [allowed_depths_len unsigned-8]))
(define-ftype setuprequest
  (struct
    [byte_order unsigned-8]
    [pad (array 1 unsigned-8)]
    [protocol_major_version unsigned-16]
    [protocol_minor_version unsigned-16]
    [authorization_protocol_name_len unsigned-16]
    [authorization_protocol_data_len unsigned-16]
    [pad (array 2 unsigned-8)]))
[pad (array 4 unsigned-8)]))
[pad (array 4 unsigned-8)]))
(define-ftype setupfailed
  (struct
    [status unsigned-8]
    [reason_len unsigned-8]
    [protocol_major_version unsigned-16]
    [protocol_minor_version unsigned-16]
    [length unsigned-16]))
(define-ftype setupauthenticate
  (struct
    [status unsigned-8]
    [pad (array 5 unsigned-8)]
    [length unsigned-16]))

(define imageorder (enum '((imageorder-lsbfirst 0)
    (imageorder-msbfirst 1))))
(define-ftype setup
  (struct
    [status unsigned-8]
    [pad (array 1 unsigned-8)]
    [protocol_major_version unsigned-16]
    [protocol_minor_version unsigned-16]
    [length unsigned-16]
    [release_number unsigned-32]
    [resource_id_base unsigned-32]
    [resource_id_mask unsigned-32]
    [motion_buffer_size unsigned-32]
    [vendor_len unsigned-16]
    [maximum_request_length unsigned-16]
    [roots_len unsigned-8]
    [pixmap_formats_len unsigned-8]
    [image_byte_order-enum unsigned-8]
    [bitmap_format_bit_order-enum unsigned-8]
    [bitmap_format_scanline_unit unsigned-8]
    [bitmap_format_scanline_pad unsigned-8]
    [min_keycode keycode]
    [max_keycode keycode]
    [pad (array 4 unsigned-8)]))
[pad (array 4 unsigned-8)]))

(define modmask (enum '((modmask-shift 1)
    (modmask-lock 2)
    (modmask-control 4)
    (modmask-1 8)
    (modmask-2 16)
    (modmask-3 32)
    (modmask-4 64)
    (modmask-5 128)
    (modmask-any 32768))))

(define keybutmask (enum '((keybutmask-shift 1)
    (keybutmask-lock 2)
    (keybutmask-control 4)
    (keybutmask-mod1 8)
    (keybutmask-mod2 16)
    (keybutmask-mod3 32)
    (keybutmask-mod4 64)
    (keybutmask-mod5 128)
    (keybutmask-button1 256)
    (keybutmask-button2 512)
    (keybutmask-button3 1024)
    (keybutmask-button4 2048)
    (keybutmask-button5 4096))))

(define window (enum '((window-none 0))))

(define buttonmask (enum '((buttonmask-1 256)
    (buttonmask-2 512)
    (buttonmask-3 1024)
    (buttonmask-4 2048)
    (buttonmask-5 4096)
    (buttonmask-any 32768))))

(define motion (enum '((motion-normal 0)
    (motion-hint 1))))

(define notifydetail (enum '((notifydetail-ancestor 0)
    (notifydetail-virtual 1)
    (notifydetail-inferior 2)
    (notifydetail-nonlinear 3)
    (notifydetail-nonlinearvirtual 4)
    (notifydetail-pointer 5)
    (notifydetail-pointerroot 6)
    (notifydetail-none 7))))

(define notifymode (enum '((notifymode-normal 0)
    (notifymode-grab 1)
    (notifymode-ungrab 2)
    (notifymode-whilegrabbed 3))))

(define visibility (enum '((visibility-unobscured 0)
    (visibility-partiallyobscured 1)
    (visibility-fullyobscured 2))))

(define place (enum '((place-ontop 0)
    (place-onbottom 1))))

(define property (enum '((property-newvalue 0)
    (property-delete 1))))

(define time (enum '((time-currenttime 0))))

(define atom (enum '((atom-none 0)
    (atom-any 0)
    (atom-primary 1)
    (atom-secondary 2)
    (atom-arc 3)
    (atom-atom 4)
    (atom-bitmap 5)
    (atom-cardinal 6)
    (atom-colormap 7)
    (atom-cursor 8)
    (atom-cut_buffer0 9)
    (atom-cut_buffer1 10)
    (atom-cut_buffer2 11)
    (atom-cut_buffer3 12)
    (atom-cut_buffer4 13)
    (atom-cut_buffer5 14)
    (atom-cut_buffer6 15)
    (atom-cut_buffer7 16)
    (atom-drawable 17)
    (atom-font 18)
    (atom-integer 19)
    (atom-pixmap 20)
    (atom-point 21)
    (atom-rectangle 22)
    (atom-resource_manager 23)
    (atom-rgb_color_map 24)
    (atom-rgb_best_map 25)
    (atom-rgb_blue_map 26)
    (atom-rgb_default_map 27)
    (atom-rgb_gray_map 28)
    (atom-rgb_green_map 29)
    (atom-rgb_red_map 30)
    (atom-string 31)
    (atom-visualid 32)
    (atom-window 33)
    (atom-wm_command 34)
    (atom-wm_hints 35)
    (atom-wm_client_machine 36)
    (atom-wm_icon_name 37)
    (atom-wm_icon_size 38)
    (atom-wm_name 39)
    (atom-wm_normal_hints 40)
    (atom-wm_size_hints 41)
    (atom-wm_zoom_hints 42)
    (atom-min_space 43)
    (atom-norm_space 44)
    (atom-max_space 45)
    (atom-end_space 46)
    (atom-superscript_x 47)
    (atom-superscript_y 48)
    (atom-subscript_x 49)
    (atom-subscript_y 50)
    (atom-underline_position 51)
    (atom-underline_thickness 52)
    (atom-strikeout_ascent 53)
    (atom-strikeout_descent 54)
    (atom-italic_angle 55)
    (atom-x_height 56)
    (atom-quad_width 57)
    (atom-weight 58)
    (atom-point_size 59)
    (atom-resolution 60)
    (atom-copyright 61)
    (atom-notice 62)
    (atom-font_name 63)
    (atom-family_name 64)
    (atom-full_name 65)
    (atom-cap_height 66)
    (atom-wm_class 67)
    (atom-wm_transient_for 68))))

(define colormapstate (enum '((colormapstate-uninstalled 0)
    (colormapstate-installed 1))))

(define colormap (enum '((colormap-none 0))))
(define-ftype clientmessagedata
  (union
    [clientmessage 33]
    [format unsigned-8]
    [window unsigned-32]
    [type unsigned-32]
    [data clientmessagedata]))

(define mapping (enum '((mapping-modifier 0)
    (mapping-keyboard 1)
    (mapping-pointer 2))))

(define windowclass (enum '((windowclass-copyfromparent 0)
    (windowclass-inputoutput 1)
    (windowclass-inputonly 2))))

(define cw (enum '((cw-backpixmap 1)
    (cw-backpixel 2)
    (cw-borderpixmap 4)
    (cw-borderpixel 8)
    (cw-bitgravity 16)
    (cw-wingravity 32)
    (cw-backingstore 64)
    (cw-backingplanes 128)
    (cw-backingpixel 256)
    (cw-overrideredirect 512)
    (cw-saveunder 1024)
    (cw-eventmask 2048)
    (cw-dontpropagate 4096)
    (cw-colormap 8192)
    (cw-cursor 16384))))

(define backpixmap (enum '((backpixmap-none 0)
    (backpixmap-parentrelative 1))))

(define gravity (enum '((gravity-bitforget 0)
    (gravity-winunmap 0)
    (gravity-northwest 1)
    (gravity-north 2)
    (gravity-northeast 3)
    (gravity-west 4)
    (gravity-center 5)
    (gravity-east 6)
    (gravity-southwest 7)
    (gravity-south 8)
    (gravity-southeast 9)
    (gravity-static 10))))
(define createwindow-opcode 1)
(define-ftype createwindow
  (struct
    [depth unsigned-8]
    [wid unsigned-32]
    [parent unsigned-32]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [border_width unsigned-16]
    [class-enum unsigned-16]
    [visual unsigned-32]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [BackPixmap unsigned-32]
    [background_pixmap unsigned-32]
    [BackPixel unsigned-32]
    [background_pixel unsigned-32]
    [BorderPixmap unsigned-32]
    [border_pixmap unsigned-32]
    [BorderPixel unsigned-32]
    [border_pixel unsigned-32]
    [BitGravity unsigned-32]
    [bit_gravity-enum unsigned-32]
    [WinGravity unsigned-32]
    [win_gravity-enum unsigned-32]
    [BackingStore unsigned-32]
    [backing_store-enum unsigned-32]
    [BackingPlanes unsigned-32]
    [backing_planes unsigned-32]
    [BackingPixel unsigned-32]
    [backing_pixel unsigned-32]
    [OverrideRedirect unsigned-32]
    [override_redirect unsigned-32]
    [SaveUnder unsigned-32]
    [save_under unsigned-32]
    [EventMask unsigned-32]
    [event_mask-mask unsigned-32]
    [DontPropagate unsigned-32]
    [do_not_propogate_mask-mask unsigned-32]
    [Colormap unsigned-32]
    [colormap unsigned-32]
    [Cursor unsigned-32]
    [cursor unsigned-32]))
[colormap-err unsigned-32]
    [match-err unsigned-32]
    [cursor-err unsigned-32]
    [pixmap-err unsigned-32]
    [value-err unsigned-32]
    [window-err unsigned-32]
    [alloc-err unsigned-32]))
(define changewindowattributes-opcode 2)
(define-ftype changewindowattributes
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [BackPixmap unsigned-32]
    [background_pixmap unsigned-32]
    [BackPixel unsigned-32]
    [background_pixel unsigned-32]
    [BorderPixmap unsigned-32]
    [border_pixmap unsigned-32]
    [BorderPixel unsigned-32]
    [border_pixel unsigned-32]
    [BitGravity unsigned-32]
    [bit_gravity-enum unsigned-32]
    [WinGravity unsigned-32]
    [win_gravity-enum unsigned-32]
    [BackingStore unsigned-32]
    [backing_store-enum unsigned-32]
    [BackingPlanes unsigned-32]
    [backing_planes unsigned-32]
    [BackingPixel unsigned-32]
    [backing_pixel unsigned-32]
    [OverrideRedirect unsigned-32]
    [override_redirect unsigned-32]
    [SaveUnder unsigned-32]
    [save_under unsigned-32]
    [EventMask unsigned-32]
    [event_mask-mask unsigned-32]
    [DontPropagate unsigned-32]
    [do_not_propogate_mask-mask unsigned-32]
    [Colormap unsigned-32]
    [colormap unsigned-32]
    [Cursor unsigned-32]
    [cursor unsigned-32]))
[access-err unsigned-32]
    [colormap-err unsigned-32]
    [cursor-err unsigned-32]
    [match-err unsigned-32]
    [pixmap-err unsigned-32]
    [value-err unsigned-32]
    [window-err unsigned-32]))

(define mapstate (enum '((mapstate-unmapped 0)
    (mapstate-unviewable 1)
    (mapstate-viewable 2))))
(define getwindowattributes-opcode 3)
(define-ftype getwindowattributes
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]))
(define-ftype getwindowattributes-reply
  (struct
    [visual unsigned-32]
    [class-enum unsigned-16]
    [bit_gravity-enum unsigned-8]
    [win_gravity-enum unsigned-8]
    [backing_planes unsigned-32]
    [backing_pixel unsigned-32]
    [save_under boolean]
    [map_is_installed boolean]
    [map_state-enum unsigned-8]
    [override_redirect boolean]
    [colormap unsigned-32]
    [all_event_masks-mask unsigned-32]
    [your_event_mask-mask unsigned-32]
    [do_not_propagate_mask-mask unsigned-16]
    [pad (array 2 unsigned-8)]))
[window-err unsigned-32]
    [drawable-err unsigned-32]))
(define destroywindow-opcode 4)
(define-ftype destroywindow
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]))
[window-err unsigned-32]))
(define destroysubwindows-opcode 5)
(define-ftype destroysubwindows
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]))

(define setmode (enum '((setmode-insert 0)
    (setmode-delete 1))))
(define changesaveset-opcode 6)
(define-ftype changesaveset
  (struct
    [mode-enum unsigned-8]
    [window unsigned-32]))
[match-err unsigned-32]
    [value-err unsigned-32]
    [window-err unsigned-32]))
(define reparentwindow-opcode 7)
(define-ftype reparentwindow
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]
    [parent unsigned-32]
    [x integer-16]
    [y integer-16]))
[match-err unsigned-32]
    [window-err unsigned-32]))
(define mapwindow-opcode 8)
(define-ftype mapwindow
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]))
[match-err unsigned-32]))
(define mapsubwindows-opcode 9)
(define-ftype mapsubwindows
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]))
(define unmapwindow-opcode 10)
(define-ftype unmapwindow
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]))
[window-err unsigned-32]))
(define unmapsubwindows-opcode 11)
(define-ftype unmapsubwindows
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]))

(define configwindow (enum '((configwindow-x 1)
    (configwindow-y 2)
    (configwindow-width 4)
    (configwindow-height 8)
    (configwindow-borderwidth 16)
    (configwindow-sibling 32)
    (configwindow-stackmode 64))))

(define stackmode (enum '((stackmode-above 0)
    (stackmode-below 1)
    (stackmode-topif 2)
    (stackmode-bottomif 3)
    (stackmode-opposite 4))))
(define configurewindow-opcode 12)
(define-ftype configurewindow
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]
    [value_mask-mask unsigned-16]
    [pad (array 2 unsigned-8)]))
(define-ftype value_list
  (struct
    [X unsigned-32]
    [x int32]
    [Y unsigned-32]
    [y int32]
    [Width unsigned-32]
    [width unsigned-32]
    [Height unsigned-32]
    [height unsigned-32]
    [BorderWidth unsigned-32]
    [border_width unsigned-32]
    [Sibling unsigned-32]
    [sibling unsigned-32]
    [StackMode unsigned-32]
    [stack_mode-enum unsigned-32]))
[match-err unsigned-32]
    [window-err unsigned-32]
    [value-err unsigned-32]))

(define circulate (enum '((circulate-raiselowest 0)
    (circulate-lowerhighest 1))))
(define circulatewindow-opcode 13)
(define-ftype circulatewindow
  (struct
    [direction-enum unsigned-8]
    [window unsigned-32]))
[window-err unsigned-32]
    [value-err unsigned-32]))
(define getgeometry-opcode 14)
(define-ftype getgeometry
  (struct
    [pad (array 1 unsigned-8)]
    [drawable unsigned-32]))
(define-ftype getgeometry-reply
  (struct
    [root unsigned-32]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [border_width unsigned-16]
    [pad (array 2 unsigned-8)]))
[drawable-err unsigned-32]
    [window-err unsigned-32]))
(define querytree-opcode 15)
(define-ftype querytree
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]))
(define-ftype querytree-reply
  (struct
    [root unsigned-32]
    [parent unsigned-32]
    [children_len unsigned-16]
    [pad (array 14 unsigned-8)]))
(define internatom-opcode 16)
(define-ftype internatom
  (struct
    [only_if_exists boolean]
    [name_len unsigned-16]
    [pad (array 2 unsigned-8)]))
(define-ftype internatom-reply
  (struct
    [atom unsigned-32]))
[alloc-err unsigned-32]
    [value-err unsigned-32]))
(define getatomname-opcode 17)
(define-ftype getatomname
  (struct
    [pad (array 1 unsigned-8)]
    [atom unsigned-32]))
(define-ftype getatomname-reply
  (struct
    [name_len unsigned-16]
    [pad (array 22 unsigned-8)]))

(define propmode (enum '((propmode-replace 0)
    (propmode-prepend 1)
    (propmode-append 2))))
(define changeproperty-opcode 18)
(define-ftype changeproperty
  (struct
    [mode-enum unsigned-8]
    [window unsigned-32]
    [property unsigned-32]
    [type unsigned-32]
    [format unsigned-8]
    [pad (array 3 unsigned-8)]
    [data_len unsigned-32]))
[match-err unsigned-32]
    [value-err unsigned-32]
    [window-err unsigned-32]
    [atom-err unsigned-32]
    [alloc-err unsigned-32]))
(define deleteproperty-opcode 19)
(define-ftype deleteproperty
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]
    [property unsigned-32]))

(define getpropertytype (enum '((getpropertytype-any 0))))
(define getproperty-opcode 20)
(define-ftype getproperty
  (struct
    [delete boolean]
    [window unsigned-32]
    [property unsigned-32]
    [type unsigned-32]
    [long_offset unsigned-32]
    [long_length unsigned-32]))
(define-ftype getproperty-reply
  (struct
    [type unsigned-32]
    [bytes_after unsigned-32]
    [value_len unsigned-32]
    [pad (array 12 unsigned-8)]))
[window-err unsigned-32]
    [atom-err unsigned-32]
    [value-err unsigned-32]))
(define listproperties-opcode 21)
(define-ftype listproperties
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]))
(define-ftype listproperties-reply
  (struct
    [atoms_len unsigned-16]
    [pad (array 22 unsigned-8)]))
(define setselectionowner-opcode 22)
(define-ftype setselectionowner
  (struct
    [pad (array 1 unsigned-8)]
    [owner unsigned-32]
    [selection unsigned-32]
    [time timestamp]))
[atom-err unsigned-32]))
(define getselectionowner-opcode 23)
(define-ftype getselectionowner
  (struct
    [pad (array 1 unsigned-8)]
    [selection unsigned-32]))
(define-ftype getselectionowner-reply
  (struct
    [owner unsigned-32]))
[atom-err unsigned-32]))
(define convertselection-opcode 24)
(define-ftype convertselection
  (struct
    [pad (array 1 unsigned-8)]
    [requestor unsigned-32]
    [selection unsigned-32]
    [target unsigned-32]
    [property unsigned-32]
    [time timestamp]))

(define sendeventdest (enum '((sendeventdest-pointerwindow 0)
    (sendeventdest-itemfocus 1))))
(define sendevent-opcode 25)
(define-ftype sendevent
  (struct
    [propagate boolean]
    [destination unsigned-32]
    [event_mask-mask unsigned-32]))
[window-err unsigned-32]
    [value-err unsigned-32]))

(define grabmode (enum '((grabmode-sync 0)
    (grabmode-async 1))))

(define grabstatus (enum '((grabstatus-success 0)
    (grabstatus-alreadygrabbed 1)
    (grabstatus-invalidtime 2)
    (grabstatus-notviewable 3)
    (grabstatus-frozen 4))))

(define cursor (enum '((cursor-none 0))))
(define grabpointer-opcode 26)
(define-ftype grabpointer
  (struct
    [owner_events boolean]
    [grab_window unsigned-32]
    [event_mask-mask unsigned-16]
    [pointer_mode-enum unsigned-8]
    [keyboard_mode-enum unsigned-8]
    [confine_to unsigned-32]
    [cursor unsigned-32]
    [time timestamp]))
(define-ftype grabpointer-reply
  (struct
    [value-err unsigned-32]
    [window-err unsigned-32]))
(define ungrabpointer-opcode 27)
(define-ftype ungrabpointer
  (struct
    [pad (array 1 unsigned-8)]
    [time timestamp]))

(define buttonindex (enum '((buttonindex-any 0)
    (buttonindex-1 1)
    (buttonindex-2 2)
    (buttonindex-3 3)
    (buttonindex-4 4)
    (buttonindex-5 5))))
(define grabbutton-opcode 28)
(define-ftype grabbutton
  (struct
    [owner_events boolean]
    [grab_window unsigned-32]
    [event_mask-mask unsigned-16]
    [pointer_mode-enum unsigned-8]
    [keyboard_mode-enum unsigned-8]
    [confine_to unsigned-32]
    [cursor unsigned-32]
    [button-enum unsigned-8]
    [pad (array 1 unsigned-8)]
    [modifiers-mask unsigned-16]))
[access-err unsigned-32]
    [value-err unsigned-32]
    [cursor-err unsigned-32]
    [window-err unsigned-32]))
(define ungrabbutton-opcode 29)
(define-ftype ungrabbutton
  (struct
    [button-enum unsigned-8]
    [grab_window unsigned-32]
    [modifiers-mask unsigned-16]
    [pad (array 2 unsigned-8)]))
(define changeactivepointergrab-opcode 30)
(define-ftype changeactivepointergrab
  (struct
    [pad (array 1 unsigned-8)]
    [cursor unsigned-32]
    [time timestamp]
    [event_mask-mask unsigned-16]
    [pad (array 2 unsigned-8)]))
(define grabkeyboard-opcode 31)
(define-ftype grabkeyboard
  (struct
    [owner_events boolean]
    [grab_window unsigned-32]
    [time timestamp]
    [pointer_mode-enum unsigned-8]
    [keyboard_mode-enum unsigned-8]
    [pad (array 2 unsigned-8)]))
(define-ftype grabkeyboard-reply
  (struct
    [value-err unsigned-32]
    [window-err unsigned-32]))
(define ungrabkeyboard-opcode 32)
(define-ftype ungrabkeyboard
  (struct
    [pad (array 1 unsigned-8)]
    [time timestamp]))

(define grab (enum '((grab-any 0))))
(define grabkey-opcode 33)
(define-ftype grabkey
  (struct
    [owner_events boolean]
    [grab_window unsigned-32]
    [modifiers-mask unsigned-16]
    [key keycode]
    [pointer_mode-enum unsigned-8]
    [keyboard_mode-enum unsigned-8]
    [pad (array 3 unsigned-8)]))
[access-err unsigned-32]
    [value-err unsigned-32]
    [window-err unsigned-32]))
(define ungrabkey-opcode 34)
(define-ftype ungrabkey
  (struct
    [key keycode]
    [grab_window unsigned-32]
    [modifiers-mask unsigned-16]
    [pad (array 2 unsigned-8)]))
[window-err unsigned-32]
    [value-err unsigned-32]))

(define allow (enum '((allow-asyncpointer 0)
    (allow-syncpointer 1)
    (allow-replaypointer 2)
    (allow-asynckeyboard 3)
    (allow-synckeyboard 4)
    (allow-replaykeyboard 5)
    (allow-asyncboth 6)
    (allow-syncboth 7))))
(define allowevents-opcode 35)
(define-ftype allowevents
  (struct
    [mode-enum unsigned-8]
    [time timestamp]))
[value-err unsigned-32]))
(define grabserver-opcode 36)
(define-ftype grabserver
  (struct
    (define ungrabserver-opcode 37)
(define-ftype ungrabserver
  (struct
    (define querypointer-opcode 38)
(define-ftype querypointer
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]))
(define-ftype querypointer-reply
  (struct
    [root unsigned-32]
    [child unsigned-32]
    [root_x integer-16]
    [root_y integer-16]
    [win_x integer-16]
    [win_y integer-16]
    [mask-mask unsigned-16]
    [pad (array 2 unsigned-8)]))
[window-err unsigned-32]))
(define-ftype timecoord
  (struct
    [time timestamp]
    [x integer-16]
    [y integer-16]))
(define getmotionevents-opcode 39)
(define-ftype getmotionevents
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]
    [start timestamp]
    [stop timestamp]))
(define-ftype getmotionevents-reply
  (struct
    [events_len unsigned-32]
    [pad (array 20 unsigned-8)]))
(define translatecoordinates-opcode 40)
(define-ftype translatecoordinates
  (struct
    [pad (array 1 unsigned-8)]
    [src_window unsigned-32]
    [dst_window unsigned-32]
    [src_x integer-16]
    [src_y integer-16]))
(define-ftype translatecoordinates-reply
  (struct
    [child unsigned-32]
    [dst_x integer-16]
    [dst_y integer-16]))
(define warppointer-opcode 41)
(define-ftype warppointer
  (struct
    [pad (array 1 unsigned-8)]
    [src_window unsigned-32]
    [dst_window unsigned-32]
    [src_x integer-16]
    [src_y integer-16]
    [src_width unsigned-16]
    [src_height unsigned-16]
    [dst_x integer-16]
    [dst_y integer-16]))
[window-err unsigned-32]))

(define inputfocus (enum '((inputfocus-none 0)
    (inputfocus-pointerroot 1)
    (inputfocus-parent 2)
    (inputfocus-followkeyboard 3))))
(define setinputfocus-opcode 42)
(define-ftype setinputfocus
  (struct
    [revert_to-enum unsigned-8]
    [focus unsigned-32]
    [time timestamp]))
[window-err unsigned-32]
    [match-err unsigned-32]
    [value-err unsigned-32]))
(define-ftype getinputfocus-reply
  (struct
    [focus unsigned-32]))
(define-ftype querykeymap-reply
  (struct
    (define openfont-opcode 45)
(define-ftype openfont
  (struct
    [pad (array 1 unsigned-8)]
    [fid unsigned-32]
    [name_len unsigned-16]
    [pad (array 2 unsigned-8)]))
[name-err unsigned-32]))
(define closefont-opcode 46)
(define-ftype closefont
  (struct
    [pad (array 1 unsigned-8)]
    [font unsigned-32]))

(define fontdraw (enum '((fontdraw-lefttoright 0)
    (fontdraw-righttoleft 1))))
(define-ftype fontprop
  (struct
    [name unsigned-32]
    [value unsigned-32]))
(define-ftype charinfo
  (struct
    [left_side_bearing integer-16]
    [right_side_bearing integer-16]
    [character_width integer-16]
    [ascent integer-16]
    [descent integer-16]
    [attributes unsigned-16]))
(define queryfont-opcode 47)
(define-ftype queryfont
  (struct
    [pad (array 1 unsigned-8)]
    [font unsigned-32]))
(define-ftype queryfont-reply
  (struct
    [min_bounds charinfo]
    [pad (array 4 unsigned-8)]
    [max_bounds charinfo]
    [pad (array 4 unsigned-8)]
    [min_char_or_byte2 unsigned-16]
    [max_char_or_byte2 unsigned-16]
    [default_char unsigned-16]
    [properties_len unsigned-16]
    [draw_direction-enum unsigned-8]
    [min_byte1 unsigned-8]
    [max_byte1 unsigned-8]
    [all_chars_exist boolean]
    [font_ascent integer-16]
    [font_descent integer-16]
    [char_infos_len unsigned-32]))
(define querytextextents-opcode 48)
(define-ftype querytextextents
  (struct
    [odd_length boolean]))
[font unsigned-32]))
(define-ftype querytextextents-reply
  (struct
    [font_ascent integer-16]
    [font_descent integer-16]
    [overall_ascent integer-16]
    [overall_descent integer-16]
    [overall_width int32]
    [overall_left int32]
    [overall_right int32]))
[gcontext-err unsigned-32]
    [font-err unsigned-32]))
(define-ftype str
  (struct
    [name_len unsigned-8]))
(define listfonts-opcode 49)
(define-ftype listfonts
  (struct
    [pad (array 1 unsigned-8)]
    [max_names unsigned-16]
    [pattern_len unsigned-16]))
(define-ftype listfonts-reply
  (struct
    [names_len unsigned-16]
    [pad (array 22 unsigned-8)]))
(define listfontswithinfo-opcode 50)
(define-ftype listfontswithinfo
  (struct
    [pad (array 1 unsigned-8)]
    [max_names unsigned-16]
    [pattern_len unsigned-16]))
(define-ftype listfontswithinfo-reply
  (struct
    [min_bounds charinfo]
    [pad (array 4 unsigned-8)]
    [max_bounds charinfo]
    [pad (array 4 unsigned-8)]
    [min_char_or_byte2 unsigned-16]
    [max_char_or_byte2 unsigned-16]
    [default_char unsigned-16]
    [properties_len unsigned-16]
    [draw_direction-enum unsigned-8]
    [min_byte1 unsigned-8]
    [max_byte1 unsigned-8]
    [all_chars_exist boolean]
    [font_ascent integer-16]
    [font_descent integer-16]
    [replies_hint unsigned-32]))
(define setfontpath-opcode 51)
(define-ftype setfontpath
  (struct
    [pad (array 1 unsigned-8)]
    [font_qty unsigned-16]
    [pad (array 2 unsigned-8)]))
(define-ftype getfontpath-reply
  (struct
    [path_len unsigned-16]
    [pad (array 22 unsigned-8)]))
(define createpixmap-opcode 53)
(define-ftype createpixmap
  (struct
    [depth unsigned-8]
    [pid unsigned-32]
    [drawable unsigned-32]
    [width unsigned-16]
    [height unsigned-16]))
[value-err unsigned-32]
    [drawable-err unsigned-32]
    [alloc-err unsigned-32]))
(define freepixmap-opcode 54)
(define-ftype freepixmap
  (struct
    [pad (array 1 unsigned-8)]
    [pixmap unsigned-32]))
[pixmap-err unsigned-32]))

(define gc (enum '((gc-function 1)
    (gc-planemask 2)
    (gc-foreground 4)
    (gc-background 8)
    (gc-linewidth 16)
    (gc-linestyle 32)
    (gc-capstyle 64)
    (gc-joinstyle 128)
    (gc-fillstyle 256)
    (gc-fillrule 512)
    (gc-tile 1024)
    (gc-stipple 2048)
    (gc-tilestippleoriginx 4096)
    (gc-tilestippleoriginy 8192)
    (gc-font 16384)
    (gc-subwindowmode 32768)
    (gc-graphicsexposures 65536)
    (gc-cliporiginx 131072)
    (gc-cliporiginy 262144)
    (gc-clipmask 524288)
    (gc-dashoffset 1048576)
    (gc-dashlist 2097152)
    (gc-arcmode 4194304))))

(define gx (enum '((gx-clear 0)
    (gx-and 1)
    (gx-andreverse 2)
    (gx-copy 3)
    (gx-andinverted 4)
    (gx-noop 5)
    (gx-xor 6)
    (gx-or 7)
    (gx-nor 8)
    (gx-equiv 9)
    (gx-invert 10)
    (gx-orreverse 11)
    (gx-copyinverted 12)
    (gx-orinverted 13)
    (gx-nand 14)
    (gx-set 15))))

(define linestyle (enum '((linestyle-solid 0)
    (linestyle-onoffdash 1)
    (linestyle-doubledash 2))))

(define capstyle (enum '((capstyle-notlast 0)
    (capstyle-butt 1)
    (capstyle-round 2)
    (capstyle-projecting 3))))

(define joinstyle (enum '((joinstyle-miter 0)
    (joinstyle-round 1)
    (joinstyle-bevel 2))))

(define fillstyle (enum '((fillstyle-solid 0)
    (fillstyle-tiled 1)
    (fillstyle-stippled 2)
    (fillstyle-opaquestippled 3))))

(define fillrule (enum '((fillrule-evenodd 0)
    (fillrule-winding 1))))

(define subwindowmode (enum '((subwindowmode-clipbychildren 0)
    (subwindowmode-includeinferiors 1))))

(define arcmode (enum '((arcmode-chord 0)
    (arcmode-pieslice 1))))
(define creategc-opcode 55)
(define-ftype creategc
  (struct
    [pad (array 1 unsigned-8)]
    [cid unsigned-32]
    [drawable unsigned-32]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [Function unsigned-32]
    [function-enum unsigned-32]
    [PlaneMask unsigned-32]
    [plane_mask unsigned-32]
    [Foreground unsigned-32]
    [foreground unsigned-32]
    [Background unsigned-32]
    [background unsigned-32]
    [LineWidth unsigned-32]
    [line_width unsigned-32]
    [LineStyle unsigned-32]
    [line_style-enum unsigned-32]
    [CapStyle unsigned-32]
    [cap_style-enum unsigned-32]
    [JoinStyle unsigned-32]
    [join_style-enum unsigned-32]
    [FillStyle unsigned-32]
    [fill_style-enum unsigned-32]
    [FillRule unsigned-32]
    [fill_rule-enum unsigned-32]
    [Tile unsigned-32]
    [tile unsigned-32]
    [Stipple unsigned-32]
    [stipple unsigned-32]
    [TileStippleOriginX unsigned-32]
    [tile_stipple_x_origin int32]
    [TileStippleOriginY unsigned-32]
    [tile_stipple_y_origin int32]
    [Font unsigned-32]
    [font unsigned-32]
    [SubwindowMode unsigned-32]
    [subwindow_mode-enum unsigned-32]
    [GraphicsExposures unsigned-32]
    [graphics_exposures unsigned-32]
    [ClipOriginX unsigned-32]
    [clip_x_origin int32]
    [ClipOriginY unsigned-32]
    [clip_y_origin int32]
    [ClipMask unsigned-32]
    [clip_mask unsigned-32]
    [DashOffset unsigned-32]
    [dash_offset unsigned-32]
    [DashList unsigned-32]
    [dashes unsigned-32]
    [ArcMode unsigned-32]
    [arc_mode-enum unsigned-32]))
[drawable-err unsigned-32]
    [match-err unsigned-32]
    [font-err unsigned-32]
    [pixmap-err unsigned-32]
    [value-err unsigned-32]
    [alloc-err unsigned-32]))
(define changegc-opcode 56)
(define-ftype changegc
  (struct
    [pad (array 1 unsigned-8)]
    [gc unsigned-32]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [Function unsigned-32]
    [function-enum unsigned-32]
    [PlaneMask unsigned-32]
    [plane_mask unsigned-32]
    [Foreground unsigned-32]
    [foreground unsigned-32]
    [Background unsigned-32]
    [background unsigned-32]
    [LineWidth unsigned-32]
    [line_width unsigned-32]
    [LineStyle unsigned-32]
    [line_style-enum unsigned-32]
    [CapStyle unsigned-32]
    [cap_style-enum unsigned-32]
    [JoinStyle unsigned-32]
    [join_style-enum unsigned-32]
    [FillStyle unsigned-32]
    [fill_style-enum unsigned-32]
    [FillRule unsigned-32]
    [fill_rule-enum unsigned-32]
    [Tile unsigned-32]
    [tile unsigned-32]
    [Stipple unsigned-32]
    [stipple unsigned-32]
    [TileStippleOriginX unsigned-32]
    [tile_stipple_x_origin int32]
    [TileStippleOriginY unsigned-32]
    [tile_stipple_y_origin int32]
    [Font unsigned-32]
    [font unsigned-32]
    [SubwindowMode unsigned-32]
    [subwindow_mode-enum unsigned-32]
    [GraphicsExposures unsigned-32]
    [graphics_exposures unsigned-32]
    [ClipOriginX unsigned-32]
    [clip_x_origin int32]
    [ClipOriginY unsigned-32]
    [clip_y_origin int32]
    [ClipMask unsigned-32]
    [clip_mask unsigned-32]
    [DashOffset unsigned-32]
    [dash_offset unsigned-32]
    [DashList unsigned-32]
    [dashes unsigned-32]
    [ArcMode unsigned-32]
    [arc_mode-enum unsigned-32]))
[font-err unsigned-32]
    [gcontext-err unsigned-32]
    [match-err unsigned-32]
    [pixmap-err unsigned-32]
    [value-err unsigned-32]
    [alloc-err unsigned-32]))
(define copygc-opcode 57)
(define-ftype copygc
  (struct
    [pad (array 1 unsigned-8)]
    [src_gc unsigned-32]
    [dst_gc unsigned-32]
    [value_mask-mask unsigned-32]))
(define setdashes-opcode 58)
(define-ftype setdashes
  (struct
    [pad (array 1 unsigned-8)]
    [gc unsigned-32]
    [dash_offset unsigned-16]
    [dashes_len unsigned-16]))

(define clipordering (enum '((clipordering-unsorted 0)
    (clipordering-ysorted 1)
    (clipordering-yxsorted 2)
    (clipordering-yxbanded 3))))
(define setcliprectangles-opcode 59)
(define-ftype setcliprectangles
  (struct
    [ordering-enum unsigned-8]
    [gc unsigned-32]
    [clip_x_origin integer-16]
    [clip_y_origin integer-16]))
(define freegc-opcode 60)
(define-ftype freegc
  (struct
    [pad (array 1 unsigned-8)]
    [gc unsigned-32]))
[gcontext-err unsigned-32]))
(define cleararea-opcode 61)
(define-ftype cleararea
  (struct
    [exposures boolean]
    [window unsigned-32]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]))
(define copyarea-opcode 62)
(define-ftype copyarea
  (struct
    [pad (array 1 unsigned-8)]
    [src_drawable unsigned-32]
    [dst_drawable unsigned-32]
    [gc unsigned-32]
    [src_x integer-16]
    [src_y integer-16]
    [dst_x integer-16]
    [dst_y integer-16]
    [width unsigned-16]
    [height unsigned-16]))
[drawable-err unsigned-32]
    [gcontext-err unsigned-32]
    [match-err unsigned-32]))
(define copyplane-opcode 63)
(define-ftype copyplane
  (struct
    [pad (array 1 unsigned-8)]
    [src_drawable unsigned-32]
    [dst_drawable unsigned-32]
    [gc unsigned-32]
    [src_x integer-16]
    [src_y integer-16]
    [dst_x integer-16]
    [dst_y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [bit_plane unsigned-32]))

(define coordmode (enum '((coordmode-origin 0)
    (coordmode-previous 1))))
(define polypoint-opcode 64)
(define-ftype polypoint
  (struct
    [coordinate_mode-enum unsigned-8]
    [drawable unsigned-32]
    [gc unsigned-32]))
(define polyline-opcode 65)
(define-ftype polyline
  (struct
    [coordinate_mode-enum unsigned-8]
    [drawable unsigned-32]
    [gc unsigned-32]))
[drawable-err unsigned-32]
    [gcontext-err unsigned-32]
    [match-err unsigned-32]
    [value-err unsigned-32]))
(define-ftype segment
  (struct
    [x1 integer-16]
    [y1 integer-16]
    [x2 integer-16]
    [y2 integer-16]))
(define polysegment-opcode 66)
(define-ftype polysegment
  (struct
    [pad (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]))
[drawable-err unsigned-32]
    [gcontext-err unsigned-32]
    [match-err unsigned-32]))
(define polyrectangle-opcode 67)
(define-ftype polyrectangle
  (struct
    [pad (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]))
(define polyarc-opcode 68)
(define-ftype polyarc
  (struct
    [pad (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]))

(define polyshape (enum '((polyshape-complex 0)
    (polyshape-nonconvex 1)
    (polyshape-convex 2))))
(define fillpoly-opcode 69)
(define-ftype fillpoly
  (struct
    [pad (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]
    [shape-enum unsigned-8]
    [coordinate_mode-enum unsigned-8]
    [pad (array 2 unsigned-8)]))
(define polyfillrectangle-opcode 70)
(define-ftype polyfillrectangle
  (struct
    [pad (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]))
[drawable-err unsigned-32]
    [gcontext-err unsigned-32]
    [match-err unsigned-32]))
(define polyfillarc-opcode 71)
(define-ftype polyfillarc
  (struct
    [pad (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]))

(define imageformat (enum '((imageformat-xybitmap 0)
    (imageformat-xypixmap 1)
    (imageformat-zpixmap 2))))
(define putimage-opcode 72)
(define-ftype putimage
  (struct
    [format-enum unsigned-8]
    [drawable unsigned-32]
    [gc unsigned-32]
    [width unsigned-16]
    [height unsigned-16]
    [dst_x integer-16]
    [dst_y integer-16]
    [left_pad unsigned-8]
    [depth unsigned-8]
    [pad (array 2 unsigned-8)]))
(define getimage-opcode 73)
(define-ftype getimage
  (struct
    [format-enum unsigned-8]
    [drawable unsigned-32]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [plane_mask unsigned-32]))
(define-ftype getimage-reply
  (struct
    [visual unsigned-32]
    [pad (array 20 unsigned-8)]))
(define polytext8-opcode 74)
(define-ftype polytext8
  (struct
    [pad (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]
    [x integer-16]
    [y integer-16]))
(define polytext16-opcode 75)
(define-ftype polytext16
  (struct
    [pad (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]
    [x integer-16]
    [y integer-16]))
(define imagetext8-opcode 76)
(define-ftype imagetext8
  (struct
    [string_len unsigned-8]
    [drawable unsigned-32]
    [gc unsigned-32]
    [x integer-16]
    [y integer-16]))
[drawable-err unsigned-32]
    [gcontext-err unsigned-32]
    [match-err unsigned-32]))
(define imagetext16-opcode 77)
(define-ftype imagetext16
  (struct
    [string_len unsigned-8]
    [drawable unsigned-32]
    [gc unsigned-32]
    [x integer-16]
    [y integer-16]))
[drawable-err unsigned-32]
    [gcontext-err unsigned-32]
    [match-err unsigned-32]))

(define colormapalloc (enum '((colormapalloc-none 0)
    (colormapalloc-all 1))))
(define createcolormap-opcode 78)
(define-ftype createcolormap
  (struct
    [alloc-enum unsigned-8]
    [mid unsigned-32]
    [window unsigned-32]
    [visual unsigned-32]))
(define freecolormap-opcode 79)
(define-ftype freecolormap
  (struct
    [pad (array 1 unsigned-8)]
    [cmap unsigned-32]))
(define copycolormapandfree-opcode 80)
(define-ftype copycolormapandfree
  (struct
    [pad (array 1 unsigned-8)]
    [mid unsigned-32]
    [src_cmap unsigned-32]))
(define installcolormap-opcode 81)
(define-ftype installcolormap
  (struct
    [pad (array 1 unsigned-8)]
    [cmap unsigned-32]))
(define uninstallcolormap-opcode 82)
(define-ftype uninstallcolormap
  (struct
    [pad (array 1 unsigned-8)]
    [cmap unsigned-32]))
(define listinstalledcolormaps-opcode 83)
(define-ftype listinstalledcolormaps
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]))
(define-ftype listinstalledcolormaps-reply
  (struct
    [cmaps_len unsigned-16]
    [pad (array 22 unsigned-8)]))
(define alloccolor-opcode 84)
(define-ftype alloccolor
  (struct
    [pad (array 1 unsigned-8)]
    [cmap unsigned-32]
    [red unsigned-16]
    [green unsigned-16]
    [blue unsigned-16]
    [pad (array 2 unsigned-8)]))
(define-ftype alloccolor-reply
  (struct
    [red unsigned-16]
    [green unsigned-16]
    [blue unsigned-16]
    [pad (array 2 unsigned-8)]
    [pixel unsigned-32]))
[colormap-err unsigned-32]))
(define allocnamedcolor-opcode 85)
(define-ftype allocnamedcolor
  (struct
    [pad (array 1 unsigned-8)]
    [cmap unsigned-32]
    [name_len unsigned-16]
    [pad (array 2 unsigned-8)]))
(define-ftype allocnamedcolor-reply
  (struct
    [pixel unsigned-32]
    [exact_red unsigned-16]
    [exact_green unsigned-16]
    [exact_blue unsigned-16]
    [visual_red unsigned-16]
    [visual_green unsigned-16]
    [visual_blue unsigned-16]))
(define alloccolorcells-opcode 86)
(define-ftype alloccolorcells
  (struct
    [contiguous boolean]
    [cmap unsigned-32]
    [colors unsigned-16]
    [planes unsigned-16]))
(define-ftype alloccolorcells-reply
  (struct
    [pixels_len unsigned-16]
    [masks_len unsigned-16]
    [pad (array 20 unsigned-8)]))
(define alloccolorplanes-opcode 87)
(define-ftype alloccolorplanes
  (struct
    [contiguous boolean]
    [cmap unsigned-32]
    [colors unsigned-16]
    [reds unsigned-16]
    [greens unsigned-16]
    [blues unsigned-16]))
(define-ftype alloccolorplanes-reply
  (struct
    [pixels_len unsigned-16]
    [pad (array 2 unsigned-8)]
    [red_mask unsigned-32]
    [green_mask unsigned-32]
    [blue_mask unsigned-32]
    [pad (array 8 unsigned-8)]))
(define freecolors-opcode 88)
(define-ftype freecolors
  (struct
    [pad (array 1 unsigned-8)]
    [cmap unsigned-32]
    [plane_mask unsigned-32]))

(define colorflag (enum '((colorflag-red 1)
    (colorflag-green 2)
    (colorflag-blue 4))))
(define-ftype coloritem
  (struct
    [pixel unsigned-32]
    [red unsigned-16]
    [green unsigned-16]
    [blue unsigned-16]
    [flags-mask unsigned-8]
    [pad (array 1 unsigned-8)]))
(define storecolors-opcode 89)
(define-ftype storecolors
  (struct
    [pad (array 1 unsigned-8)]
    [cmap unsigned-32]))
(define storenamedcolor-opcode 90)
(define-ftype storenamedcolor
  (struct
    [flags-mask unsigned-8]
    [cmap unsigned-32]
    [pixel unsigned-32]
    [name_len unsigned-16]
    [pad (array 2 unsigned-8)]))
(define-ftype rgb
  (struct
    [red unsigned-16]
    [green unsigned-16]
    [blue unsigned-16]
    [pad (array 2 unsigned-8)]))
(define querycolors-opcode 91)
(define-ftype querycolors
  (struct
    [pad (array 1 unsigned-8)]
    [cmap unsigned-32]))
(define-ftype querycolors-reply
  (struct
    [colors_len unsigned-16]
    [pad (array 22 unsigned-8)]))
(define lookupcolor-opcode 92)
(define-ftype lookupcolor
  (struct
    [pad (array 1 unsigned-8)]
    [cmap unsigned-32]
    [name_len unsigned-16]
    [pad (array 2 unsigned-8)]))
(define-ftype lookupcolor-reply
  (struct
    [exact_red unsigned-16]
    [exact_green unsigned-16]
    [exact_blue unsigned-16]
    [visual_red unsigned-16]
    [visual_green unsigned-16]
    [visual_blue unsigned-16]))

(define pixmap (enum '((pixmap-none 0))))
(define createcursor-opcode 93)
(define-ftype createcursor
  (struct
    [pad (array 1 unsigned-8)]
    [cid unsigned-32]
    [source unsigned-32]
    [mask unsigned-32]
    [fore_red unsigned-16]
    [fore_green unsigned-16]
    [fore_blue unsigned-16]
    [back_red unsigned-16]
    [back_green unsigned-16]
    [back_blue unsigned-16]
    [x unsigned-16]
    [y unsigned-16]))

(define font (enum '((font-none 0))))
(define createglyphcursor-opcode 94)
(define-ftype createglyphcursor
  (struct
    [pad (array 1 unsigned-8)]
    [cid unsigned-32]
    [source_font unsigned-32]
    [mask_font unsigned-32]
    [source_char unsigned-16]
    [mask_char unsigned-16]
    [fore_red unsigned-16]
    [fore_green unsigned-16]
    [fore_blue unsigned-16]
    [back_red unsigned-16]
    [back_green unsigned-16]
    [back_blue unsigned-16]))
[alloc-err unsigned-32]
    [font-err unsigned-32]
    [value-err unsigned-32]))
(define freecursor-opcode 95)
(define-ftype freecursor
  (struct
    [pad (array 1 unsigned-8)]
    [cursor unsigned-32]))
[cursor-err unsigned-32]))
(define recolorcursor-opcode 96)
(define-ftype recolorcursor
  (struct
    [pad (array 1 unsigned-8)]
    [cursor unsigned-32]
    [fore_red unsigned-16]
    [fore_green unsigned-16]
    [fore_blue unsigned-16]
    [back_red unsigned-16]
    [back_green unsigned-16]
    [back_blue unsigned-16]))

(define queryshapeof (enum '((queryshapeof-largestcursor 0)
    (queryshapeof-fastesttile 1)
    (queryshapeof-fasteststipple 2))))
(define querybestsize-opcode 97)
(define-ftype querybestsize
  (struct
    [class-enum unsigned-8]
    [drawable unsigned-32]
    [width unsigned-16]
    [height unsigned-16]))
(define-ftype querybestsize-reply
  (struct
    [width unsigned-16]
    [height unsigned-16]))
(define queryextension-opcode 98)
(define-ftype queryextension
  (struct
    [pad (array 1 unsigned-8)]
    [name_len unsigned-16]
    [pad (array 2 unsigned-8)]))
(define-ftype queryextension-reply
  (struct
    [present boolean]
    [major_opcode unsigned-8]
    [first_event unsigned-8]
    [first_error unsigned-8]))
(define-ftype listextensions-reply
  (struct
    [pad (array 24 unsigned-8)]))
(define changekeyboardmapping-opcode 100)
(define-ftype changekeyboardmapping
  (struct
    [keycode_count unsigned-8]
    [first_keycode keycode]
    [keysyms_per_keycode unsigned-8]
    [pad (array 2 unsigned-8)]))
(define getkeyboardmapping-opcode 101)
(define-ftype getkeyboardmapping
  (struct
    [pad (array 1 unsigned-8)]
    [first_keycode keycode]
    [count unsigned-8]))
(define-ftype getkeyboardmapping-reply
  (struct
    [pad (array 24 unsigned-8)]))

(define kb (enum '((kb-keyclickpercent 1)
    (kb-bellpercent 2)
    (kb-bellpitch 4)
    (kb-bellduration 8)
    (kb-led 16)
    (kb-ledmode 32)
    (kb-key 64)
    (kb-autorepeatmode 128))))

(define ledmode (enum '((ledmode-off 0)
    (ledmode-on 1))))

(define autorepeatmode (enum '((autorepeatmode-off 0)
    (autorepeatmode-on 1)
    (autorepeatmode-default 2))))
(define changekeyboardcontrol-opcode 102)
(define-ftype changekeyboardcontrol
  (struct
    [pad (array 1 unsigned-8)]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [KeyClickPercent unsigned-32]
    [key_click_percent int32]
    [BellPercent unsigned-32]
    [bell_percent int32]
    [BellPitch unsigned-32]
    [bell_pitch int32]
    [BellDuration unsigned-32]
    [bell_duration int32]
    [Led unsigned-32]
    [led unsigned-32]
    [LedMode unsigned-32]
    [led_mode-enum unsigned-32]
    [Key unsigned-32]
    [key unsigned-32]
    [AutoRepeatMode unsigned-32]
    [auto_repeat_mode-enum unsigned-32]))
(define-ftype getkeyboardcontrol-reply
  (struct
    [led_mask unsigned-32]
    [key_click_percent unsigned-8]
    [bell_percent unsigned-8]
    [bell_pitch unsigned-16]
    [bell_duration unsigned-16]
    [pad (array 2 unsigned-8)]))
(define bell-opcode 104)
(define-ftype bell
  (struct
    [percent int8]))
(define changepointercontrol-opcode 105)
(define-ftype changepointercontrol
  (struct
    [pad (array 1 unsigned-8)]
    [acceleration_numerator integer-16]
    [acceleration_denominator integer-16]
    [threshold integer-16]
    [do_acceleration boolean]
    [do_threshold boolean]))
(define-ftype getpointercontrol-reply
  (struct
    [acceleration_numerator unsigned-16]
    [acceleration_denominator unsigned-16]
    [threshold unsigned-16]
    [pad (array 18 unsigned-8)]))

(define blanking (enum '((blanking-notpreferred 0)
    (blanking-preferred 1)
    (blanking-default 2))))

(define exposures (enum '((exposures-notallowed 0)
    (exposures-allowed 1)
    (exposures-default 2))))
(define setscreensaver-opcode 107)
(define-ftype setscreensaver
  (struct
    [pad (array 1 unsigned-8)]
    [timeout integer-16]
    [interval integer-16]
    [prefer_blanking-enum unsigned-8]
    [allow_exposures-enum unsigned-8]))
(define-ftype getscreensaver-reply
  (struct
    [timeout unsigned-16]
    [interval unsigned-16]
    [prefer_blanking-enum unsigned-8]
    [allow_exposures-enum unsigned-8]
    [pad (array 18 unsigned-8)]))

(define hostmode (enum '((hostmode-insert 0)
    (hostmode-delete 1))))

(define family (enum '((family-internet 0)
    (family-decnet 1)
    (family-chaos 2)
    (family-serverinterpreted 5)
    (family-internet6 6))))
(define changehosts-opcode 109)
(define-ftype changehosts
  (struct
    [mode-enum unsigned-8]
    [family-enum unsigned-8]
    [pad (array 1 unsigned-8)]
    [address_len unsigned-16]))
(define-ftype host
  (struct
    [family-enum unsigned-8]
    [pad (array 1 unsigned-8)]
    [address_len unsigned-16]))
[pad (array 4 unsigned-8)]))
(define-ftype listhosts-reply
  (struct
    [hosts_len unsigned-16]
    [pad (array 22 unsigned-8)]))

(define accesscontrol (enum '((accesscontrol-disable 0)
    (accesscontrol-enable 1))))
(define setaccesscontrol-opcode 111)
(define-ftype setaccesscontrol
  (struct
    [mode-enum unsigned-8]))

(define closedown (enum '((closedown-destroyall 0)
    (closedown-retainpermanent 1)
    (closedown-retaintemporary 2))))
(define setclosedownmode-opcode 112)
(define-ftype setclosedownmode
  (struct
    [mode-enum unsigned-8]))

(define kill (enum '((kill-alltemporary 0))))
(define killclient-opcode 113)
(define-ftype killclient
  (struct
    [pad (array 1 unsigned-8)]
    [resource unsigned-32]))
[value-err unsigned-32]))
(define rotateproperties-opcode 114)
(define-ftype rotateproperties
  (struct
    [pad (array 1 unsigned-8)]
    [window unsigned-32]
    [atoms_len unsigned-16]
    [delta integer-16]))

(define screensaver (enum '((screensaver-reset 0)
    (screensaver-active 1))))
(define forcescreensaver-opcode 115)
(define-ftype forcescreensaver
  (struct
    [mode-enum unsigned-8]))

(define mappingstatus (enum '((mappingstatus-success 0)
    (mappingstatus-busy 1)
    (mappingstatus-failure 2))))
(define setpointermapping-opcode 116)
(define-ftype setpointermapping
  (struct
    [map_len unsigned-8]))
(define-ftype setpointermapping-reply
  (struct
    (define-ftype getpointermapping-reply
  (struct
    [pad (array 24 unsigned-8)]))

(define mapindex (enum '((mapindex-shift 0)
    (mapindex-lock 1)
    (mapindex-control 2)
    (mapindex-1 3)
    (mapindex-2 4)
    (mapindex-3 5)
    (mapindex-4 6)
    (mapindex-5 7))))
(define setmodifiermapping-opcode 118)
(define-ftype setmodifiermapping
  (struct
    [keycodes_per_modifier unsigned-8]))
(define-ftype setmodifiermapping-reply
  (struct
    (define-ftype getmodifiermapping-reply
  (struct
    [pad (array 24 unsigned-8)]))
