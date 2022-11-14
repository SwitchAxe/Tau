(import (enums))
(load "xproto.ss")(define const (enum
  '((const-maxlegalkeycode 255)
  (const-perkeybitarraysize 255)
  (const-keynamelength 32))))
(define eventtype (enum
  '((eventtype-newkeyboardnotify 1)
  (eventtype-mapnotify 1)
  (eventtype-statenotify 2)
  (eventtype-controlsnotify 4)
  (eventtype-indicatorstatenotify 8)
  (eventtype-indicatormapnotify 16)
  (eventtype-namesnotify 32)
  (eventtype-compatmapnotify 64)
  (eventtype-bellnotify 128)
  (eventtype-actionmessage 256)
  (eventtype-accessxnotify 512)
  (eventtype-extensiondevicenotify 1024))))
(define nkndetail (enum
  '((nkndetail-keycodes 1)
  (nkndetail-geometry 1)
  (nkndetail-deviceid 2))))
(define axndetail (enum
  '((axndetail-skpress 1)
  (axndetail-skaccept 1)
  (axndetail-skreject 2)
  (axndetail-skrelease 4)
  (axndetail-bkaccept 8)
  (axndetail-bkreject 16)
  (axndetail-axkwarning 32))))
(define mappart (enum
  '((mappart-keytypes 1)
  (mappart-keysyms 1)
  (mappart-modifiermap 2)
  (mappart-explicitcomponents 4)
  (mappart-keyactions 8)
  (mappart-keybehaviors 16)
  (mappart-virtualmods 32)
  (mappart-virtualmodmap 64))))
(define setmapflags (enum
  '((setmapflags-resizetypes 1)
  (setmapflags-recomputeactions 1))))
(define statepart (enum
  '((statepart-modifierstate 1)
  (statepart-modifierbase 1)
  (statepart-modifierlatch 2)
  (statepart-modifierlock 4)
  (statepart-groupstate 8)
  (statepart-groupbase 16)
  (statepart-grouplatch 32)
  (statepart-grouplock 64)
  (statepart-compatstate 128)
  (statepart-grabmods 256)
  (statepart-compatgrabmods 512)
  (statepart-lookupmods 1024)
  (statepart-compatlookupmods 2048)
  (statepart-pointerbuttons 4096))))
(define boolctrl (enum
  '((boolctrl-repeatkeys 1)
  (boolctrl-slowkeys 1)
  (boolctrl-bouncekeys 2)
  (boolctrl-stickykeys 4)
  (boolctrl-mousekeys 8)
  (boolctrl-mousekeysaccel 16)
  (boolctrl-accessxkeys 32)
  (boolctrl-accessxtimeoutmask 64)
  (boolctrl-accessxfeedbackmask 128)
  (boolctrl-audiblebellmask 256)
  (boolctrl-overlay1mask 512)
  (boolctrl-overlay2mask 1024)
  (boolctrl-ignoregrouplockmask 2048))))
(define control (enum
  '((control-groupswrap 134217728)
  (control-internalmods 134217728)
  (control-ignorelockmods 268435456)
  (control-perkeyrepeat 536870912)
  (control-controlsenabled 1073741824))))
(define axoption (enum
  '((axoption-skpressfb 1)
  (axoption-skacceptfb 1)
  (axoption-featurefb 2)
  (axoption-slowwarnfb 4)
  (axoption-indicatorfb 8)
  (axoption-stickykeysfb 16)
  (axoption-twokeys 32)
  (axoption-latchtolock 64)
  (axoption-skreleasefb 128)
  (axoption-skrejectfb 256)
  (axoption-bkrejectfb 512)
  (axoption-dumbbell 1024))))
(define ledclassresult (enum
  '((ledclassresult-kbdfeedbackclass 0)
  (ledclassresult-ledfeedbackclass 0))))
(define ledclass (enum
  '((ledclass-kbdfeedbackclass 0)
  (ledclass-ledfeedbackclass 0)
  (ledclass-dfltxiclass 4)
  (ledclass-allxiclasses 768))))
(define bellclassresult (enum
  '((bellclassresult-kbdfeedbackclass 0)
  (bellclassresult-bellfeedbackclass 0))))
