(import (enums))
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
(define visualclass (enum
  '((visualclass-staticgray 0)
  (visualclass-grayscale 0)
  (visualclass-staticcolor 1)
  (visualclass-pseudocolor 2)
  (visualclass-truecolor 3)
  (visualclass-directcolor 4))))
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
(define eventmask (enum
  '((eventmask-noevent 0)
  (eventmask-keypress 0)
  (eventmask-keyrelease 1)
  (eventmask-buttonpress 2)
  (eventmask-buttonrelease 4)
  (eventmask-enterwindow 8)
  (eventmask-leavewindow 16)
  (eventmask-pointermotion 32)
  (eventmask-pointermotionhint 64)
  (eventmask-button1motion 128)
  (eventmask-button2motion 256)
  (eventmask-button3motion 512)
  (eventmask-button4motion 1024)
  (eventmask-button5motion 2048)
  (eventmask-buttonmotion 4096)
  (eventmask-keymapstate 8192)
  (eventmask-exposure 16384)
  (eventmask-visibilitychange 32768)
  (eventmask-structurenotify 65536)
  (eventmask-resizeredirect 131072)
  (eventmask-substructurenotify 262144)
  (eventmask-substructureredirect 524288)
  (eventmask-focuschange 1048576)
  (eventmask-propertychange 2097152)
  (eventmask-colormapchange 4194304)
  (eventmask-ownergrabbutton 8388608))))
(define backingstore (enum
  '((backingstore-notuseful 0)
  (backingstore-whenmapped 0)
  (backingstore-always 1))))
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
    [allowed_depths_len unsigned-8]
    [allowed_depths (* unsigned-8)]))
(define-ftype setuprequest
  (struct
    [byte_order unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [protocol_major_version unsigned-16]
    [protocol_minor_version unsigned-16]
    [authorization_protocol_name_len unsigned-16]
    [authorization_protocol_data_len unsigned-16]
    [pad1 (array 2 unsigned-8)]
    [authorization_protocol_name (* unsigned-8)]
    [pad2 (array 4 unsigned-8)]
    [authorization_protocol_data (* unsigned-8)]
    [pad3 (array 4 unsigned-8)]))
(define-ftype setupfailed
  (struct
    [status unsigned-8]
    [reason_len unsigned-8]
    [protocol_major_version unsigned-16]
    [protocol_minor_version unsigned-16]
    [length unsigned-16]
    [reason (* unsigned-8)]))
(define-ftype setupauthenticate
  (struct
    [status unsigned-8]
    [pad0 (array 5 unsigned-8)]
    [length unsigned-16]
    [reason (array 4 unsigned-8)]))
(define imageorder (enum
  '((imageorder-lsbfirst 0)
  (imageorder-msbfirst 0))))
(define-ftype setup
  (struct
    [status unsigned-8]
    [pad0 (array 1 unsigned-8)]
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
    [min_keycode unsigned-8]
    [max_keycode unsigned-8]
    [pad1 (array 4 unsigned-8)]
    [vendor (* unsigned-8)]
    [pad2 (array 4 unsigned-8)]
    [pixmap_formats (* format)]
    [roots (* screen)]))
(define modmask (enum
  '((modmask-shift 1)
  (modmask-lock 1)
  (modmask-control 2)
  (modmask-1 4)
  (modmask-2 8)
  (modmask-3 16)
  (modmask-4 32)
  (modmask-5 64)
  (modmask-any 128))))
(define keybutmask (enum
  '((keybutmask-shift 1)
  (keybutmask-lock 1)
  (keybutmask-control 2)
  (keybutmask-mod1 4)
  (keybutmask-mod2 8)
  (keybutmask-mod3 16)
  (keybutmask-mod4 32)
  (keybutmask-mod5 64)
  (keybutmask-button1 128)
  (keybutmask-button2 256)
  (keybutmask-button3 512)
  (keybutmask-button4 1024)
  (keybutmask-button5 2048))))
(define window (enum
  '((window-none 0))))
(define keypress-number 2)
(define-ftype keypress
    (struct
    [detail unsigned-8]
    [time unsigned-32]
    [root unsigned-32]
    [event unsigned-32]
    [child unsigned-32]
    [root_x integer-16]
    [root_y integer-16]
    [event_x integer-16]
    [event_y integer-16]
    [state-mask unsigned-16]
    [same_screen boolean]
    [pad0 (array 1 unsigned-8)]))
(define buttonmask (enum
  '((buttonmask-1 256)
  (buttonmask-2 256)
  (buttonmask-3 512)
  (buttonmask-4 1024)
  (buttonmask-5 2048)
  (buttonmask-any 4096))))
(define buttonpress-number 4)
(define-ftype buttonpress
    (struct
    [detail unsigned-8]
    [time unsigned-32]
    [root unsigned-32]
    [event unsigned-32]
    [child unsigned-32]
    [root_x integer-16]
    [root_y integer-16]
    [event_x integer-16]
    [event_y integer-16]
    [state-mask unsigned-16]
    [same_screen boolean]
    [pad0 (array 1 unsigned-8)]))
(define motion (enum
  '((motion-normal 0)
  (motion-hint 0))))
(define motionnotify-number 6)
(define-ftype motionnotify
    (struct
    [detail-enum unsigned-8]
    [time unsigned-32]
    [root unsigned-32]
    [event unsigned-32]
    [child unsigned-32]
    [root_x integer-16]
    [root_y integer-16]
    [event_x integer-16]
    [event_y integer-16]
    [state-mask unsigned-16]
    [same_screen boolean]
    [pad0 (array 1 unsigned-8)]))
(define notifydetail (enum
  '((notifydetail-ancestor 0)
  (notifydetail-virtual 0)
  (notifydetail-inferior 1)
  (notifydetail-nonlinear 2)
  (notifydetail-nonlinearvirtual 3)
  (notifydetail-pointer 4)
  (notifydetail-pointerroot 5)
  (notifydetail-none 6))))
(define notifymode (enum
  '((notifymode-normal 0)
  (notifymode-grab 0)
  (notifymode-ungrab 1)
  (notifymode-whilegrabbed 2))))
(define enternotify-number 7)
(define-ftype enternotify
    (struct
    [detail-enum unsigned-8]
    [time unsigned-32]
    [root unsigned-32]
    [event unsigned-32]
    [child unsigned-32]
    [root_x integer-16]
    [root_y integer-16]
    [event_x integer-16]
    [event_y integer-16]
    [state-mask unsigned-16]
    [mode-enum unsigned-8]
    [same_screen_focus unsigned-8]))
