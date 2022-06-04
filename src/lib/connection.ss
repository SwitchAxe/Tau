(load-shared-object "./socket.so") ;;for the C functions

;;1st param: the socket family (either AF-UNIX aka 1 or AF-INET aka 2)
;;2nd param: the type of the connection packet to use in the transport layer.
;;Only option available for now is SOCK-STREAM aka 1
;;returns a socket file descriptor connected to the X server on success, or -1 on failure.
(define x11-socket
    (foreign-procedure "ffi_socket" (int int) int))

;;confirms the connection to the X server by means of a three-way handshake on the
;;TCP port 6000+<display number>, with <display number> = 0, 1, ...
(define (x11-handshake x11-connection)
    ;;TODO make this function once the code generation works
    #f)