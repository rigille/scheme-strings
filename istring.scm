(load-shared-object "./libistring.so")
; immutable string type
(define-ftype istring uptr)
(define string->istring (foreign-procedure "str_to_istr" (ptr) istring))
(define free-istring (foreign-procedure "free_istr" (istring) void))
(define foreign-double (foreign-procedure "foreign_double" (integer-64) integer-64))
(define foreign-length (foreign-procedure "string_test" (ptr) integer-64))