(define focusin-number 9)
(define-ftype focusin
    (struct
    [detail-enum unsigned-8]
    [event unsigned-32]
    [mode-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define keymapnotify-number 11)
(define-ftype keymapnotify
    (struct
    [keys (array 31 (* unsigned-8))]))
(define expose-number 12)
(define-ftype expose
    (struct
    [pad1 (array 1 unsigned-8)]
    [window unsigned-32]
    [x unsigned-16]
    [y unsigned-16]
    [width unsigned-16]
    [height unsigned-16]
    [count unsigned-16]
    [pad2 (array 2 unsigned-8)]))
(define graphicsexposure-number 13)
(define-ftype graphicsexposure
    (struct
    [pad3 (array 1 unsigned-8)]
    [drawable unsigned-32]
    [x unsigned-16]
    [y unsigned-16]
    [width unsigned-16]
    [height unsigned-16]
    [minor_opcode unsigned-16]
    [count unsigned-16]
    [major_opcode unsigned-8]
    [pad4 (array 3 unsigned-8)]))
(define noexposure-number 14)
(define-ftype noexposure
    (struct
    [pad5 (array 1 unsigned-8)]
    [drawable unsigned-32]
    [minor_opcode unsigned-16]
    [major_opcode unsigned-8]
    [pad6 (array 1 unsigned-8)]))
(define visibility (enum
  '((visibility-unobscured 0)
  (visibility-partiallyobscured 0)
  (visibility-fullyobscured 1))))
(define visibilitynotify-number 15)
(define-ftype visibilitynotify
    (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]
    [state-enum unsigned-8]
    [pad1 (array 3 unsigned-8)]))
(define createnotify-number 16)
(define-ftype createnotify
    (struct
    [pad2 (array 1 unsigned-8)]
    [parent unsigned-32]
    [window unsigned-32]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [border_width unsigned-16]
    [override_redirect boolean]
    [pad3 (array 1 unsigned-8)]))
(define destroynotify-number 17)
(define-ftype destroynotify
    (struct
    [pad4 (array 1 unsigned-8)]
    [event unsigned-32]
    [window unsigned-32]))
(define unmapnotify-number 18)
(define-ftype unmapnotify
    (struct
    [pad5 (array 1 unsigned-8)]
    [event unsigned-32]
    [window unsigned-32]
    [from_configure boolean]
    [pad6 (array 3 unsigned-8)]))
(define mapnotify-number 19)
(define-ftype mapnotify
    (struct
    [pad7 (array 1 unsigned-8)]
    [event unsigned-32]
    [window unsigned-32]
    [override_redirect boolean]
    [pad8 (array 3 unsigned-8)]))
(define maprequest-number 20)
(define-ftype maprequest
    (struct
    [pad9 (array 1 unsigned-8)]
    [parent unsigned-32]
    [window unsigned-32]))
(define reparentnotify-number 21)
(define-ftype reparentnotify
    (struct
    [pad10 (array 1 unsigned-8)]
    [event unsigned-32]
    [window unsigned-32]
    [parent unsigned-32]
    [x integer-16]
    [y integer-16]
    [override_redirect boolean]
    [pad11 (array 3 unsigned-8)]))
(define configurenotify-number 22)
(define-ftype configurenotify
    (struct
    [pad12 (array 1 unsigned-8)]
    [event unsigned-32]
    [window unsigned-32]
    [above_sibling unsigned-32]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [border_width unsigned-16]
    [override_redirect boolean]
    [pad13 (array 1 unsigned-8)]))
(define configurerequest-number 23)
(define-ftype configurerequest
    (struct
    [stack_mode-enum unsigned-8]
    [parent unsigned-32]
    [window unsigned-32]
    [sibling unsigned-32]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [border_width unsigned-16]
    [value_mask-mask unsigned-16]))
(define gravitynotify-number 24)
(define-ftype gravitynotify
    (struct
    [pad14 (array 1 unsigned-8)]
    [event unsigned-32]
    [window unsigned-32]
    [x integer-16]
    [y integer-16]))
(define resizerequest-number 25)
(define-ftype resizerequest
    (struct
    [pad15 (array 1 unsigned-8)]
    [window unsigned-32]
    [width unsigned-16]
    [height unsigned-16]))
(define place (enum
  '((place-ontop 0)
  (place-onbottom 0))))
(define circulatenotify-number 26)
(define-ftype circulatenotify
    (struct
    [pad0 (array 1 unsigned-8)]
    [event unsigned-32]
    [window unsigned-32]
    [pad1 (array 4 unsigned-8)]
    [place-enum unsigned-8]
    [pad2 (array 3 unsigned-8)]))
(define property (enum
  '((property-newvalue 0)
  (property-delete 0))))
(define propertynotify-number 28)
(define-ftype propertynotify
    (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]
    [atom unsigned-32]
    [time unsigned-32]
    [state-enum unsigned-8]
    [pad1 (array 3 unsigned-8)]))
(define selectionclear-number 29)
(define-ftype selectionclear
    (struct
    [pad2 (array 1 unsigned-8)]
    [time unsigned-32]
    [owner unsigned-32]
    [selection unsigned-32]))
(define time (enum
  '((time-currenttime 0))))
(define atom (enum
  '((atom-none 0)
  (atom-any 0)
  (atom-primary 0)
  (atom-secondary 1)
  (atom-arc 2)
  (atom-atom 3)
  (atom-bitmap 4)
  (atom-cardinal 5)
  (atom-colormap 6)
  (atom-cursor 7)
  (atom-cut_buffer0 8)
  (atom-cut_buffer1 9)
  (atom-cut_buffer2 10)
  (atom-cut_buffer3 11)
  (atom-cut_buffer4 12)
  (atom-cut_buffer5 13)
  (atom-cut_buffer6 14)
  (atom-cut_buffer7 15)
  (atom-drawable 16)
  (atom-font 17)
  (atom-integer 18)
  (atom-pixmap 19)
  (atom-point 20)
  (atom-rectangle 21)
  (atom-resource_manager 22)
  (atom-rgb_color_map 23)
  (atom-rgb_best_map 24)
  (atom-rgb_blue_map 25)
  (atom-rgb_default_map 26)
  (atom-rgb_gray_map 27)
  (atom-rgb_green_map 28)
  (atom-rgb_red_map 29)
  (atom-string 30)
  (atom-visualid 31)
  (atom-window 32)
  (atom-wm_command 33)
  (atom-wm_hints 34)
  (atom-wm_client_machine 35)
  (atom-wm_icon_name 36)
  (atom-wm_icon_size 37)
  (atom-wm_name 38)
  (atom-wm_normal_hints 39)
  (atom-wm_size_hints 40)
  (atom-wm_zoom_hints 41)
  (atom-min_space 42)
  (atom-norm_space 43)
  (atom-max_space 44)
  (atom-end_space 45)
  (atom-superscript_x 46)
  (atom-superscript_y 47)
  (atom-subscript_x 48)
  (atom-subscript_y 49)
  (atom-underline_position 50)
  (atom-underline_thickness 51)
  (atom-strikeout_ascent 52)
  (atom-strikeout_descent 53)
  (atom-italic_angle 54)
  (atom-x_height 55)
  (atom-quad_width 56)
  (atom-weight 57)
  (atom-point_size 58)
  (atom-resolution 59)
  (atom-copyright 60)
  (atom-notice 61)
  (atom-font_name 62)
  (atom-family_name 63)
  (atom-full_name 64)
  (atom-cap_height 65)
  (atom-wm_class 66)
  (atom-wm_transient_for 67))))
(define selectionrequest-number 30)
(define-ftype selectionrequest
    (struct
    [pad0 (array 1 unsigned-8)]
    [time unsigned-32]
    [owner unsigned-32]
    [requestor unsigned-32]
    [selection unsigned-32]
    [target unsigned-32]
    [property unsigned-32]))
(define selectionnotify-number 31)
(define-ftype selectionnotify
    (struct
    [pad1 (array 1 unsigned-8)]
    [time unsigned-32]
    [requestor unsigned-32]
    [selection unsigned-32]
    [target unsigned-32]
    [property unsigned-32]))
(define colormapstate (enum
  '((colormapstate-uninstalled 0)
  (colormapstate-installed 0))))
