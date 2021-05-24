(load-shared-object "./libistring.so")
; immutable string type
(define-ftype istring uptr)
(define istring-guardian (make-guardian))

(define str_to_istr (foreign-procedure "str_to_istr" (ptr) istring))
(define string->istring
  (lambda (x)
    ; TODO check x is really a string?
    (let ((ret (str_to_istr x)))
      (istring-guardian ret)
      ret)))
(define free-istring (foreign-procedure "free_istr" (istring) void))
(define foreign-double (foreign-procedure "foreign_double" (integer-64) integer-64))
(define foreign-length (foreign-procedure "string_test" (ptr) integer-64))

(do ((i 0 (+ i 1))) ((eq? i 5)) (string->istring "hi"))
