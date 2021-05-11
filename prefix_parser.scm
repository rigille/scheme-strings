; Short alias to vector-ref
(define get vector-ref)

; Converts a Kind word to a native integer
(define (word-to-u16 w)
  (define (word-to-u16-go i w x)
    (cond ((= 16 i) x)
      ((symbol=? 'Word.e (get w 0)) (word-to-u16-go (+ i 1) (vector 'Word.e) x))
      ((symbol=? 'Word.o (get w 0)) (word-to-u16-go (+ i 1) (get w 1) x))
      ((symbol=? 'Word.i (get w 0)) (word-to-u16-go (+ i 1) (get w 1) (fxior x (fxarithmetic-shift-left 1 i))))))
  (word-to-u16-go 0 w 0))

; Converts a native integer to a Kind word
(define (u16-to-word x)
  (define (u16-to-word-go i x w)
    (if (= 16 i) w (u16-to-word-go (+ i 1) x
      (if (= (fxand (fxarithmetic-shift-right x (- 15 i)) 1) 0)
        (vector 'Word.o w)
        (vector 'Word.i w)))))
  (u16-to-word-go 0 x (vector 'Word.e)))

; Joins a list of strings with an intercalated separator
(define (string_join sep strs fst)
  (if (null? strs) 
    ""
    (string-append
      (if fst "" sep)
      (car strs)
      (string_join sep (cdr strs) #f))))

; Returns the last index that chr occurs in str, -1 otherwise
(define (last_index_of chr str idx)
  (if (= idx (string-length str))
    -1
    (let ((rest (last_index_of chr str (+ idx 1))))
      (if (char=? (string-ref str idx) chr)
        (max idx rest)
        rest))))

; Returns the first index that chr occurs in str, -1 otherwise
(define (first_index_of chr str idx)
  (if (= idx (string-length str))
    -1
    (if (char=? (string-ref str idx) chr)
      idx
      (first_index_of chr str (+ idx 1)))))

; Splits a string using an identifier
(define (split_at_first chr str)
  (let ((split_idx (first_index_of chr str 0)))
    (if (= split_idx -1)
      str
      (cons
        (substring str 0 split_idx)
        (substring str (+ split_idx 1) (string-length str))))))

; Splits a string using an identifier
(define (split_at_last chr str)
  (let ((split_idx (last_index_of chr str 0)))
    (if (= split_idx -1)
      str
      (cons
        (substring str 0 split_idx)
        (substring str (+ split_idx 1) (string-length str))))))

; Converts a date to a string, in milliseconds
(define (time_to_string time)
  (number->string
    (+ (* (time-second time) 1000)
      (div (time-nanosecond time) 1000000))))

; Prints a text with a newline
(define (print txt)
  (display txt)
  (display "
"))

; Gets a line from stdin
(define (get_line)
  (let ((port (current-input-port)))
    (get-line port)))

; Deletes a file
(define (del_file file)
  (delete-file file))

; Gets the contents of a file as a string
; If it doesn't exist, returns empty
(define (get_file file)
  (if (file-exists? file)
    (let ((port (open-input-file file)))
      (let ((text (get-string-all port)))
        (begin
          (close-input-port port)
          text)))
    ""))

; Sets the contents of a file
(define (set_file file text)
  (system (string-append "mkdir -p " (car (split_at_last #\/ file))))
  (if (file-exists? file) (delete-file file))
  (let ((port (open-output-file file)))
    (begin
      (display text port)
      (close-output-port port))))

; Returns a list of files in a directory
(define (get_dir path)
  (directory-list path)) 

; Returns the time a file was modified. TODO: test on Windows/Linux
(define (get_file_mtime file)
  (time_to_string (file-modification-time file)))

; Returns the current time
(define (get_time)
  (time_to_string (current-time)))

; Performs a single Kind IO action
(define (io_action name)
  (case name
    ("print" (lambda (x) (print x)))
    ("put_string" (lambda (x) (display x)))
    ("get_line" (lambda (x) (get_line)))
    ("del_file" (lambda (x) (del_file x)))
    ("get_file" (lambda (x) (get_file x)))
    ("set_file" (lambda (x) (let ((file_text (split_at_first #\= x))) (set_file (car file_text) (cdr file_text)))))
    ("get_dir" (lambda (x) (get_dir x)))
    ("get_file_mtime" (lambda (x) (get_file_mtime x)))
    ("get_time" (lambda (x) (get_time)))))

; Runs a Kind IO program
(define (run_io io)
  (case (get io 0)
    ('IO.end (get io 0))
    ('IO.ask (let (
      (io_query (get io 1))
      (io_param (get io 2))
      (io_then (get io 3)))
      (run_io (io_then ((io_action io_query) io_param)))))))

(define Bool-inst (lambda (x) ((x #t) #f)))
(define Bool-elim (lambda (x) (let ((self0 x)) (case self0 (#t (let () (lambda (c0) (lambda (c1) c0)))) (#f (let () (lambda (c0) (lambda (c1) c1))))))))
(define Nat-inst (lambda (x) ((x 0) (lambda (x0) (+ x0 1)))))
(define Nat-elim (lambda (x) (let ((self0 x)) (case (= self0 0) (#t (let () (lambda (c0) (lambda (c1) c0)))) (#f (let ((f0 (- self0 1))) (lambda (c0) (lambda (c1) (c1 f0)))))))))
(define U16-inst (lambda (x) (x (lambda (x0) (word-to-u16 x0)))))
(define U16-elim (lambda (x) (let ((self0 x)) (case #t (#t (let ((f0 (u16-to-word self0))) (lambda (c0) (c0 f0))))))))
(define String-inst (lambda (x) ((x "") (lambda (x0) (lambda (x1) (string-append (make-string 1 (integer->char x0)) x1))))))
(define String-elim (lambda (x) (let ((self0 x)) (case (= (string-length self0) 0) (#t (let () (lambda (c0) (lambda (c1) c0)))) (#f (let ((f0 (char->integer (string-ref self0 0)))(f1 (let ((_str_ self0)) (substring _str_ 1 (string-length _str_))))) (lambda (c0) (lambda (c1) ((c1 f0) f1)))))))))
(define ($IO.ask query$1 param$2 then$3) (vector 'IO.ask query$1 param$2 then$3))
(define IO.ask (lambda (query$1) (lambda (param$2) (lambda (then$3) ($IO.ask query$1 param$2 then$3)))))
(define ($IO.bind a$2 f$3) (let ((self0 a$2)) (case (get self0 0) ('IO.end (let ((f0 (get self0 1))) (f$3 f0))) ('IO.ask (let ((f0 (get self0 1))(f1 (get self0 2))(f2 (get self0 3))) ($IO.ask f0 f1 (lambda (x$7) ($IO.bind (f2 x$7) f$3))))))))
(define IO.bind (lambda (a$2) (lambda (f$3) ($IO.bind a$2 f$3))))
(define ($IO.end value$1) (vector 'IO.end value$1))
(define IO.end (lambda (value$1) ($IO.end value$1)))
(define ($IO.monad) (vector 'Monad.new IO.bind IO.end))
(define IO.monad ($IO.monad))
(define ($IO.get_file name$0) ($IO.ask "get_file" name$0 (lambda (file$1) ($IO.end file$1))))
(define IO.get_file (lambda (name$0) ($IO.get_file name$0)))
(define ($Bool.true) #t)
(define Bool.true ($Bool.true))
(define ($Bool.false) #f)
(define Bool.false ($Bool.false))
(define ($Bool.and a$0 b$1) (and a$0 b$1))
(define Bool.and (lambda (a$0) (lambda (b$1) ($Bool.and a$0 b$1))))
(define ($Cmp.as_eql cmp$0) (let ((self0 cmp$0)) (case (get self0 0) ('Cmp.ltn (let () Bool.false)) ('Cmp.eql (let () Bool.true)) ('Cmp.gtn (let () Bool.false)))))
(define Cmp.as_eql (lambda (cmp$0) ($Cmp.as_eql cmp$0)))
(define ($Cmp.ltn) (vector 'Cmp.ltn))
(define Cmp.ltn ($Cmp.ltn))
(define ($Cmp.gtn) (vector 'Cmp.gtn))
(define Cmp.gtn ($Cmp.gtn))
(define ($Word.cmp.go a$1 b$2 c$3) ((let ((self0 a$1)) (case (get self0 0) ('Word.e (let () (lambda (b$4) c$3))) ('Word.o (let ((f0 (get self0 1))) (lambda (b$6) ((let ((self2 b$6)) (case (get self2 0) ('Word.e (let () (lambda (a.pred$7) c$3))) ('Word.o (let ((f2 (get self2 1))) (lambda (a.pred$9) ($Word.cmp.go a.pred$9 f2 c$3)))) ('Word.i (let ((f2 (get self2 1))) (lambda (a.pred$9) ($Word.cmp.go a.pred$9 f2 Cmp.ltn)))))) f0)))) ('Word.i (let ((f0 (get self0 1))) (lambda (b$6) ((let ((self2 b$6)) (case (get self2 0) ('Word.e (let () (lambda (a.pred$7) c$3))) ('Word.o (let ((f2 (get self2 1))) (lambda (a.pred$9) ($Word.cmp.go a.pred$9 f2 Cmp.gtn)))) ('Word.i (let ((f2 (get self2 1))) (lambda (a.pred$9) ($Word.cmp.go a.pred$9 f2 c$3)))))) f0)))))) b$2))
(define Word.cmp.go (lambda (a$1) (lambda (b$2) (lambda (c$3) ($Word.cmp.go a$1 b$2 c$3)))))
(define ($Cmp.eql) (vector 'Cmp.eql))
(define Cmp.eql ($Cmp.eql))
(define ($Word.cmp a$1 b$2) ($Word.cmp.go a$1 b$2 Cmp.eql))
(define Word.cmp (lambda (a$1) (lambda (b$2) ($Word.cmp a$1 b$2))))
(define ($Word.eql a$1 b$2) ($Cmp.as_eql ($Word.cmp a$1 b$2)))
(define Word.eql (lambda (a$1) (lambda (b$2) ($Word.eql a$1 b$2))))
(define ($U16.eql a$0 b$1) (= a$0 b$1))
(define U16.eql (lambda (a$0) (lambda (b$1) ($U16.eql a$0 b$1))))
(define ($Char.eql a$0 b$1) ($U16.eql a$0 b$1))
(define Char.eql (lambda (a$0) (lambda (b$1) ($Char.eql a$0 b$1))))
(define ($Test.Prefix prefix$0 text$1) (let ((self0 prefix$0)) (case (= (string-length self0) 0) (#t (let () (let ((self0 text$1)) (case (= (string-length self0) 0) (#t (let () Bool.true)) (#f (let ((f0 (char->integer (string-ref self0 0)))(f1 (let ((_str_ self0)) (substring _str_ 1 (string-length _str_))))) Bool.true)))))) (#f (let ((f0 (char->integer (string-ref self0 0)))(f1 (let ((_str_ self0)) (substring _str_ 1 (string-length _str_))))) (let ((self2 text$1)) (case (= (string-length self2) 0) (#t (let () Bool.false)) (#f (let ((f2 (char->integer (string-ref self2 0)))(f3 (let ((_str_ self2)) (substring _str_ 1 (string-length _str_))))) ($Bool.and ($Char.eql f0 f2) ($Test.Prefix f1 f3)))))))))))
(define Test.Prefix (lambda (prefix$0) (lambda (text$1) ($Test.Prefix prefix$0 text$1))))
(define ($Test.Prefix.files file_pref$0 file_text$1) (((let ((self0 IO.monad)) (case (get self0 0) ('Monad.new (let ((f0 (get self0 1))(f1 (get self0 2))) f0)))) ($IO.get_file file_pref$0)) (lambda (pref$2) (((let ((self1 IO.monad)) (case (get self1 0) ('Monad.new (let ((f1 (get self1 1))(f2 (get self1 2))) f1)))) ($IO.get_file file_text$1)) (lambda (txt$3) ((let ((self2 IO.monad)) (case (get self2 0) ('Monad.new (let ((f2 (get self2 1))(f3 (get self2 2))) f3)))) ($Test.Prefix pref$2 txt$3)))))))
(define Test.Prefix.files (lambda (file_pref$0) (lambda (file_text$1) ($Test.Prefix.files file_pref$0 file_text$1))))