(define colormap (enum
  '((colormap-none 0))))
(define colormapnotify-number 32)
(define-ftype colormapnotify
    (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]
    [colormap unsigned-32]
    [new boolean]
    [state-enum unsigned-8]
    [pad1 (array 2 unsigned-8)]))
(define-ftype clientmessagedata
  (union
    [data8 (array 20 (* unsigned-8))]
    [data16 (array 10 (* unsigned-16))]
    [data32 (array 5 (* unsigned-32))]))
(define clientmessage-number 33)
(define-ftype clientmessage
    (struct
    [format unsigned-8]
    [window unsigned-32]
    [type unsigned-32]
    [data clientmessagedata]))
(define mapping (enum
  '((mapping-modifier 0)
  (mapping-keyboard 0)
  (mapping-pointer 1))))
(define mappingnotify-number 34)
(define-ftype mappingnotify
    (struct
    [pad0 (array 1 unsigned-8)]
    [request-enum unsigned-8]
    [first_keycode unsigned-8]
    [count unsigned-8]
    [pad1 (array 1 unsigned-8)]))
(define gegeneric-number 35)
(define-ftype gegeneric
    (struct
    [pad2 (array 22 unsigned-8)]))
(define request-error-number 1)
(define-ftype request-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]
   [bad_value unsigned-32]
    [minor_opcode unsigned-16]
    [major_opcode unsigned-8]
    [pad3 (array 1 unsigned-8)]))
(define value-error-number 2)
(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]
   [bad_value unsigned-32]
    [minor_opcode unsigned-16]
    [major_opcode unsigned-8]
    [pad4 (array 1 unsigned-8)]))
(define windowclass (enum
  '((windowclass-copyfromparent 0)
  (windowclass-inputoutput 0)
  (windowclass-inputonly 1))))
(define cw (enum
  '((cw-backpixmap 1)
  (cw-backpixel 1)
  (cw-borderpixmap 2)
  (cw-borderpixel 4)
  (cw-bitgravity 8)
  (cw-wingravity 16)
  (cw-backingstore 32)
  (cw-backingplanes 64)
  (cw-backingpixel 128)
  (cw-overrideredirect 256)
  (cw-saveunder 512)
  (cw-eventmask 1024)
  (cw-dontpropagate 2048)
  (cw-colormap 4096)
  (cw-cursor 8192))))
(define backpixmap (enum
  '((backpixmap-none 0)
  (backpixmap-parentrelative 0))))
(define gravity (enum
  '((gravity-bitforget 0)
  (gravity-winunmap 0)
  (gravity-northwest 0)
  (gravity-north 1)
  (gravity-northeast 2)
  (gravity-west 3)
  (gravity-center 4)
  (gravity-east 5)
  (gravity-southwest 6)
  (gravity-south 7)
  (gravity-southeast 8)
  (gravity-static 9))))
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
    [background_pixel unsigned-32]
    [border_pixmap unsigned-32]
    [border_pixel unsigned-32]
    [bit_gravity-enum unsigned-32]
    [win_gravity-enum unsigned-32]
    [backing_store-enum unsigned-32]
    [backing_planes unsigned-32]
    [backing_pixel unsigned-32]
    [override_redirect unsigned-32]
    [save_under unsigned-32]
    [event_mask-mask unsigned-32]
    [do_not_propogate_mask-mask unsigned-32]
    [colormap unsigned-32]
    [cursor unsigned-32]))

(define-ftype colormap-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype cursor-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype pixmap-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype alloc-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define changewindowattributes-opcode 2)
(define-ftype changewindowattributes
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [BackPixmap unsigned-32]
    [background_pixmap unsigned-32]
    [background_pixel unsigned-32]
    [border_pixmap unsigned-32]
    [border_pixel unsigned-32]
    [bit_gravity-enum unsigned-32]
    [win_gravity-enum unsigned-32]
    [backing_store-enum unsigned-32]
    [backing_planes unsigned-32]
    [backing_pixel unsigned-32]
    [override_redirect unsigned-32]
    [save_under unsigned-32]
    [event_mask-mask unsigned-32]
    [do_not_propogate_mask-mask unsigned-32]
    [colormap unsigned-32]
    [cursor unsigned-32]))

(define-ftype access-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype colormap-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype cursor-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype pixmap-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define mapstate (enum
  '((mapstate-unmapped 0)
  (mapstate-unviewable 0)
  (mapstate-viewable 1))))
(define getwindowattributes-opcode 3)
(define-ftype getwindowattributes
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))
(define-ftype getwindowattributes-reply
  (struct
    [backing_store-enum unsigned-8]
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
    [pad0 (array 2 unsigned-8)]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype drawable-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define destroywindow-opcode 4)
(define-ftype destroywindow
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define destroysubwindows-opcode 5)
(define-ftype destroysubwindows
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))
(define setmode (enum
  '((setmode-insert 0)
  (setmode-delete 0))))
(define changesaveset-opcode 6)
(define-ftype changesaveset
  (struct
    [mode-enum unsigned-8]
    [window unsigned-32]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define reparentwindow-opcode 7)
(define-ftype reparentwindow
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]
    [parent unsigned-32]
    [x integer-16]
    [y integer-16]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define mapwindow-opcode 8)
(define-ftype mapwindow
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define mapsubwindows-opcode 9)
(define-ftype mapsubwindows
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))
(define unmapwindow-opcode 10)
(define-ftype unmapwindow
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define unmapsubwindows-opcode 11)
(define-ftype unmapsubwindows
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))
(define configwindow (enum
  '((configwindow-x 1)
  (configwindow-y 1)
  (configwindow-width 2)
  (configwindow-height 4)
  (configwindow-borderwidth 8)
  (configwindow-sibling 16)
  (configwindow-stackmode 32))))
(define stackmode (enum
  '((stackmode-above 0)
  (stackmode-below 0)
  (stackmode-topif 1)
  (stackmode-bottomif 2)
  (stackmode-opposite 3))))
(define configurewindow-opcode 12)
(define-ftype configurewindow
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]
    [value_mask-mask unsigned-16]
    [pad1 (array 2 unsigned-8)]))
(define-ftype value_list
  (struct
    [X unsigned-32]
    [x integer-32]
    [y integer-32]
    [width unsigned-32]
    [height unsigned-32]
    [border_width unsigned-32]
    [sibling unsigned-32]
    [stack_mode-enum unsigned-32]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define circulate (enum
  '((circulate-raiselowest 0)
  (circulate-lowerhighest 0))))
