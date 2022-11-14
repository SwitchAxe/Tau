(import (enums))
(define-ftype context unsigned-32)
(define-ftype range8
  (struct
    [first unsigned-8]
    [last unsigned-8]))
(define-ftype range16
  (struct
    [first unsigned-16]
    [last unsigned-16]))
(define-ftype extrange
  (struct
    [major range8]
    [minor range16]))
(define-ftype range
  (struct
    [core_requests range8]
    [core_replies range8]
    [ext_requests extrange]
    [ext_replies extrange]
    [delivered_events range8]
    [device_events range8]
    [errors range8]
    [client_started boolean]
    [client_died boolean]))
(define htype (enum
  '((htype-fromservertime 1)
  (htype-fromclienttime 1)
  (htype-fromclientsequence 2))))
(define cs (enum
  '((cs-currentclients 1)
  (cs-futureclients 1)
  (cs-allclients 2))))
(define-ftype clientinfo
  (struct
    [client_resource unsigned-32]
    [num_ranges unsigned-32]
    [ranges (* range)]))
(define badcontext-error-number 0)
(define-ftype badcontext-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]
   [invalid_record unsigned-32]))
(define queryversion-opcode 0)
(define-ftype queryversion
  (struct
    [major_version unsigned-16]
    [minor_version unsigned-16]))
(define-ftype queryversion-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-16]
    [minor_version unsigned-16]))
(define createcontext-opcode 1)
(define-ftype createcontext
  (struct
    [context record:context]
    [element_header elementheader]
    [pad0 (array 3 unsigned-8)]
    [num_client_specs unsigned-32]
    [num_ranges unsigned-32]
    [client_specs (* unsigned-32)]
    [ranges (* range)]))
(define registerclients-opcode 2)
(define-ftype registerclients
  (struct
    [context record:context]
    [element_header elementheader]
    [pad0 (array 3 unsigned-8)]
    [num_client_specs unsigned-32]
    [num_ranges unsigned-32]
    [client_specs (* unsigned-32)]
    [ranges (* range)]))
(define unregisterclients-opcode 3)
(define-ftype unregisterclients
  (struct
    [context record:context]
    [num_client_specs unsigned-32]
    [client_specs (* unsigned-32)]))
(define getcontext-opcode 4)
(define-ftype getcontext
  (struct
    [context record:context]))
(define-ftype getcontext-reply
  (struct
    [enabled boolean]
    [element_header elementheader]
    [pad0 (array 3 unsigned-8)]
    [num_intercepted_clients unsigned-32]
    [pad1 (array 16 unsigned-8)]
    [intercepted_clients (* clientinfo)]))
(define enablecontext-opcode 5)
(define-ftype enablecontext
  (struct
    [context record:context]))
(define-ftype enablecontext-reply
  (struct
    [category unsigned-8]
    [element_header elementheader]
    [client_swapped boolean]
    [pad0 (array 2 unsigned-8)]
    [xid_base unsigned-32]
    [server_time unsigned-32]
    [rec_sequence_num unsigned-32]
    [pad1 (array 8 unsigned-8)]
    [data (array 4 unsigned-8)]))
(define disablecontext-opcode 6)
(define-ftype disablecontext
  (struct
    [context record:context]))
(define freecontext-opcode 7)
(define-ftype freecontext
  (struct
    [context record:context]))
(define-ftype clientinfo-iterator (struct
  [data (* clientinfo)]
[rem int]
  [index int]))
(define-ftype range-iterator (struct
  [data (* range)]
[rem int]
  [index int]))
(define-ftype extrange-iterator (struct
  [data (* extrange)]
[rem int]
  [index int]))
(define-ftype range16-iterator (struct
  [data (* range16)]
[rem int]
  [index int]))
(define-ftype range8-iterator (struct
  [data (* range8)]
[rem int]
  [index int]))
(define-ftype resourcesizevalue-iterator (struct
  [data (* resourcesizevalue)]
[rem int]
  [index int]))
(define-ftype resourcesizespec-iterator (struct
  [data (* resourcesizespec)]
[rem int]
  [index int]))
(define-ftype resourceidspec-iterator (struct
  [data (* resourceidspec)]
[rem int]
  [index int]))
(define-ftype clientidvalue-iterator (struct
  [data (* clientidvalue)]
[rem int]
  [index int]))
(define-ftype clientidspec-iterator (struct
  [data (* clientidspec)]
[rem int]
  [index int]))