(define bellclass (enum
  '((bellclass-kbdfeedbackclass 0)
  (bellclass-bellfeedbackclass 0)
  (bellclass-dfltxiclass 5))))
(define id (enum
  '((id-usecorekbd 256)
  (id-usecoreptr 256)
  (id-dfltxiclass 512)
  (id-dfltxiid 768)
  (id-allxiclass 1024)
  (id-allxiid 1280)
  (id-xinone 1536))))
(define group (enum
  '((group-1 0)
  (group-2 0)
  (group-3 1)
  (group-4 2))))
(define groups (enum
  '((groups-any 254)
  (groups-all 254))))
(define setofgroup (enum
  '((setofgroup-group1 1)
  (setofgroup-group2 1)
  (setofgroup-group3 2)
  (setofgroup-group4 4))))
(define setofgroups (enum
  '((setofgroups-any 128))))
(define groupswrap (enum
  '((groupswrap-wrapintorange 0)
  (groupswrap-clampintorange 0)
  (groupswrap-redirectintorange 64))))
(define vmodshigh (enum
  '((vmodshigh-15 128)
  (vmodshigh-14 128)
  (vmodshigh-13 64)
  (vmodshigh-12 32)
  (vmodshigh-11 16)
  (vmodshigh-10 8)
  (vmodshigh-9 4)
  (vmodshigh-8 2))))
(define vmodslow (enum
  '((vmodslow-7 128)
  (vmodslow-6 128)
  (vmodslow-5 64)
  (vmodslow-4 32)
  (vmodslow-3 16)
  (vmodslow-2 8)
  (vmodslow-1 4)
  (vmodslow-0 2))))
(define vmod (enum
  '((vmod-15 32768)
  (vmod-14 32768)
  (vmod-13 16384)
  (vmod-12 8192)
  (vmod-11 4096)
  (vmod-10 2048)
  (vmod-9 1024)
  (vmod-8 512)
  (vmod-7 256)
  (vmod-6 128)
  (vmod-5 64)
  (vmod-4 32)
  (vmod-3 16)
  (vmod-2 8)
  (vmod-1 4)
  (vmod-0 2))))
(define explicit (enum
  '((explicit-vmodmap 128)
  (explicit-behavior 128)
  (explicit-autorepeat 64)
  (explicit-interpret 32)
  (explicit-keytype4 16)
  (explicit-keytype3 8)
  (explicit-keytype2 4)
  (explicit-keytype1 2))))
(define syminterpretmatch (enum
  '((syminterpretmatch-noneof 0)
  (syminterpretmatch-anyofornone 0)
  (syminterpretmatch-anyof 1)
  (syminterpretmatch-allof 2)
  (syminterpretmatch-exactly 3))))
(define syminterpmatch (enum
  '((syminterpmatch-leveloneonly 128)
  (syminterpmatch-opmask 128))))
(define imflag (enum
  '((imflag-noexplicit 128)
  (imflag-noautomatic 128)
  (imflag-leddriveskb 64))))
(define immodswhich (enum
  '((immodswhich-usecompat 16)
  (immodswhich-useeffective 16)
  (immodswhich-uselocked 8)
  (immodswhich-uselatched 4)
  (immodswhich-usebase 2))))
(define imgroupswhich (enum
  '((imgroupswhich-usecompat 16)
  (imgroupswhich-useeffective 16)
  (imgroupswhich-uselocked 8)
  (imgroupswhich-uselatched 4)
  (imgroupswhich-usebase 2))))
(define-ftype indicatormap
  (struct
    [flags-enum unsigned-8]
    [whichgroups-enum unsigned-8]
    [groups-enum unsigned-8]
    [whichmods-enum unsigned-8]
    [mods-mask unsigned-8]
    [realmods-mask unsigned-8]
    [vmods-mask unsigned-16]
    [ctrls-mask unsigned-32]))
(define cmdetail (enum
  '((cmdetail-syminterp 1)
  (cmdetail-groupcompat 1))))