(define circulatewindow-opcode 13)
(define-ftype circulatewindow
  (struct
    [direction-enum unsigned-8]
    [window unsigned-32]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define getgeometry-opcode 14)
(define-ftype getgeometry
  (struct
    [pad0 (array 1 unsigned-8)]
    [drawable unsigned-32]))
(define-ftype getgeometry-reply
  (struct
    [depth unsigned-8]
    [root unsigned-32]
    [x integer-16]
    [y integer-16]
    [width unsigned-16]
    [height unsigned-16]
    [border_width unsigned-16]
    [pad0 (array 2 unsigned-8)]))

(define-ftype drawable-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define querytree-opcode 15)
(define-ftype querytree
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))
(define-ftype querytree-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [root unsigned-32]
    [parent unsigned-32]
    [children_len unsigned-16]
    [pad1 (array 14 unsigned-8)]
    [children (* unsigned-32)]))
(define internatom-opcode 16)
(define-ftype internatom
  (struct
    [only_if_exists boolean]
    [name_len unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [name (* unsigned-8)]))
(define-ftype internatom-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [atom unsigned-32]))

(define-ftype alloc-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define getatomname-opcode 17)
(define-ftype getatomname
  (struct
    [pad0 (array 1 unsigned-8)]
    [atom unsigned-32]))
(define-ftype getatomname-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [name_len unsigned-16]
    [pad1 (array 22 unsigned-8)]
    [name (* unsigned-8)]))
(define propmode (enum
  '((propmode-replace 0)
  (propmode-prepend 0)
  (propmode-append 1))))
(define changeproperty-opcode 18)
(define-ftype changeproperty
  (struct
    [mode-enum unsigned-8]
    [window unsigned-32]
    [property unsigned-32]
    [type unsigned-32]
    [format unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [data_len unsigned-32]
    [data void*]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype atom-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype alloc-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define deleteproperty-opcode 19)
(define-ftype deleteproperty
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]
    [property unsigned-32]))
(define getpropertytype (enum
  '((getpropertytype-any 0))))
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
    [format unsigned-8]
    [type unsigned-32]
    [bytes_after unsigned-32]
    [value_len unsigned-32]
    [pad0 (array 12 unsigned-8)]
    [value void*]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype atom-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define listproperties-opcode 21)
(define-ftype listproperties
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))
(define-ftype listproperties-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [atoms_len unsigned-16]
    [pad1 (array 22 unsigned-8)]
    [atoms (* unsigned-32)]))
(define setselectionowner-opcode 22)
(define-ftype setselectionowner
  (struct
    [pad0 (array 1 unsigned-8)]
    [owner unsigned-32]
    [selection unsigned-32]
    [time unsigned-32]))

(define-ftype atom-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define getselectionowner-opcode 23)
(define-ftype getselectionowner
  (struct
    [pad0 (array 1 unsigned-8)]
    [selection unsigned-32]))
(define-ftype getselectionowner-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [owner unsigned-32]))

(define-ftype atom-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define convertselection-opcode 24)
(define-ftype convertselection
  (struct
    [pad0 (array 1 unsigned-8)]
    [requestor unsigned-32]
    [selection unsigned-32]
    [target unsigned-32]
    [property unsigned-32]
    [time unsigned-32]))
(define sendeventdest (enum
  '((sendeventdest-pointerwindow 0)
  (sendeventdest-itemfocus 0))))
(define sendevent-opcode 25)
(define-ftype sendevent
  (struct
    [propagate boolean]
    [destination unsigned-32]
    [event_mask-mask unsigned-32]
    [event (array 32 (* unsigned-8))]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define grabmode (enum
  '((grabmode-sync 0)
  (grabmode-async 0))))
(define grabstatus (enum
  '((grabstatus-success 0)
  (grabstatus-alreadygrabbed 0)
  (grabstatus-invalidtime 1)
  (grabstatus-notviewable 2)
  (grabstatus-frozen 3))))
(define cursor (enum
  '((cursor-none 0))))
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
    [time unsigned-32]))
(define-ftype grabpointer-reply
  (struct
    [status-enum unsigned-8]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define ungrabpointer-opcode 27)
(define-ftype ungrabpointer
  (struct
    [pad0 (array 1 unsigned-8)]
    [time unsigned-32]))
(define buttonindex (enum
  '((buttonindex-any 0)
  (buttonindex-1 0)
  (buttonindex-2 1)
  (buttonindex-3 2)
  (buttonindex-4 3)
  (buttonindex-5 4))))
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
    [pad0 (array 1 unsigned-8)]
    [modifiers-mask unsigned-16]))

