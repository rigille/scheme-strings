(load-shared-object "./libistring.so")
; immutable string type
(define-ftype istring uptr)
(define string->istring (foreign-procedure "str_to_istr" (string) istring))
(define free-istring (foreign-procedure "free_istr" (istring) void))
(define foreign-double (foreign-procedure "foreign_double" (integer-64) integer-64))