(define namedetail (enum
  '((namedetail-keycodes 1)
  (namedetail-geometry 1)
  (namedetail-symbols 2)
  (namedetail-physsymbols 4)
  (namedetail-types 8)
  (namedetail-compat 16)
  (namedetail-keytypenames 32)
  (namedetail-ktlevelnames 64)
  (namedetail-indicatornames 128)
  (namedetail-keynames 256)
  (namedetail-keyaliases 512)
  (namedetail-virtualmodnames 1024)
  (namedetail-groupnames 2048)
  (namedetail-rgnames 4096))))
(define gbndetail (enum
  '((gbndetail-types 1)
  (gbndetail-compatmap 1)
  (gbndetail-clientsymbols 2)
  (gbndetail-serversymbols 4)
  (gbndetail-indicatormaps 8)
  (gbndetail-keynames 16)
  (gbndetail-geometry 32)
  (gbndetail-othernames 64))))
(define xifeature (enum
  '((xifeature-keyboards 1)
  (xifeature-buttonactions 1)
  (xifeature-indicatornames 2)
  (xifeature-indicatormaps 4)
  (xifeature-indicatorstate 8))))
(define perclientflag (enum
  '((perclientflag-detectableautorepeat 1)
  (perclientflag-grabsusexkbstate 1)
  (perclientflag-autoresetcontrols 2)
  (perclientflag-lookupstatewhengrabbed 4)
  (perclientflag-sendeventusesxkbstate 8))))
(define-ftype moddef
  (struct
    [mask-mask unsigned-8]
    [realmods-mask unsigned-8]
    [vmods-mask unsigned-16]))
(define-ftype keyname
  (struct
    [name (array 4 (* unsigned-8))]))
(define-ftype keyalias
  (struct
    [real (array 4 (* unsigned-8))]
    [alias (array 4 (* unsigned-8))]))
(define-ftype countedstring16
  (struct
    [length unsigned-16]
    [string (* unsigned-8)]
    [alignment_pad void*]))
(define-ftype ktmapentry
  (struct
    [active boolean]
    [mods_mask-mask unsigned-8]
    [level unsigned-8]
    [mods_mods-mask unsigned-8]
    [mods_vmods-mask unsigned-16]
    [pad0 (array 2 unsigned-8)]))
(define-ftype keytype
  (struct
    [mods_mask-mask unsigned-8]
    [mods_mods-mask unsigned-8]
    [mods_vmods-mask unsigned-16]
    [numlevels unsigned-8]
    [nmapentries unsigned-8]
    [haspreserve boolean]
    [pad0 (array 1 unsigned-8)]
    [map (* ktmapentry)]
    [preserve (* moddef)]))
(define-ftype keysymmap
  (struct
    [kt_index (array 4 (* unsigned-8))]
    [groupinfo unsigned-8]
    [width unsigned-8]
    [nsyms unsigned-16]
    [syms (* unsigned-32)]))
(define-ftype commonbehavior
  (struct
    [type unsigned-8]
    [data unsigned-8]))
(define-ftype defaultbehavior
  (struct
    [type unsigned-8]
    [pad0 (array 1 unsigned-8)]))
(define-ftype radiogroupbehavior
  (struct
    [type unsigned-8]
    [group unsigned-8]))
(define-ftype overlaybehavior
  (struct
    [type unsigned-8]
    [key unsigned-8]))
(define-ftype behavior
  (union
    [common commonbehavior]
    [default defaultbehavior]
    [lock lockbehavior]
    [radiogroup radiogroupbehavior]
    [overlay1 overlaybehavior]
    [overlay2 overlaybehavior]
    [permamentlock permamentlockbehavior]
    [permamentradiogroup permamentradiogroupbehavior]
    [permamentoverlay1 permamentoverlaybehavior]
    [permamentoverlay2 permamentoverlaybehavior]
    [type unsigned-8]))
(define behaviortype (enum
  '((behaviortype-default 0)
  (behaviortype-lock 0)
  (behaviortype-radiogroup 1)
  (behaviortype-overlay1 2)
  (behaviortype-overlay2 3)
  (behaviortype-permamentlock 4)
  (behaviortype-permamentradiogroup 129)
  (behaviortype-permamentoverlay1 130)
  (behaviortype-permamentoverlay2 131))))
