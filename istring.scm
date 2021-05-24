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
(define istr_head      (foreign-procedure "istr_head"      (uptr) ptr))
(define istr_tail      (foreign-procedure "istr_tail"      (uptr) uptr))
(define istr_length    (foreign-procedure "istr_length"    (uptr) ptr))
(define istr_eql       (foreign-procedure "istr_eql"       (uptr uptr) ptr))
(define istr_concat    (foreign-procedure "istr_concat"    (uptr uptr) uptr))

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
          (free_istring (istring-ptr x))
          (f))))))

; wrapped procedures
(define string->istring
  (lambda (x)
    ; TODO check x is really a string?
    (make-istring (str_to_istr x))))

(define istring->string
  (lambda (x)
    (istr_to_str (istring-ptr x))))

; TODO avoid segfault on empty string
(define istring-head
  (lambda (x)
    (istr_head (istring-ptr x))))
; TODO avoid segfault on empty string
(define istring-tail
  (lambda (x)
    (make-istring (istr_tail (istring-ptr x)))))

(define istring-length
  (lambda (x)
    (istr_length (istring-ptr x))))

(define istring-eql?
  (lambda (fst snd)
    (istr_eql (istring-ptr fst) (istring-ptr snd))))

(define istring-append
  (lambda (fst snd)
    (make-istring (istr_concat (istring-ptr fst) (istring-ptr snd)))))