(define-ftype type-iterator (struct
  [data (* type)]
[rem int]
  [index int]))
(define-ftype client-iterator (struct
  [data (* client)]
[rem int]
  [index int]))
(define-ftype value_list-iterator (struct
  [data (* value_list)]
[rem int]
  [index int]))
(define-ftype value_list-iterator (struct
  [data (* value_list)]
[rem int]
  [index int]))
(define-ftype value_list-iterator (struct
  [data (* value_list)]
[rem int]
  [index int]))
(define-ftype waitcondition-iterator (struct
  [data (* waitcondition)]
[rem int]
  [index int]))
(define-ftype trigger-iterator (struct
  [data (* trigger)]
[rem int]
  [index int]))
(define-ftype systemcounter-iterator (struct
  [data (* systemcounter)]
[rem int]
  [index int]))
(define-ftype int64-iterator (struct
  [data (* int64)]
[rem int]
  [index int]))
(define-ftype event-iterator (struct
  [data (* event)]
[rem int]
  [index int]))
(define-ftype drmcliprect-iterator (struct
  [data (* drmcliprect)]
[rem int]
  [index int]))
(define-ftype modeinfo-iterator (struct
  [data (* modeinfo)]
[rem int]
  [index int]))
(define-ftype screeninfo-iterator (struct
  [data (* screeninfo)]
[rem int]
  [index int]))
(define-ftype info-iterator (struct
  [data (* info)]
[rem int]
  [index int]))
(define-ftype inputinfo-iterator (struct
  [data (* inputinfo)]
[rem int]
  [index int]))
(define-ftype valuatorinfo-iterator (struct
  [data (* valuatorinfo)]
[rem int]
  [index int]))
(define-ftype axisinfo-iterator (struct
  [data (* axisinfo)]
[rem int]
  [index int]))
(define-ftype buttoninfo-iterator (struct
  [data (* buttoninfo)]
[rem int]
  [index int]))
(define-ftype keyinfo-iterator (struct
  [data (* keyinfo)]
[rem int]
  [index int]))
(define-ftype deviceinfo-iterator (struct
  [data (* deviceinfo)]
[rem int]
  [index int]))
(define-ftype fp3232-iterator (struct
  [data (* fp3232)]
[rem int]
  [index int]))
(define-ftype details-iterator (struct
  [data (* details)]
[rem int]
  [index int]))
(define-ftype action-iterator (struct
  [data (* action)]
[rem int]
  [index int]))
(define-ftype syminterpret-iterator (struct
  [data (* syminterpret)]
[rem int]
  [index int]))
(define-ftype siaction-iterator (struct
  [data (* siaction)]
[rem int]
  [index int]))
(define-ftype sadevicevaluator-iterator (struct
  [data (* sadevicevaluator)]
[rem int]
  [index int]))
(define-ftype salockdevicebtn-iterator (struct
  [data (* salockdevicebtn)]
[rem int]
  [index int]))
(define-ftype sadevicebtn-iterator (struct
  [data (* sadevicebtn)]
[rem int]
  [index int]))
(define-ftype saredirectkey-iterator (struct
  [data (* saredirectkey)]
[rem int]
  [index int]))
(define-ftype saactionmessage-iterator (struct
  [data (* saactionmessage)]
[rem int]
  [index int]))
(define-ftype sasetcontrols-iterator (struct
  [data (* sasetcontrols)]
[rem int]
  [index int]))
(define-ftype saswitchscreen-iterator (struct
  [data (* saswitchscreen)]
[rem int]
  [index int]))
(define-ftype saterminate-iterator (struct
  [data (* saterminate)]
[rem int]
  [index int]))
(define-ftype saisolock-iterator (struct
  [data (* saisolock)]
[rem int]
  [index int]))
(define-ftype sasetptrdflt-iterator (struct
  [data (* sasetptrdflt)]
[rem int]
  [index int]))
(define-ftype salockptrbtn-iterator (struct
  [data (* salockptrbtn)]
[rem int]
  [index int]))
(define-ftype saptrbtn-iterator (struct
  [data (* saptrbtn)]
[rem int]
  [index int]))
(define-ftype samoveptr-iterator (struct
  [data (* samoveptr)]
[rem int]
  [index int]))
(define-ftype sasetgroup-iterator (struct
  [data (* sasetgroup)]
[rem int]
  [index int]))
(define-ftype sasetmods-iterator (struct
  [data (* sasetmods)]
[rem int]
  [index int]))