(define-ftype access-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype cursor-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define ungrabbutton-opcode 29)
(define-ftype ungrabbutton
  (struct
    [button-enum unsigned-8]
    [grab_window unsigned-32]
    [modifiers-mask unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define changeactivepointergrab-opcode 30)
(define-ftype changeactivepointergrab
  (struct
    [pad0 (array 1 unsigned-8)]
    [cursor unsigned-32]
    [time unsigned-32]
    [event_mask-mask unsigned-16]
    [pad1 (array 2 unsigned-8)]))
(define grabkeyboard-opcode 31)
(define-ftype grabkeyboard
  (struct
    [owner_events boolean]
    [grab_window unsigned-32]
    [time unsigned-32]
    [pointer_mode-enum unsigned-8]
    [keyboard_mode-enum unsigned-8]
    [pad0 (array 2 unsigned-8)]))
(define-ftype grabkeyboard-reply
  (struct
    [status-enum unsigned-8]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define ungrabkeyboard-opcode 32)
(define-ftype ungrabkeyboard
  (struct
    [pad0 (array 1 unsigned-8)]
    [time unsigned-32]))
(define grab (enum
  '((grab-any 0))))
(define grabkey-opcode 33)
(define-ftype grabkey
  (struct
    [owner_events boolean]
    [grab_window unsigned-32]
    [modifiers-mask unsigned-16]
    [key unsigned-8]
    [pointer_mode-enum unsigned-8]
    [keyboard_mode-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]))

(define-ftype access-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define ungrabkey-opcode 34)
(define-ftype ungrabkey
  (struct
    [key unsigned-8]
    [grab_window unsigned-32]
    [modifiers-mask unsigned-16]
    [pad0 (array 2 unsigned-8)]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define allow (enum
  '((allow-asyncpointer 0)
  (allow-syncpointer 0)
  (allow-replaypointer 1)
  (allow-asynckeyboard 2)
  (allow-synckeyboard 3)
  (allow-replaykeyboard 4)
  (allow-asyncboth 5)
  (allow-syncboth 6))))
(define allowevents-opcode 35)
(define-ftype allowevents
  (struct
    [mode-enum unsigned-8]
    [time unsigned-32]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define grabserver-opcode 36)
(define-ftype grabserver
  (struct
    [major-opcode unsigned-8]
    [pad0 unsigned-8]
    [length unsigned-16]))(define ungrabserver-opcode 37)
(define-ftype ungrabserver
  (struct
    [major-opcode unsigned-8]
    [pad0 unsigned-8]
    [length unsigned-16]))(define querypointer-opcode 38)
(define-ftype querypointer
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))
(define-ftype querypointer-reply
  (struct
    [same_screen boolean]
    [root unsigned-32]
    [child unsigned-32]
    [root_x integer-16]
    [root_y integer-16]
    [win_x integer-16]
    [win_y integer-16]
    [mask-mask unsigned-16]
    [pad0 (array 2 unsigned-8)]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define-ftype timecoord
  (struct
    [time unsigned-32]
    [x integer-16]
    [y integer-16]))
(define getmotionevents-opcode 39)
(define-ftype getmotionevents
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]
    [start unsigned-32]
    [stop unsigned-32]))
(define-ftype getmotionevents-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [events_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [events (* timecoord)]))
(define translatecoordinates-opcode 40)
(define-ftype translatecoordinates
  (struct
    [pad0 (array 1 unsigned-8)]
    [src_window unsigned-32]
    [dst_window unsigned-32]
    [src_x integer-16]
    [src_y integer-16]))
(define-ftype translatecoordinates-reply
  (struct
    [same_screen boolean]
    [child unsigned-32]
    [dst_x integer-16]
    [dst_y integer-16]))
(define warppointer-opcode 41)
(define-ftype warppointer
  (struct
    [pad0 (array 1 unsigned-8)]
    [src_window unsigned-32]
    [dst_window unsigned-32]
    [src_x integer-16]
    [src_y integer-16]
    [src_width unsigned-16]
    [src_height unsigned-16]
    [dst_x integer-16]
    [dst_y integer-16]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define inputfocus (enum
  '((inputfocus-none 0)
  (inputfocus-pointerroot 0)
  (inputfocus-parent 1)
  (inputfocus-followkeyboard 2))))
(define setinputfocus-opcode 42)
(define-ftype setinputfocus
  (struct
    [revert_to-enum unsigned-8]
    [focus unsigned-32]
    [time unsigned-32]))

(define-ftype window-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define-ftype getinputfocus-reply
  (struct
    [revert_to-enum unsigned-8]
    [focus unsigned-32]))
(define-ftype querykeymap-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [keys (array 32 (* unsigned-8))]))
(define openfont-opcode 45)
(define-ftype openfont
  (struct
    [pad0 (array 1 unsigned-8)]
    [fid unsigned-32]
    [name_len unsigned-16]
    [pad1 (array 2 unsigned-8)]
    [name (* unsigned-8)]))

(define-ftype name-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define closefont-opcode 46)
(define-ftype closefont
  (struct
    [pad0 (array 1 unsigned-8)]
    [font unsigned-32]))
(define fontdraw (enum
  '((fontdraw-lefttoright 0)
  (fontdraw-righttoleft 0))))
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
    [pad0 (array 1 unsigned-8)]
    [font unsigned-32]))
(define-ftype queryfont-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [min_bounds charinfo]
    [pad1 (array 4 unsigned-8)]
    [max_bounds charinfo]
    [pad2 (array 4 unsigned-8)]
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
    [char_infos_len unsigned-32]
    [properties (* fontprop)]
    [char_infos (* charinfo)]))
(define querytextextents-opcode 48)
(define-ftype querytextextents
  (struct
    [odd_length boolean]
    [font unsigned-32]
    [string char2b]))
(define-ftype querytextextents-reply
  (struct
    [draw_direction-enum unsigned-8]
    [font_ascent integer-16]
    [font_descent integer-16]
    [overall_ascent integer-16]
    [overall_descent integer-16]
    [overall_width integer-32]
    [overall_left integer-32]
    [overall_right integer-32]))

(define-ftype gcontext-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype font-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define-ftype str
  (struct
    [name_len unsigned-8]
    [name (* unsigned-8)]))
(define listfonts-opcode 49)
(define-ftype listfonts
  (struct
    [pad0 (array 1 unsigned-8)]
    [max_names unsigned-16]
    [pattern_len unsigned-16]
    [pattern (* unsigned-8)]))
(define-ftype listfonts-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [names_len unsigned-16]
    [pad1 (array 22 unsigned-8)]
    [names (* str)]))
(define listfontswithinfo-opcode 50)
(define-ftype listfontswithinfo
  (struct
    [pad0 (array 1 unsigned-8)]
    [max_names unsigned-16]
    [pattern_len unsigned-16]
    [pattern (* unsigned-8)]))
(define-ftype listfontswithinfo-reply
  (struct
    [name_len unsigned-8]
    [min_bounds charinfo]
    [pad0 (array 4 unsigned-8)]
    [max_bounds charinfo]
    [pad1 (array 4 unsigned-8)]
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
    [replies_hint unsigned-32]
    [properties (* fontprop)]
    [name (* unsigned-8)]))
(define setfontpath-opcode 51)
(define-ftype setfontpath
  (struct
    [pad0 (array 1 unsigned-8)]
    [font_qty unsigned-16]
    [pad1 (array 2 unsigned-8)]
    [font (* str)]))
(define-ftype getfontpath-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [path_len unsigned-16]
    [pad1 (array 22 unsigned-8)]
    [path (* str)]))
(define createpixmap-opcode 53)
(define-ftype createpixmap
  (struct
    [depth unsigned-8]
    [pid unsigned-32]
    [drawable unsigned-32]
    [width unsigned-16]
    [height unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype drawable-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype alloc-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define freepixmap-opcode 54)
(define-ftype freepixmap
  (struct
    [pad0 (array 1 unsigned-8)]
    [pixmap unsigned-32]))

(define-ftype pixmap-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define gc (enum
  '((gc-function 1)
  (gc-planemask 1)
  (gc-foreground 2)
  (gc-background 4)
  (gc-linewidth 8)
  (gc-linestyle 16)
  (gc-capstyle 32)
  (gc-joinstyle 64)
  (gc-fillstyle 128)
  (gc-fillrule 256)
  (gc-tile 512)
  (gc-stipple 1024)
  (gc-tilestippleoriginx 2048)
  (gc-tilestippleoriginy 4096)
  (gc-font 8192)
  (gc-subwindowmode 16384)
  (gc-graphicsexposures 32768)
  (gc-cliporiginx 65536)
  (gc-cliporiginy 131072)
  (gc-clipmask 262144)
  (gc-dashoffset 524288)
  (gc-dashlist 1048576)
  (gc-arcmode 2097152))))
(define gx (enum
  '((gx-clear 0)
  (gx-and 0)
  (gx-andreverse 1)
  (gx-copy 2)
  (gx-andinverted 3)
  (gx-noop 4)
  (gx-xor 5)
  (gx-or 6)
  (gx-nor 7)
  (gx-equiv 8)
  (gx-invert 9)
  (gx-orreverse 10)
  (gx-copyinverted 11)
  (gx-orinverted 12)
  (gx-nand 13)
  (gx-set 14))))
(define linestyle (enum
  '((linestyle-solid 0)
  (linestyle-onoffdash 0)
  (linestyle-doubledash 1))))
(define capstyle (enum
  '((capstyle-notlast 0)
  (capstyle-butt 0)
  (capstyle-round 1)
  (capstyle-projecting 2))))
(define joinstyle (enum
  '((joinstyle-miter 0)
  (joinstyle-round 0)
  (joinstyle-bevel 1))))