(define-ftype setbehavior
  (struct
    [keycode unsigned-8]
    [behavior behavior]
    [pad0 (array 1 unsigned-8)]))
(define-ftype setexplicit
  (struct
    [keycode unsigned-8]
    [explicit-mask unsigned-8]))
(define-ftype keymodmap
  (struct
    [keycode unsigned-8]
    [mods-mask unsigned-8]))
(define-ftype keyvmodmap
  (struct
    [keycode unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [vmods-mask unsigned-16]))
(define-ftype ktsetmapentry
  (struct
    [level unsigned-8]
    [realmods-mask unsigned-8]
    [virtualmods-mask unsigned-16]))
(define-ftype setkeytype
  (struct
    [mask-mask unsigned-8]
    [realmods-mask unsigned-8]
    [virtualmods-mask unsigned-16]
    [numlevels unsigned-8]
    [nmapentries unsigned-8]
    [preserve boolean]
    [pad0 (array 1 unsigned-8)]
    [entries (* ktsetmapentry)]
    [preserve_entries (* ktsetmapentry)]))
(define-ftype outline
  (struct
    [npoints unsigned-8]
    [cornerradius unsigned-8]
    [pad0 (array 2 unsigned-8)]
    [points (* point)]))
(define-ftype shape
  (struct
    [name unsigned-32]
    [noutlines unsigned-8]
    [primaryndx unsigned-8]
    [approxndx unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [outlines (* outline)]))
(define-ftype key
  (struct
    [name (array 4 (* unsigned-8))]
    [gap integer-16]
    [shapendx unsigned-8]
    [colorndx unsigned-8]))
(define-ftype overlaykey
  (struct
    [over (array 4 (* unsigned-8))]
    [under (array 4 (* unsigned-8))]))
(define-ftype overlayrow
  (struct
    [rowunder unsigned-8]
    [nkeys unsigned-8]
    [pad0 (array 2 unsigned-8)]
    [keys (* overlaykey)]))
(define-ftype overlay
  (struct
    [name unsigned-32]
    [nrows unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [rows (* overlayrow)]))
(define-ftype row
  (struct
    [top integer-16]
    [left integer-16]
    [nkeys unsigned-8]
    [vertical boolean]
    [pad0 (array 2 unsigned-8)]
    [keys (* key)]))
(define doodadtype (enum
  '((doodadtype-outline 1)
  (doodadtype-solid 1)
  (doodadtype-text 2)
  (doodadtype-indicator 3)
  (doodadtype-logo 4))))
(define-ftype listing
  (struct
    [flags unsigned-16]
    [length unsigned-16]
    [string (* unsigned-8)]
    [pad0 (array 2 unsigned-8)]))
(define-ftype deviceledinfo
  (struct
    [ledclass-enum unsigned-16]
    [ledid unsigned-16]
    [namespresent unsigned-32]
    [mapspresent unsigned-32]
    [physindicators unsigned-32]
    [state unsigned-32]
    [names unsigned-32]
    [maps indicatormap]))
(define error (enum
  '((error-baddevice 255)
  (error-badclass 255)
  (error-badid 254))))
(define keyboard-error-number 0)
(define-ftype keyboard-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]
   [value unsigned-32]
    [minoropcode unsigned-16]
    [majoropcode unsigned-8]
    [pad0 (array 21 unsigned-8)]))
(define sa (enum
  '((sa-clearlocks 1)
  (sa-latchtolock 1)
  (sa-usemodmapmods 2)
  (sa-groupabsolute 4))))
(define satype (enum
  '((satype-noaction 0)
  (satype-setmods 0)
  (satype-latchmods 1)
  (satype-lockmods 2)
  (satype-setgroup 3)
  (satype-latchgroup 4)
  (satype-lockgroup 5)
  (satype-moveptr 6)
  (satype-ptrbtn 7)
  (satype-lockptrbtn 8)
  (satype-setptrdflt 9)
  (satype-isolock 10)
  (satype-terminate 11)
  (satype-switchscreen 12)
  (satype-setcontrols 13)
  (satype-lockcontrols 14)
  (satype-actionmessage 15)
  (satype-redirectkey 16)
  (satype-devicebtn 17)
  (satype-lockdevicebtn 18)
  (satype-devicevaluator 19))))
