(import (enums))
(define-ftype enable-reply
  (struct
    [pad0 (array 1 unsigned-8)]
    [maximum_request_length unsigned-32]))