(define fillstyle (enum
  '((fillstyle-solid 0)
  (fillstyle-tiled 0)
  (fillstyle-stippled 1)
  (fillstyle-opaquestippled 2))))
(define fillrule (enum
  '((fillrule-evenodd 0)
  (fillrule-winding 0))))
(define subwindowmode (enum
  '((subwindowmode-clipbychildren 0)
  (subwindowmode-includeinferiors 0))))
(define arcmode (enum
  '((arcmode-chord 0)
  (arcmode-pieslice 0))))
(define creategc-opcode 55)
(define-ftype creategc
  (struct
    [pad0 (array 1 unsigned-8)]
    [cid unsigned-32]
    [drawable unsigned-32]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [Function unsigned-32]
    [function-enum unsigned-32]
    [plane_mask unsigned-32]
    [foreground unsigned-32]
    [background unsigned-32]
    [line_width unsigned-32]
    [line_style-enum unsigned-32]
    [cap_style-enum unsigned-32]
    [join_style-enum unsigned-32]
    [fill_style-enum unsigned-32]
    [fill_rule-enum unsigned-32]
    [tile unsigned-32]
    [stipple unsigned-32]
    [tile_stipple_x_origin integer-32]
    [tile_stipple_y_origin integer-32]
    [font unsigned-32]
    [subwindow_mode-enum unsigned-32]
    [graphics_exposures unsigned-32]
    [clip_x_origin integer-32]
    [clip_y_origin integer-32]
    [clip_mask unsigned-32]
    [dash_offset unsigned-32]
    [dashes unsigned-32]
    [arc_mode-enum unsigned-32]))

(define-ftype drawable-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype font-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype pixmap-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype alloc-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define changegc-opcode 56)
(define-ftype changegc
  (struct
    [pad0 (array 1 unsigned-8)]
    [gc unsigned-32]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [Function unsigned-32]
    [function-enum unsigned-32]
    [plane_mask unsigned-32]
    [foreground unsigned-32]
    [background unsigned-32]
    [line_width unsigned-32]
    [line_style-enum unsigned-32]
    [cap_style-enum unsigned-32]
    [join_style-enum unsigned-32]
    [fill_style-enum unsigned-32]
    [fill_rule-enum unsigned-32]
    [tile unsigned-32]
    [stipple unsigned-32]
    [tile_stipple_x_origin integer-32]
    [tile_stipple_y_origin integer-32]
    [font unsigned-32]
    [subwindow_mode-enum unsigned-32]
    [graphics_exposures unsigned-32]
    [clip_x_origin integer-32]
    [clip_y_origin integer-32]
    [clip_mask unsigned-32]
    [dash_offset unsigned-32]
    [dashes unsigned-32]
    [arc_mode-enum unsigned-32]))

(define-ftype font-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype gcontext-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype pixmap-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype alloc-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define copygc-opcode 57)
(define-ftype copygc
  (struct
    [pad0 (array 1 unsigned-8)]
    [src_gc unsigned-32]
    [dst_gc unsigned-32]
    [value_mask-mask unsigned-32]))
(define setdashes-opcode 58)
(define-ftype setdashes
  (struct
    [pad0 (array 1 unsigned-8)]
    [gc unsigned-32]
    [dash_offset unsigned-16]
    [dashes_len unsigned-16]
    [dashes (* unsigned-8)]))
(define clipordering (enum
  '((clipordering-unsorted 0)
  (clipordering-ysorted 0)
  (clipordering-yxsorted 1)
  (clipordering-yxbanded 2))))
(define setcliprectangles-opcode 59)
(define-ftype setcliprectangles
  (struct
    [ordering-enum unsigned-8]
    [gc unsigned-32]
    [clip_x_origin integer-16]
    [clip_y_origin integer-16]
    [rectangles rectangle]))
(define freegc-opcode 60)
(define-ftype freegc
  (struct
    [pad0 (array 1 unsigned-8)]
    [gc unsigned-32]))

(define-ftype gcontext-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
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
    [pad0 (array 1 unsigned-8)]
    [src_drawable unsigned-32]
    [dst_drawable unsigned-32]
    [gc unsigned-32]
    [src_x integer-16]
    [src_y integer-16]
    [dst_x integer-16]
    [dst_y integer-16]
    [width unsigned-16]
    [height unsigned-16]))

(define-ftype drawable-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype gcontext-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define copyplane-opcode 63)
(define-ftype copyplane
  (struct
    [pad0 (array 1 unsigned-8)]
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
(define coordmode (enum
  '((coordmode-origin 0)
  (coordmode-previous 0))))
(define polypoint-opcode 64)
(define-ftype polypoint
  (struct
    [coordinate_mode-enum unsigned-8]
    [drawable unsigned-32]
    [gc unsigned-32]
    [points point]))
(define polyline-opcode 65)
(define-ftype polyline
  (struct
    [coordinate_mode-enum unsigned-8]
    [drawable unsigned-32]
    [gc unsigned-32]
    [points point]))

(define-ftype drawable-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype gcontext-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define-ftype segment
  (struct
    [x1 integer-16]
    [y1 integer-16]
    [x2 integer-16]
    [y2 integer-16]))
(define polysegment-opcode 66)
(define-ftype polysegment
  (struct
    [pad0 (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]
    [segments segment]))

(define-ftype drawable-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype gcontext-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define polyrectangle-opcode 67)
(define-ftype polyrectangle
  (struct
    [pad0 (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]
    [rectangles rectangle]))
(define polyarc-opcode 68)
(define-ftype polyarc
  (struct
    [pad0 (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]
    [arcs arc]))
(define polyshape (enum
  '((polyshape-complex 0)
  (polyshape-nonconvex 0)
  (polyshape-convex 1))))
(define fillpoly-opcode 69)
(define-ftype fillpoly
  (struct
    [pad0 (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]
    [shape-enum unsigned-8]
    [coordinate_mode-enum unsigned-8]
    [pad1 (array 2 unsigned-8)]
    [points point]))
(define polyfillrectangle-opcode 70)
(define-ftype polyfillrectangle
  (struct
    [pad0 (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]
    [rectangles rectangle]))

(define-ftype drawable-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype gcontext-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define polyfillarc-opcode 71)
(define-ftype polyfillarc
  (struct
    [pad0 (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]
    [arcs arc]))
(define imageformat (enum
  '((imageformat-xybitmap 0)
  (imageformat-xypixmap 0)
  (imageformat-zpixmap 1))))
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
    [pad0 (array 2 unsigned-8)]
    [data unsigned-8]))
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
    [depth unsigned-8]
    [visual unsigned-32]
    [pad0 (array 20 unsigned-8)]
    [data (array 4 unsigned-8)]))
(define polytext8-opcode 74)
(define-ftype polytext8
  (struct
    [pad0 (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]
    [x integer-16]
    [y integer-16]
    [items unsigned-8]))
(define polytext16-opcode 75)
(define-ftype polytext16
  (struct
    [pad0 (array 1 unsigned-8)]
    [drawable unsigned-32]
    [gc unsigned-32]
    [x integer-16]
    [y integer-16]
    [items unsigned-8]))
(define imagetext8-opcode 76)
(define-ftype imagetext8
  (struct
    [string_len unsigned-8]
    [drawable unsigned-32]
    [gc unsigned-32]
    [x integer-16]
    [y integer-16]
    [string (* unsigned-8)]))

(define-ftype drawable-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype gcontext-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define imagetext16-opcode 77)
(define-ftype imagetext16
  (struct
    [string_len unsigned-8]
    [drawable unsigned-32]
    [gc unsigned-32]
    [x integer-16]
    [y integer-16]
    [string (* char2b)]))

(define-ftype drawable-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype gcontext-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype match-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define colormapalloc (enum
  '((colormapalloc-none 0)
  (colormapalloc-all 0))))
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
    [pad0 (array 1 unsigned-8)]
    [cmap unsigned-32]))