(define-ftype sanoaction
  (struct
    [type-enum unsigned-8]
    [pad0 (array 7 unsigned-8)]))
(define-ftype sasetmods
  (struct
    [type-enum unsigned-8]
    [flags-mask unsigned-8]
    [mask-mask unsigned-8]
    [realmods-mask unsigned-8]
    [vmodshigh-mask unsigned-8]
    [vmodslow-mask unsigned-8]
    [pad0 (array 2 unsigned-8)]))
(define-ftype sasetgroup
  (struct
    [type-enum unsigned-8]
    [flags-mask unsigned-8]
    [group integer-8]
    [pad0 (array 5 unsigned-8)]))
(define samoveptrflag (enum
  '((samoveptrflag-noacceleration 1)
  (samoveptrflag-moveabsolutex 1)
  (samoveptrflag-moveabsolutey 2))))
(define-ftype samoveptr
  (struct
    [type-enum unsigned-8]
    [flags-mask unsigned-8]
    [xhigh integer-8]
    [xlow unsigned-8]
    [yhigh integer-8]
    [ylow unsigned-8]
    [pad0 (array 2 unsigned-8)]))
(define-ftype saptrbtn
  (struct
    [type-enum unsigned-8]
    [flags unsigned-8]
    [count unsigned-8]
    [button unsigned-8]
    [pad0 (array 4 unsigned-8)]))
(define-ftype salockptrbtn
  (struct
    [type-enum unsigned-8]
    [flags unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [button unsigned-8]
    [pad1 (array 4 unsigned-8)]))
(define sasetptrdfltflag (enum
  '((sasetptrdfltflag-dfltbtnabsolute 4)
  (sasetptrdfltflag-affectdfltbutton 4))))
(define-ftype sasetptrdflt
  (struct
    [type-enum unsigned-8]
    [flags-mask unsigned-8]
    [affect-mask unsigned-8]
    [value integer-8]
    [pad0 (array 4 unsigned-8)]))
(define saisolockflag (enum
  '((saisolockflag-nolock 1)
  (saisolockflag-nounlock 1)
  (saisolockflag-usemodmapmods 2)
  (saisolockflag-groupabsolute 4)
  (saisolockflag-isodfltisgroup 4))))
(define saisolocknoaffect (enum
  '((saisolocknoaffect-ctrls 8)
  (saisolocknoaffect-ptr 8)
  (saisolocknoaffect-group 16)
  (saisolocknoaffect-mods 32))))
(define-ftype saisolock
  (struct
    [type-enum unsigned-8]
    [flags-mask unsigned-8]
    [mask-mask unsigned-8]
    [realmods-mask unsigned-8]
    [group integer-8]
    [affect-mask unsigned-8]
    [vmodshigh-mask unsigned-8]
    [vmodslow-mask unsigned-8]))
(define-ftype saterminate
  (struct
    [type-enum unsigned-8]
    [pad0 (array 7 unsigned-8)]))
(define switchscreenflag (enum
  '((switchscreenflag-application 1)
  (switchscreenflag-absolute 1))))
(define-ftype saswitchscreen
  (struct
    [type-enum unsigned-8]
    [flags unsigned-8]
    [newscreen integer-8]
    [pad0 (array 5 unsigned-8)]))
(define boolctrlshigh (enum
  '((boolctrlshigh-accessxfeedback 1)
  (boolctrlshigh-audiblebell 1)
  (boolctrlshigh-overlay1 2)
  (boolctrlshigh-overlay2 4)
  (boolctrlshigh-ignoregrouplock 8))))
(define boolctrlslow (enum
  '((boolctrlslow-repeatkeys 1)
  (boolctrlslow-slowkeys 1)
  (boolctrlslow-bouncekeys 2)
  (boolctrlslow-stickykeys 4)
  (boolctrlslow-mousekeys 8)
  (boolctrlslow-mousekeysaccel 16)
  (boolctrlslow-accessxkeys 32)
  (boolctrlslow-accessxtimeout 64))))
