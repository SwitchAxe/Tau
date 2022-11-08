(import-notify #t)
(for-each
 (lambda (e)
   (compile-file (string-append
		  "src/lib/"
		  e)))
 '("memoization.ss"
   "utility.ss"
   "readfile"
   "constants.ss"
   "bitwise.ss"
   "parse.ss"
   "enums.ss"
   "generate.ss"))
(exit)