(define-ftype sanoaction-iterator (struct
  [data (* sanoaction)]
[rem int]
  [index int]))
(define-ftype deviceledinfo-iterator (struct
  [data (* deviceledinfo)]
[rem int]
  [index int]))
(define-ftype listing-iterator (struct
  [data (* listing)]
[rem int]
  [index int]))
(define-ftype row-iterator (struct
  [data (* row)]
[rem int]
  [index int]))
(define-ftype overlay-iterator (struct
  [data (* overlay)]
[rem int]
  [index int]))
(define-ftype overlayrow-iterator (struct
  [data (* overlayrow)]
[rem int]
  [index int]))
(define-ftype overlaykey-iterator (struct
  [data (* overlaykey)]
[rem int]
  [index int]))
(define-ftype key-iterator (struct
  [data (* key)]
[rem int]
  [index int]))
(define-ftype shape-iterator (struct
  [data (* shape)]
[rem int]
  [index int]))
(define-ftype outline-iterator (struct
  [data (* outline)]
[rem int]
  [index int]))
(define-ftype setkeytype-iterator (struct
  [data (* setkeytype)]
[rem int]
  [index int]))
(define-ftype ktsetmapentry-iterator (struct
  [data (* ktsetmapentry)]
[rem int]
  [index int]))
(define-ftype keyvmodmap-iterator (struct
  [data (* keyvmodmap)]
[rem int]
  [index int]))
(define-ftype keymodmap-iterator (struct
  [data (* keymodmap)]
[rem int]
  [index int]))
(define-ftype setexplicit-iterator (struct
  [data (* setexplicit)]
[rem int]
  [index int]))
(define-ftype setbehavior-iterator (struct
  [data (* setbehavior)]
[rem int]
  [index int]))
(define-ftype behavior-iterator (struct
  [data (* behavior)]
[rem int]
  [index int]))
(define-ftype overlaybehavior-iterator (struct
  [data (* overlaybehavior)]
[rem int]
  [index int]))
(define-ftype radiogroupbehavior-iterator (struct
  [data (* radiogroupbehavior)]
[rem int]
  [index int]))
(define-ftype defaultbehavior-iterator (struct
  [data (* defaultbehavior)]
[rem int]
  [index int]))
(define-ftype commonbehavior-iterator (struct
  [data (* commonbehavior)]
[rem int]
  [index int]))
(define-ftype keysymmap-iterator (struct
  [data (* keysymmap)]
[rem int]
  [index int]))
(define-ftype keytype-iterator (struct
  [data (* keytype)]
[rem int]
  [index int]))
(define-ftype ktmapentry-iterator (struct
  [data (* ktmapentry)]
[rem int]
  [index int]))
(define-ftype countedstring16-iterator (struct
  [data (* countedstring16)]
[rem int]
  [index int]))
(define-ftype keyalias-iterator (struct
  [data (* keyalias)]
[rem int]
  [index int]))
(define-ftype keyname-iterator (struct
  [data (* keyname)]
[rem int]
  [index int]))
(define-ftype moddef-iterator (struct
  [data (* moddef)]
[rem int]
  [index int]))
(define-ftype indicatormap-iterator (struct
  [data (* indicatormap)]
[rem int]
  [index int]))
(define-ftype printer-iterator (struct
  [data (* printer)]
[rem int]
  [index int]))
(define-ftype listitem-iterator (struct
  [data (* listitem)]
[rem int]
  [index int]))
(define-ftype imageformatinfo-iterator (struct
  [data (* imageformatinfo)]
[rem int]
  [index int]))
(define-ftype attributeinfo-iterator (struct
  [data (* attributeinfo)]
[rem int]
  [index int]))
(define-ftype image-iterator (struct
  [data (* image)]
[rem int]
  [index int]))
(define-ftype encodinginfo-iterator (struct
  [data (* encodinginfo)]
[rem int]
  [index int]))
(define-ftype adaptorinfo-iterator (struct
  [data (* adaptorinfo)]
[rem int]
  [index int]))
(define-ftype format-iterator (struct
  [data (* format)]
[rem int]
  [index int]))
(define-ftype rational-iterator (struct
  [data (* rational)]
[rem int]
  [index int]))
(define-ftype surfaceinfo-iterator (struct
  [data (* surfaceinfo)]
[rem int]
  [index int]))
(define-ftype kind-iterator
  (struct
    [data (* unsigned-8)]
    [rem int]
    [index int]))
