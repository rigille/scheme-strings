(load-shared-object "./libistring.so")

; immutable string type
(define-record istring
  ((immutable uptr ptr)))
(define istring-guardian (make-guardian))

; foreign-procedures
(define str_to_istr (foreign-procedure "str_to_istr" (ptr) uptr))
(define free-istring   (foreign-procedure "free_istr" (uptr) void))
(define foreign-double (foreign-procedure "foreign_double" (integer-64) integer-64))
(define foreign-length (foreign-procedure "string_test" (ptr) integer-64))

; wrapped procedures
(define string->istring
  (lambda (x)
    ; TODO check x is really a string?
    (let ((ret (make-istring (str_to_istr x))))
      (istring-guardian ret)
      ret)))

(collect-request-handler
  (lambda ()
    ; first, invoke the collector
    (collect)
    ; then free any storage that has been dropped
    (let f ()
      (let ([x (istring-guardian)])
        (when x
          (display "freeing istring!")
          (free-istring (istring-ptr x))
          (f))))))
