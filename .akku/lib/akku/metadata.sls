#!r6rs
;; This file was written by Akku.scm
;; This file is automatically generated and is not a copyrightable work.
(library (akku metadata)
  (export
    main-package-name
    main-package-version
    installed-libraries
    installed-assets)
  (import (only (rnrs) define quote))
  (define main-package-name '"scheme-strings")
  (define main-package-version '"0.0.0-alpha.0")
  (define installed-libraries
    '((akku-r7rs base) (akku-r7rs compat) (akku-r7rs include)
      (laesare reader) (laesare writer) (private install sipp)
      (scheme base) (scheme case-lambda) (scheme char)
      (scheme complex) (scheme cxr) (scheme eval) (scheme file)
      (scheme inexact) (scheme lazy) (scheme load)
      (scheme process-context) (scheme r5rs) (scheme read)
      (scheme repl) (scheme time) (scheme write) (srfi :0)
      (srfi :0 cond-expand) (srfi :1) (srfi :1 lists) (srfi :11)
      (srfi :11 let-values) (srfi :111) (srfi :111 boxes)
      (srfi :113) (srfi :113 sets-and-bags) (srfi :115)
      (srfi :115 regexp) (srfi :115 regexp boundary)
      (srfi :116 ilists) (srfi :117) (srfi :117 list-queues)
      (srfi :125) (srfi :125 hashtables) (srfi :126)
      (srfi :126 helpers helpers) (srfi :126 r6rs-hashtables)
      (srfi :127) (srfi :127 lazy-sequences) (srfi :128)
      (srfi :128 comparators) (srfi :129) (srfi :129 titlecase)
      (srfi :13) (srfi :13 strings) (srfi :130)
      (srfi :130 string-cursors) (srfi :131) (srfi :131 records)
      (srfi :132) (srfi :132 sorting) (srfi :133)
      (srfi :133 vectors) (srfi :134) (srfi :134 ideques)
      (srfi :14) (srfi :14 char-sets)
      (srfi :14 char-sets inversion-list) (srfi :141)
      (srfi :141 integer-division) (srfi :143) (srfi :143 fixnums)
      (srfi :143 helpers) (srfi :145) (srfi :145 assumptions)
      (srfi :146) (srfi :146 gleckler hamt)
      (srfi :146 gleckler hamt-map) (srfi :146 gleckler hamt-misc)
      (srfi :146 gleckler vector-edit) (srfi :146 hash)
      (srfi :146 mappings) (srfi :146 nieper rbtree) (srfi :151)
      (srfi :151 bitwise-operations) (srfi :152)
      (srfi :152 strings) (srfi :156)
      (srfi :156 predicate-combiners) (srfi :158)
      (srfi :158 generators-and-accumulators) (srfi :16)
      (srfi :16 case-lambda) (srfi :17)
      (srfi :17 generalized-set!) (srfi :17 helpers) (srfi :175)
      (srfi :19) (srfi :19 time) (srfi :19 time compat)
      (srfi :19 time not-implemented) (srfi :2) (srfi :2 and-let*)
      (srfi :23) (srfi :23 error) (srfi :23 error tricks)
      (srfi :25) (srfi :25 multi-dimensional-arrays)
      (srfi :25 multi-dimensional-arrays all)
      (srfi :25 multi-dimensional-arrays arlib) (srfi :26)
      (srfi :26 cut) (srfi :27) (srfi :27 random-bits) (srfi :28)
      (srfi :28 basic-format-strings) (srfi :29)
      (srfi :29 localization) (srfi :31) (srfi :31 rec) (srfi :34)
      (srfi :34 exception-handling) (srfi :35)
      (srfi :35 conditions) (srfi :37) (srfi :37 args-fold)
      (srfi :38) (srfi :38 with-shared-structure) (srfi :39)
      (srfi :39 parameters) (srfi :4) (srfi :4 numeric-vectors)
      (srfi :41) (srfi :41 streams) (srfi :41 streams derived)
      (srfi :41 streams primitive) (srfi :42)
      (srfi :42 eager-comprehensions) (srfi :43)
      (srfi :43 vectors) (srfi :45) (srfi :45 lazy) (srfi :48)
      (srfi :48 intermediate-format-strings)
      (srfi :48 intermediate-format-strings compat) (srfi :5)
      (srfi :5 let) (srfi :51) (srfi :51 rest-values) (srfi :54)
      (srfi :54 cat) (srfi :6) (srfi :6 basic-string-ports)
      (srfi :6 basic-string-ports compat) (srfi :60)
      (srfi :60 integer-bits) (srfi :61) (srfi :61 cond)
      (srfi :64) (srfi :64 testing) (srfi :67)
      (srfi :67 compare-procedures) (srfi :69)
      (srfi :69 basic-hash-tables) (srfi :78)
      (srfi :78 lightweight-testing)
      (srfi :78 lightweight-testing compat) (srfi :8)
      (srfi :8 receive) (srfi :9) (srfi :9 records) (srfi :98)
      (srfi :98 os-environment-variables) (srfi :99)
      (srfi :99 records) (srfi :99 records helper)
      (srfi :99 records inspection) (srfi :99 records procedural)
      (srfi :99 records syntactic) (srfi private OS-id-features)
      (srfi private check-arg) (srfi private define-values)
      (srfi private feature-cond) (srfi private helpers)
      (srfi private include) (srfi private include compat)
      (srfi private include read) (srfi private let-opt)
      (srfi private platform-features) (srfi private registry)
      (srfi private registry-names) (srfi private vanish)
      (srfi srfi-0) (srfi srfi-48 compat) (srfi srfi-78 compat)
      (srfi 135) (srfi 135 kernel0) (srfi 135 kernel16)
      (srfi 135 kernel8) (srfi 135 texts)))
  (define installed-assets
    '(((include "135.body.scm") ("srfi/135.body.scm") (srfi 135))
      ((include "kernel0.body.scm")
        ("srfi/135/kernel0.body.scm")
        (srfi 135 kernel0))
      ((include "kernel16.body.scm")
        ("srfi/135/kernel16.body.scm")
        (srfi 135 kernel16))
      ((include "kernel8.body.scm")
        ("srfi/135/kernel8.body.scm")
        (srfi 135 kernel8))
      ((include/resolve ("srfi" "%3a1") "srfi-1-reference.scm")
        ("srfi/%3a1/srfi-1-reference.scm")
        (srfi :1 lists))
      ((include/resolve ("srfi" "%3a115") "regexp-impl.scm")
        ("srfi/%3a115/regexp-impl.scm")
        (srfi :115 regexp))
      ((include/resolve ("srfi" "%3a115") "regexp-impl.scm")
        ("srfi/%3a115/regexp-impl.scm")
        (srfi srfi-115))
      ((include/resolve
         ("srfi" "%3a115" "regexp")
         "boundary-impl.scm")
        ("srfi/%3a115/regexp/boundary-impl.scm")
        (srfi :115 regexp boundary))
      ((include/resolve
         ("srfi" "%3a115" "regexp")
         "boundary-impl.scm")
        ("srfi/%3a115/regexp/boundary-impl.scm")
        (srfi srfi-115 boundary))
      ((include/resolve ("srfi" "%3a117") "list-queues-impl.scm")
        ("srfi/%3a117/list-queues-impl.scm")
        (srfi :117 list-queues))
      ((include/resolve ("srfi" "%3a117") "list-queues-impl.scm")
        ("srfi/%3a117/list-queues-impl.scm")
        (srfi srfi-117))
      ((include/resolve ("srfi" "%3a125") "125.body.scm")
        ("srfi/%3a125/125.body.scm")
        (srfi :125 hashtables))
      ((include/resolve ("srfi" "%3a125") "125.body.scm")
        ("srfi/%3a125/125.body.scm")
        (srfi srfi-125))
      ((include/resolve ("srfi" "%3a126") "126.body.scm")
        ("srfi/%3a126/126.body.scm")
        (srfi :126 r6rs-hashtables))
      ((include/resolve ("srfi" "%3a126") "126.body.scm")
        ("srfi/%3a126/126.body.scm")
        (srfi srfi-126))
      ((include/resolve ("srfi" "%3a127") "lseqs-impl.scm")
        ("srfi/%3a127/lseqs-impl.scm")
        (srfi :127 lazy-sequences))
      ((include/resolve ("srfi" "%3a127") "lseqs-impl.scm")
        ("srfi/%3a127/lseqs-impl.scm")
        (srfi srfi-127))
      ((include/resolve ("srfi" "%3a128") "128.body1.scm")
        ("srfi/%3a128/128.body1.scm")
        (srfi :128 comparators))
      ((include/resolve ("srfi" "%3a128") "128.body1.scm")
        ("srfi/%3a128/128.body1.scm")
        (srfi srfi-128))
      ((include/resolve ("srfi" "%3a128") "128.body2.scm")
        ("srfi/%3a128/128.body2.scm")
        (srfi :128 comparators))
      ((include/resolve ("srfi" "%3a128") "128.body2.scm")
        ("srfi/%3a128/128.body2.scm")
        (srfi srfi-128))
      ((include/resolve ("srfi" "%3a129") "titlecase-impl.scm")
        ("srfi/%3a129/titlecase-impl.scm")
        (srfi :129 titlecase))
      ((include/resolve ("srfi" "%3a129") "titlecase-impl.scm")
        ("srfi/%3a129/titlecase-impl.scm")
        (srfi srfi-129))
      ((include/resolve ("srfi" "%3a129") "titlemaps.scm")
        ("srfi/%3a129/titlemaps.scm")
        (srfi :129 titlecase))
      ((include/resolve ("srfi" "%3a129") "titlemaps.scm")
        ("srfi/%3a129/titlemaps.scm")
        (srfi srfi-129))
      ((include/resolve ("srfi" "%3a13") "srfi-13.scm")
        ("srfi/%3a13/srfi-13.scm")
        (srfi :13 strings))
      ((include/resolve ("srfi" "%3a130") "130.body.scm")
        ("srfi/%3a130/130.body.scm")
        (srfi :130 string-cursors))
      ((include/resolve ("srfi" "%3a130") "130.body.scm")
        ("srfi/%3a130/130.body.scm")
        (srfi srfi-130))
      ((include/resolve ("srfi" "%3a132") "delndups.scm")
        ("srfi/%3a132/delndups.scm")
        (srfi :132 sorting))
      ((include/resolve ("srfi" "%3a132") "delndups.scm")
        ("srfi/%3a132/delndups.scm")
        (srfi srfi-132))
      ((include/resolve ("srfi" "%3a132") "lmsort.scm")
        ("srfi/%3a132/lmsort.scm")
        (srfi :132 sorting))
      ((include/resolve ("srfi" "%3a132") "lmsort.scm")
        ("srfi/%3a132/lmsort.scm")
        (srfi srfi-132))
      ((include/resolve ("srfi" "%3a132") "median.scm")
        ("srfi/%3a132/median.scm")
        (srfi :132 sorting))
      ((include/resolve ("srfi" "%3a132") "median.scm")
        ("srfi/%3a132/median.scm")
        (srfi srfi-132))
      ((include/resolve ("srfi" "%3a132") "sort.scm")
        ("srfi/%3a132/sort.scm")
        (srfi :132 sorting))
      ((include/resolve ("srfi" "%3a132") "sort.scm")
        ("srfi/%3a132/sort.scm")
        (srfi srfi-132))
      ((include/resolve ("srfi" "%3a132") "sortp.scm")
        ("srfi/%3a132/sortp.scm")
        (srfi :132 sorting))
      ((include/resolve ("srfi" "%3a132") "sortp.scm")
        ("srfi/%3a132/sortp.scm")
        (srfi srfi-132))
      ((include/resolve ("srfi" "%3a132") "vector-util.scm")
        ("srfi/%3a132/vector-util.scm")
        (srfi :132 sorting))
      ((include/resolve ("srfi" "%3a132") "vector-util.scm")
        ("srfi/%3a132/vector-util.scm")
        (srfi srfi-132))
      ((include/resolve ("srfi" "%3a132") "vhsort.scm")
        ("srfi/%3a132/vhsort.scm")
        (srfi :132 sorting))
      ((include/resolve ("srfi" "%3a132") "vhsort.scm")
        ("srfi/%3a132/vhsort.scm")
        (srfi srfi-132))
      ((include/resolve ("srfi" "%3a132") "visort.scm")
        ("srfi/%3a132/visort.scm")
        (srfi :132 sorting))
      ((include/resolve ("srfi" "%3a132") "visort.scm")
        ("srfi/%3a132/visort.scm")
        (srfi srfi-132))
      ((include/resolve ("srfi" "%3a132") "vmsort.scm")
        ("srfi/%3a132/vmsort.scm")
        (srfi :132 sorting))
      ((include/resolve ("srfi" "%3a132") "vmsort.scm")
        ("srfi/%3a132/vmsort.scm")
        (srfi srfi-132))
      ((include/resolve ("srfi" "%3a132") "vqsort2.scm")
        ("srfi/%3a132/vqsort2.scm")
        (srfi :132 sorting))
      ((include/resolve ("srfi" "%3a132") "vqsort2.scm")
        ("srfi/%3a132/vqsort2.scm")
        (srfi srfi-132))
      ((include/resolve ("srfi" "%3a133") "vectors-impl.scm")
        ("srfi/%3a133/vectors-impl.scm")
        (srfi :133 vectors))
      ((include/resolve ("srfi" "%3a133") "vectors-impl.scm")
        ("srfi/%3a133/vectors-impl.scm")
        (srfi srfi-133))
      ((include/resolve
         ("srfi" "%3a14")
         "srfi-14-base-char-sets.scm")
        ("srfi/%3a14/srfi-14-base-char-sets.scm")
        (srfi :14 char-sets))
      ((include/resolve ("srfi" "%3a14") "srfi-14-char-sets.scm")
        ("srfi/%3a14/srfi-14-char-sets.scm")
        (srfi :14 char-sets))
      ((include/resolve ("srfi" "%3a14") "srfi-14.scm")
        ("srfi/%3a14/srfi-14.scm")
        (srfi :14 char-sets))
      ((include/resolve
         ("srfi" "%3a14" "char-sets")
         "inversion-list-impl.scm")
        ("srfi/%3a14/char-sets/inversion-list-impl.scm")
        (srfi :14 char-sets inversion-list))
      ((include/resolve ("srfi" "%3a141") "srfi-141-impl.scm")
        ("srfi/%3a141/srfi-141-impl.scm")
        (srfi :141 integer-division))
      ((include/resolve ("srfi" "%3a141") "srfi-141-impl.scm")
        ("srfi/%3a141/srfi-141-impl.scm")
        (srfi srfi-141))
      ((include/resolve
         ("srfi" "%3a152")
         "extend-comparisons.scm")
        ("srfi/%3a152/extend-comparisons.scm")
        (srfi :152 strings))
      ((include/resolve
         ("srfi" "%3a152")
         "extend-comparisons.scm")
        ("srfi/%3a152/extend-comparisons.scm")
        (srfi srfi-152))
      ((include/resolve ("srfi" "%3a152") "macros.scm")
        ("srfi/%3a152/macros.scm")
        (srfi :152 strings))
      ((include/resolve ("srfi" "%3a152") "macros.scm")
        ("srfi/%3a152/macros.scm")
        (srfi srfi-152))
      ((include/resolve ("srfi" "%3a152") "portable.scm")
        ("srfi/%3a152/portable.scm")
        (srfi :152 strings))
      ((include/resolve ("srfi" "%3a152") "portable.scm")
        ("srfi/%3a152/portable.scm")
        (srfi srfi-152))
      ((include/resolve ("srfi" "%3a152") "r7rs-shim.scm")
        ("srfi/%3a152/r7rs-shim.scm")
        (srfi :152 strings))
      ((include/resolve ("srfi" "%3a152") "r7rs-shim.scm")
        ("srfi/%3a152/r7rs-shim.scm")
        (srfi srfi-152))
      ((include/resolve ("srfi" "%3a156") "srfi-156-impl.scm")
        ("srfi/%3a156/srfi-156-impl.scm")
        (srfi :156 predicate-combiners))
      ((include/resolve ("srfi" "%3a156") "srfi-156-impl.scm")
        ("srfi/%3a156/srfi-156-impl.scm")
        (srfi srfi-156))
      ((include/resolve ("srfi" "%3a158") "srfi-158-impl.scm")
        ("srfi/%3a158/srfi-158-impl.scm")
        (srfi :158 generators-and-accumulators))
      ((include/resolve ("srfi" "%3a19") "srfi-19.scm")
        ("srfi/%3a19/srfi-19.scm")
        (srfi :19 time))
      ((include/resolve ("srfi" "%3a25") "arlib.scm")
        ("srfi/%3a25/arlib.scm")
        (srfi :25 multi-dimensional-arrays arlib))
      ((include/resolve ("srfi" "%3a25") "arlib.scm")
        ("srfi/%3a25/arlib.scm")
        (srfi srfi-25 arlib))
      ((include/resolve ("srfi" "%3a25") "array.scm")
        ("srfi/%3a25/array.scm")
        (srfi :25 multi-dimensional-arrays all))
      ((include/resolve ("srfi" "%3a25") "array.scm")
        ("srfi/%3a25/array.scm")
        (srfi srfi-25 all))
      ((include/resolve ("srfi" "%3a25") "ix-ctor.scm")
        ("srfi/%3a25/ix-ctor.scm")
        (srfi :25 multi-dimensional-arrays all))
      ((include/resolve ("srfi" "%3a25") "ix-ctor.scm")
        ("srfi/%3a25/ix-ctor.scm")
        (srfi srfi-25 all))
      ((include/resolve ("srfi" "%3a25") "op-ctor.scm")
        ("srfi/%3a25/op-ctor.scm")
        (srfi :25 multi-dimensional-arrays all))
      ((include/resolve ("srfi" "%3a25") "op-ctor.scm")
        ("srfi/%3a25/op-ctor.scm")
        (srfi srfi-25 all))
      ((include/resolve ("srfi" "%3a26") "cut-impl.scm")
        ("srfi/%3a26/cut-impl.scm")
        (srfi :26 cut))
      ((include/resolve ("srfi" "%3a27") "mrg32k3a-a.scm")
        ("srfi/%3a27/mrg32k3a-a.scm")
        (srfi :27 random-bits))
      ((include/resolve ("srfi" "%3a27") "mrg32k3a.scm")
        ("srfi/%3a27/mrg32k3a.scm")
        (srfi :27 random-bits))
      ((include/resolve ("srfi" "%3a37") "srfi-37-reference.scm")
        ("srfi/%3a37/srfi-37-reference.scm")
        (srfi :37 args-fold))
      ((include/resolve ("srfi" "%3a42") "ec.scm")
        ("srfi/%3a42/ec.scm")
        (srfi :42 eager-comprehensions))
      ((include/resolve ("srfi" "%3a43") "vector-lib.scm")
        ("srfi/%3a43/vector-lib.scm")
        (srfi :43 vectors))
      ((include/resolve ("srfi" "%3a51") "srfi-51-impl.scm")
        ("srfi/%3a51/srfi-51-impl.scm")
        (srfi :51 rest-values))
      ((include/resolve ("srfi" "%3a51") "srfi-51-impl.scm")
        ("srfi/%3a51/srfi-51-impl.scm")
        (srfi srfi-51))
      ((include/resolve ("srfi" "%3a54") "srfi-54-impl.scm")
        ("srfi/%3a54/srfi-54-impl.scm")
        (srfi :54 cat))
      ((include/resolve ("srfi" "%3a54") "srfi-54-impl.scm")
        ("srfi/%3a54/srfi-54-impl.scm")
        (srfi srfi-54))
      ((include/resolve ("srfi" "%3a64") "testing-impl.scm")
        ("srfi/%3a64/testing-impl.scm")
        (srfi :64 testing))
      ((include/resolve ("srfi" "%3a67") "compare.scm")
        ("srfi/%3a67/compare.scm")
        (srfi :67 compare-procedures))
      ((include/resolve ("srfi" "%3a78") "check.scm")
        ("srfi/%3a78/check.scm")
        (srfi :78 lightweight-testing))
      ((include/resolve ("srfi" "%3a78") "check.scm")
        ("srfi/%3a78/check.scm")
        (srfi srfi-78)))))
