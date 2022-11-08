(library (constants)
  (export AF-INET AF-UNIX SOCK-STREAM)
  (import (rnrs))
  (define AF-INET 2) ;;not relevant
  (define AF-UNIX 1) ;;used to connect to the X server
  (define SOCK-STREAM 1) ;;used to use segments instead of datagrams.
)