(define copycolormapandfree-opcode 80)
(define-ftype copycolormapandfree
  (struct
    [pad0 (array 1 unsigned-8)]
    [mid unsigned-32]
    [src_cmap unsigned-32]))
(define installcolormap-opcode 81)
(define-ftype installcolormap
  (struct
    [pad0 (array 1 unsigned-8)]
    [cmap unsigned-32]))
(define uninstallcolormap-opcode 82)
(define-ftype uninstallcolormap
  (struct
    [pad0 (array 1 unsigned-8)]
    [cmap unsigned-32]))
(define listinstalledcolormaps-opcode 83)
(define-ftype listinstalledcolormaps
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]))
(define-ftype listinstalledcolormaps-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [cmaps_len unsigned-16]
    [pad1 (array 22 unsigned-8)]
    [cmaps (* unsigned-32)]))
(define alloccolor-opcode 84)
(define-ftype alloccolor
  (struct
    [pad0 (array 1 unsigned-8)]
    [cmap unsigned-32]
    [red unsigned-16]
    [green unsigned-16]
    [blue unsigned-16]
    [pad1 (array 2 unsigned-8)]))
(define-ftype alloccolor-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [red unsigned-16]
    [green unsigned-16]
    [blue unsigned-16]
    [pad1 (array 2 unsigned-8)]
    [pixel unsigned-32]))

(define-ftype colormap-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define allocnamedcolor-opcode 85)
(define-ftype allocnamedcolor
  (struct
    [pad0 (array 1 unsigned-8)]
    [cmap unsigned-32]
    [name_len unsigned-16]
    [pad1 (array 2 unsigned-8)]
    [name (* unsigned-8)]))
(define-ftype allocnamedcolor-reply
  (struct
    [pad0 (array 1 unsigned-8)]
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
    [pad0 (array 1 unsigned-8)]
    [pixels_len unsigned-16]
    [masks_len unsigned-16]
    [pad1 (array 20 unsigned-8)]
    [pixels (* unsigned-32)]
    [masks (* unsigned-32)]))
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
    [pad0 (array 1 unsigned-8)]
    [pixels_len unsigned-16]
    [pad1 (array 2 unsigned-8)]
    [red_mask unsigned-32]
    [green_mask unsigned-32]
    [blue_mask unsigned-32]
    [pad2 (array 8 unsigned-8)]
    [pixels (* unsigned-32)]))
(define freecolors-opcode 88)
(define-ftype freecolors
  (struct
    [pad0 (array 1 unsigned-8)]
    [cmap unsigned-32]
    [plane_mask unsigned-32]
    [pixels unsigned-32]))
(define colorflag (enum
  '((colorflag-red 1)
  (colorflag-green 1)
  (colorflag-blue 2))))
(define-ftype coloritem
  (struct
    [pixel unsigned-32]
    [red unsigned-16]
    [green unsigned-16]
    [blue unsigned-16]
    [flags-mask unsigned-8]
    [pad0 (array 1 unsigned-8)]))
(define storecolors-opcode 89)
(define-ftype storecolors
  (struct
    [pad0 (array 1 unsigned-8)]
    [cmap unsigned-32]
    [items coloritem]))
(define storenamedcolor-opcode 90)
(define-ftype storenamedcolor
  (struct
    [flags-mask unsigned-8]
    [cmap unsigned-32]
    [pixel unsigned-32]
    [name_len unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [name (* unsigned-8)]))
(define-ftype rgb
  (struct
    [red unsigned-16]
    [green unsigned-16]
    [blue unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define querycolors-opcode 91)
(define-ftype querycolors
  (struct
    [pad0 (array 1 unsigned-8)]
    [cmap unsigned-32]
    [pixels unsigned-32]))
(define-ftype querycolors-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [colors_len unsigned-16]
    [pad1 (array 22 unsigned-8)]
    [colors (* rgb)]))
(define lookupcolor-opcode 92)
(define-ftype lookupcolor
  (struct
    [pad0 (array 1 unsigned-8)]
    [cmap unsigned-32]
    [name_len unsigned-16]
    [pad1 (array 2 unsigned-8)]
    [name (* unsigned-8)]))
(define-ftype lookupcolor-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [exact_red unsigned-16]
    [exact_green unsigned-16]
    [exact_blue unsigned-16]
    [visual_red unsigned-16]
    [visual_green unsigned-16]
    [visual_blue unsigned-16]))
(define pixmap (enum
  '((pixmap-none 0))))
(define createcursor-opcode 93)
(define-ftype createcursor
  (struct
    [pad0 (array 1 unsigned-8)]
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
(define font (enum
  '((font-none 0))))
(define createglyphcursor-opcode 94)
(define-ftype createglyphcursor
  (struct
    [pad0 (array 1 unsigned-8)]
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

(define-ftype alloc-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype font-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define freecursor-opcode 95)
(define-ftype freecursor
  (struct
    [pad0 (array 1 unsigned-8)]
    [cursor unsigned-32]))

(define-ftype cursor-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define recolorcursor-opcode 96)
(define-ftype recolorcursor
  (struct
    [pad0 (array 1 unsigned-8)]
    [cursor unsigned-32]
    [fore_red unsigned-16]
    [fore_green unsigned-16]
    [fore_blue unsigned-16]
    [back_red unsigned-16]
    [back_green unsigned-16]
    [back_blue unsigned-16]))
(define queryshapeof (enum
  '((queryshapeof-largestcursor 0)
  (queryshapeof-fastesttile 0)
  (queryshapeof-fasteststipple 1))))
(define querybestsize-opcode 97)
(define-ftype querybestsize
  (struct
    [class-enum unsigned-8]
    [drawable unsigned-32]
    [width unsigned-16]
    [height unsigned-16]))
(define-ftype querybestsize-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [width unsigned-16]
    [height unsigned-16]))
(define queryextension-opcode 98)
(define-ftype queryextension
  (struct
    [pad0 (array 1 unsigned-8)]
    [name_len unsigned-16]
    [pad1 (array 2 unsigned-8)]
    [name (* unsigned-8)]))
(define-ftype queryextension-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [present boolean]
    [major_opcode unsigned-8]
    [first_event unsigned-8]
    [first_error unsigned-8]))
(define-ftype listextensions-reply
  (struct
    [names_len unsigned-8]
    [pad0 (array 24 unsigned-8)]
    [names (* str)]))
(define changekeyboardmapping-opcode 100)
(define-ftype changekeyboardmapping
  (struct
    [keycode_count unsigned-8]
    [first_keycode unsigned-8]
    [keysyms_per_keycode unsigned-8]
    [pad0 (array 2 unsigned-8)]
    [keysyms (* unsigned-32)]))
(define getkeyboardmapping-opcode 101)
(define-ftype getkeyboardmapping
  (struct
    [pad0 (array 1 unsigned-8)]
    [first_keycode unsigned-8]
    [count unsigned-8]))
(define-ftype getkeyboardmapping-reply
  (struct
    [keysyms_per_keycode unsigned-8]
    [pad0 (array 24 unsigned-8)]
    [keysyms (* unsigned-32)]))
(define kb (enum
  '((kb-keyclickpercent 1)
  (kb-bellpercent 1)
  (kb-bellpitch 2)
  (kb-bellduration 4)
  (kb-led 8)
  (kb-ledmode 16)
  (kb-key 32)
  (kb-autorepeatmode 64))))
(define ledmode (enum
  '((ledmode-off 0)
  (ledmode-on 0))))
(define autorepeatmode (enum
  '((autorepeatmode-off 0)
  (autorepeatmode-on 0)
  (autorepeatmode-default 1))))
(define changekeyboardcontrol-opcode 102)
(define-ftype changekeyboardcontrol
  (struct
    [pad0 (array 1 unsigned-8)]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [KeyClickPercent unsigned-32]
    [key_click_percent integer-32]
    [bell_percent integer-32]
    [bell_pitch integer-32]
    [bell_duration integer-32]
    [led unsigned-32]
    [led_mode-enum unsigned-32]
    [key unsigned-32]
    [auto_repeat_mode-enum unsigned-32]))
(define-ftype getkeyboardcontrol-reply
  (struct
    [global_auto_repeat-enum unsigned-8]
    [led_mask unsigned-32]
    [key_click_percent unsigned-8]
    [bell_percent unsigned-8]
    [bell_pitch unsigned-16]
    [bell_duration unsigned-16]
    [pad0 (array 2 unsigned-8)]
    [auto_repeats (array 32 (* unsigned-8))]))
(define bell-opcode 104)
(define-ftype bell
  (struct
    [percent integer-8]))
(define changepointercontrol-opcode 105)
(define-ftype changepointercontrol
  (struct
    [pad0 (array 1 unsigned-8)]
    [acceleration_numerator integer-16]
    [acceleration_denominator integer-16]
    [threshold integer-16]
    [do_acceleration boolean]
    [do_threshold boolean]))
(define-ftype getpointercontrol-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [acceleration_numerator unsigned-16]
    [acceleration_denominator unsigned-16]
    [threshold unsigned-16]
    [pad1 (array 18 unsigned-8)]))
(define blanking (enum
  '((blanking-notpreferred 0)
  (blanking-preferred 0)
  (blanking-default 1))))
(define exposures (enum
  '((exposures-notallowed 0)
  (exposures-allowed 0)
  (exposures-default 1))))
