(load-shared-object "./libistring.so")

; immutable string type
(define-record istring
  ((immutable uptr ptr))
  ()
  ((constructor wrap-istring)))
(define istring-guardian (make-guardian))
; istring constructors that registers pointer in guardian
(define make-istring
  (lambda (x)
    (let ((ret (wrap-istring x)))
      (istring-guardian ret)
      ret)))

; foreign-procedures
(define str_to_istr (foreign-procedure "str_to_istr" (ptr) uptr))
(define free-istring   (foreign-procedure "free_istr" (uptr) void))
(define foreign-double (foreign-procedure "foreign_double" (integer-64) integer-64))
(define foreign-length (foreign-procedure "string_test" (ptr) integer-64))

; wrapped procedures
(define string->istring
  (lambda (x)
    ; TODO check x is really a string?
    (make-istring (str_to_istr x))))

(collect-request-handler
  (lambda ()
    ; first, invoke the collector
    (collect)
    ; then free any storage that has been dropped
    (let f ()
      (let ([x (istring-guardian)])
        (when x
          (display "freeing istring!\n")
          (free-istring (istring-ptr x))
          (f))))))