(define-ftype sasetcontrols
  (struct
    [type-enum unsigned-8]
    [pad0 (array 3 unsigned-8)]
    [boolctrlshigh-mask unsigned-8]
    [boolctrlslow-mask unsigned-8]
    [pad1 (array 2 unsigned-8)]))
(define actionmessageflag (enum
  '((actionmessageflag-onpress 1)
  (actionmessageflag-onrelease 1)
  (actionmessageflag-genkeyevent 2))))
(define-ftype saactionmessage
  (struct
    [type-enum unsigned-8]
    [flags-mask unsigned-8]
    [message (array 6 (* unsigned-8))]))
(define-ftype saredirectkey
  (struct
    [type-enum unsigned-8]
    [newkey unsigned-8]
    [mask-mask unsigned-8]
    [realmodifiers-mask unsigned-8]
    [vmodsmaskhigh-mask unsigned-8]
    [vmodsmasklow-mask unsigned-8]
    [vmodshigh-mask unsigned-8]
    [vmodslow-mask unsigned-8]))
(define-ftype sadevicebtn
  (struct
    [type-enum unsigned-8]
    [flags unsigned-8]
    [count unsigned-8]
    [button unsigned-8]
    [device unsigned-8]
    [pad0 (array 3 unsigned-8)]))
(define lockdeviceflags (enum
  '((lockdeviceflags-nolock 1)
  (lockdeviceflags-nounlock 1))))
(define-ftype salockdevicebtn
  (struct
    [type-enum unsigned-8]
    [flags-mask unsigned-8]
    [pad0 (array 1 unsigned-8)]
    [button unsigned-8]
    [device unsigned-8]
    [pad1 (array 3 unsigned-8)]))
(define savalwhat (enum
  '((savalwhat-ignoreval 0)
  (savalwhat-setvalmin 0)
  (savalwhat-setvalcenter 1)
  (savalwhat-setvalmax 2)
  (savalwhat-setvalrelative 3)
  (savalwhat-setvalabsolute 4))))
(define-ftype sadevicevaluator
  (struct
    [type-enum unsigned-8]
    [device unsigned-8]
    [val1what-enum unsigned-8]
    [val1index unsigned-8]
    [val1value unsigned-8]
    [val2what-enum unsigned-8]
    [val2index unsigned-8]
    [val2value unsigned-8]))
(define-ftype siaction
  (struct
    [type-enum unsigned-8]
    [data (array 7 (* unsigned-8))]))
(define-ftype syminterpret
  (struct
    [sym unsigned-32]
    [mods-mask unsigned-8]
    [match unsigned-8]
    [virtualmod-mask unsigned-8]
    [flags unsigned-8]
    [action siaction]))
(define-ftype action
  (union
    [noaction sanoaction]
    [setmods sasetmods]
    [latchmods salatchmods]
    [lockmods salockmods]
    [setgroup sasetgroup]
    [latchgroup salatchgroup]
    [lockgroup salockgroup]
    [moveptr samoveptr]
    [ptrbtn saptrbtn]
    [lockptrbtn salockptrbtn]
    [setptrdflt sasetptrdflt]
    [isolock saisolock]
    [terminate saterminate]
    [switchscreen saswitchscreen]
    [setcontrols sasetcontrols]
    [lockcontrols salockcontrols]
    [message saactionmessage]
    [redirect saredirectkey]
    [devbtn sadevicebtn]
    [lockdevbtn salockdevicebtn]
    [devval sadevicevaluator]
    [type-enum unsigned-8]))
(define useextension-opcode 0)
(define-ftype useextension
  (struct
    [wantedmajor unsigned-16]
    [wantedminor unsigned-16]))
(define-ftype useextension-reply
  (struct
    [supported boolean]
    [servermajor unsigned-16]
    [serverminor unsigned-16]
    [pad0 (array 20 unsigned-8)]))
(define selectevents-opcode 1)
(define-ftype selectevents
  (struct
    [devicespec unsigned-16]
    [affectwhich-mask unsigned-16]
    [clear-mask unsigned-16]
    [selectall-mask unsigned-16]
    [affectmap-mask unsigned-16]
    [map-mask unsigned-16]))
(define-ftype details
  (struct
    