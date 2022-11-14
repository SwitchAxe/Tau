(import (enums))
(load "xproto.ss")(define-ftype alarm unsigned-32)
(define alarmstate (enum
  '((alarmstate-active 0)
  (alarmstate-inactive 0)
  (alarmstate-destroyed 1))))
(define-ftype counter unsigned-32)
(define-ftype fence unsigned-32)
(define testtype (enum
  '((testtype-positivetransition 0)
  (testtype-negativetransition 0)
  (testtype-positivecomparison 1)
  (testtype-negativecomparison 2))))
(define valuetype (enum
  '((valuetype-absolute 0)
  (valuetype-relative 0))))
(define ca (enum
  '((ca-counter 1)
  (ca-valuetype 1)
  (ca-value 2)
  (ca-testtype 4)
  (ca-delta 8)
  (ca-events 16))))
(define-ftype int64
  (struct
    [hi integer-32]
    [lo unsigned-32]))
(define-ftype systemcounter
  (struct
    [counter counter]
    [resolution sync:int64]
    [name_len unsigned-16]
    [name (* unsigned-8)]
    [pad0 (array 4 unsigned-8)]))
(define-ftype trigger
  (struct
    [counter counter]
    [wait_type-enum unsigned-32]
    [wait_value sync:int64]
    [test_type-enum unsigned-32]))
(define-ftype waitcondition
  (struct
    [trigger trigger]
    [event_threshold sync:int64]))
(define counter-error-number 0)
(define-ftype counter-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]
   [bad_counter unsigned-32]
    [minor_opcode unsigned-16]
    [major_opcode unsigned-8]))
(define alarm-error-number 1)
(define-ftype alarm-error
  (struct
   [response-type unsigned-8]
   [error-code unsigned-8]
   [sequence unsigned-16]
   [bad_alarm unsigned-32]
    [minor_opcode unsigned-16]
    [major_opcode unsigned-8]))
(define initialize-opcode 0)
(define-ftype initialize
  (struct
    [desired_major_version unsigned-8]
    [desired_minor_version unsigned-8]))
(define-ftype initialize-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [major_version unsigned-8]
    [minor_version unsigned-8]
    [pad1 (array 22 unsigned-8)]))
(define-ftype listsystemcounters-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [counters_len unsigned-32]
    [pad1 (array 20 unsigned-8)]
    [counters (* systemcounter)]))
(define createcounter-opcode 2)
(define-ftype createcounter
  (struct
    [id counter]
    [initial_value sync:int64]))
(define destroycounter-opcode 6)
(define-ftype destroycounter
  (struct
    [counter counter]))
(define querycounter-opcode 5)
(define-ftype querycounter
  (struct
    [counter counter]))
(define-ftype querycounter-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [counter_value sync:int64]))
(define await-opcode 7)
(define-ftype await
  (struct
    [wait_list waitcondition]))
(define changecounter-opcode 4)
(define-ftype changecounter
  (struct
    [counter counter]
    [amount sync:int64]))
(define setcounter-opcode 3)
(define-ftype setcounter
  (struct
    [counter counter]
    [value sync:int64]))
(define createalarm-opcode 8)
(define-ftype createalarm
  (struct
    [id alarm]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [Counter unsigned-32]
    [counter counter]
    [valuetype-enum unsigned-32]
    [value sync:int64]
    [testtype-enum unsigned-32]
    [delta sync:int64]
    [events unsigned-32]))
(define changealarm-opcode 9)
(define-ftype changealarm
  (struct
    [id alarm]
    [value_mask-mask unsigned-32]))
(define-ftype value_list
  (struct
    [Counter unsigned-32]
    [counter counter]
    [valuetype-enum unsigned-32]
    [value sync:int64]
    [testtype-enum unsigned-32]
    [delta sync:int64]
    [events unsigned-32]))
(define destroyalarm-opcode 11)
(define-ftype destroyalarm
  (struct
    [alarm alarm]))
(define queryalarm-opcode 10)
(define-ftype queryalarm
  (struct
    [alarm alarm]))
(define-ftype queryalarm-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [trigger trigger]
    [delta sync:int64]
    [events boolean]
    [state-enum unsigned-8]
    [pad1 (array 2 unsigned-8)]))
(define setpriority-opcode 12)
(define-ftype setpriority
  (struct
    [id unsigned-32]
    [priority integer-32]))
(define getpriority-opcode 13)
(define-ftype getpriority
  (struct
    [id unsigned-32]))
(define-ftype getpriority-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [priority integer-32]))
(define createfence-opcode 14)
(define-ftype createfence
  (struct
    [drawable unsigned-32]
    [fence fence]
    [initially_triggered boolean]))
(define triggerfence-opcode 15)
(define-ftype triggerfence
  (struct
    [fence fence]))
(define resetfence-opcode 16)
(define-ftype resetfence
  (struct
    [fence fence]))
(define destroyfence-opcode 17)
(define-ftype destroyfence
  (struct
    [fence fence]))
(define queryfence-opcode 18)
(define-ftype queryfence
  (struct
    [fence fence]))
(define-ftype queryfence-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [triggered boolean]
    [pad1 (array 23 unsigned-8)]))
(define awaitfence-opcode 19)
(define-ftype awaitfence
  (struct
    [fence_list fence]))
(define counternotify-number 0)
(define-ftype counternotify
    (struct
    [kind unsigned-8]
    [counter counter]
    [wait_value sync:int64]
    [counter_value sync:int64]
    [timestamp timestamp]
    [count unsigned-16]
    [destroyed boolean]
    [pad0 (array 1 unsigned-8)]))
(define alarmnotify-number 1)
(define-ftype alarmnotify
    (struct
    [kind unsigned-8]
    [alarm alarm]
    [counter_value sync:int64]
    [alarm_value sync:int64]
    [timestamp timestamp]
    [state-enum unsigned-8]
    [pad1 (array 3 unsigned-8)]))