(define setscreensaver-opcode 107)
(define-ftype setscreensaver
  (struct
    [pad0 (array 1 unsigned-8)]
    [timeout integer-16]
    [interval integer-16]
    [prefer_blanking-enum unsigned-8]
    [allow_exposures-enum unsigned-8]))
(define-ftype getscreensaver-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [timeout unsigned-16]
    [interval unsigned-16]
    [prefer_blanking-enum unsigned-8]
    [allow_exposures-enum unsigned-8]
    [pad1 (array 18 unsigned-8)]))
(define hostmode (enum
  '((hostmode-insert 0)
  (hostmode-delete 0))))
(define family (enum
  '((family-internet 0)
  (family-decnet 0)
  (family-chaos 1)
  (family-serverinterpreted 2)
  (family-internet6 5))))
(define changehosts-opcode 109)
(define-ftype changehosts
  (struct
    [mode-enum unsigned-8]
    [family-enum unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [address_len unsigned-16]
    [address (* unsigned-8)]))
(define-ftype host
  (struct
    [family-enum unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [address_len unsigned-16]
    [address (* unsigned-8)]
    [pad1 (array 4 unsigned-8)]))
(define-ftype listhosts-reply
  (struct
    [mode-enum unsigned-8]
    [hosts_len unsigned-16]
    [pad0 (array 22 unsigned-8)]
    [hosts (* host)]))
(define accesscontrol (enum
  '((accesscontrol-disable 0)
  (accesscontrol-enable 0))))
(define setaccesscontrol-opcode 111)
(define-ftype setaccesscontrol
  (struct
    [mode-enum unsigned-8]))
(define closedown (enum
  '((closedown-destroyall 0)
  (closedown-retainpermanent 0)
  (closedown-retaintemporary 1))))
(define setclosedownmode-opcode 112)
(define-ftype setclosedownmode
  (struct
    [mode-enum unsigned-8]))
(define kill (enum
  '((kill-alltemporary 0))))
(define killclient-opcode 113)
(define-ftype killclient
  (struct
    [pad0 (array 1 unsigned-8)]
    [resource unsigned-32]))

(define-ftype value-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]))
(define rotateproperties-opcode 114)
(define-ftype rotateproperties
  (struct
    [pad0 (array 1 unsigned-8)]
    [window unsigned-32]
    [atoms_len unsigned-16]
    [delta integer-16]
    [atoms (* unsigned-32)]))
(define screensaver (enum
  '((screensaver-reset 0)
  (screensaver-active 0))))
(define forcescreensaver-opcode 115)
(define-ftype forcescreensaver
  (struct
    [mode-enum unsigned-8]))
(define mappingstatus (enum
  '((mappingstatus-success 0)
  (mappingstatus-busy 0)
  (mappingstatus-failure 1))))
(define setpointermapping-opcode 116)
(define-ftype setpointermapping
  (struct
    [map_len unsigned-8]
    [map (* unsigned-8)]))
(define-ftype setpointermapping-reply
  (struct
    [status-enum unsigned-8]))
(define-ftype getpointermapping-reply
  (struct
    [map_len unsigned-8]
    [pad0 (array 24 unsigned-8)]
    [map (* unsigned-8)]))
(define mapindex (enum
  '((mapindex-shift 0)
  (mapindex-lock 0)
  (mapindex-control 1)
  (mapindex-1 2)
  (mapindex-2 3)
  (mapindex-3 4)
  (mapindex-4 5)
  (mapindex-5 6))))
(define setmodifiermapping-opcode 118)
(define-ftype setmodifiermapping
  (struct
    [keycodes_per_modifier unsigned-8]
    [keycodes (array 8 unsigned-8)]))
(define-ftype setmodifiermapping-reply
  (struct
    [status-enum unsigned-8]))
(define-ftype getmodifiermapping-reply
  (struct
    [keycodes_per_modifier unsigned-8]
    [pad0 (array 24 unsigned-8)]
    [keycodes (array 8 unsigned-8)]))

;; -------------- XPROTO: FUNCTION DEFINITIONS-------------------

