(load-shared-object "./libistring.so")

; immutable string type
(define-record istring
  ((immutable uptr ptr))
  ()
  ((constructor wrap-istring)))
(define istring-guardian (make-guardian))
; istring constructor that registers pointer in guardian
(define make-istring
  (lambda (x)
    (let ((ret (wrap-istring x)))
      (istring-guardian ret)
      ret)))

; foreign-procedures
(define str_to_istr    (foreign-procedure "str_to_istr"    (ptr) uptr))
(define free_istring   (foreign-procedure "free_istr"      (uptr) void))
(define istr_to_str    (foreign-procedure "istr_to_str"    (uptr) ptr))
(define foreign_double (foreign-procedure "foreign_double" (integer-64) integer-64))
(define foreign_length (foreign-procedure "string_test"    (ptr) integer-64))

; handle garbage collection
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

; wrapped procedures
(define string->istring
  (lambda (x)
    ; TODO check x is really a string?
    (make-istring (str_to_istr x))))

(define istring->string
  (lambda (x)
    (istr_to_str (istring-ptr x))))
