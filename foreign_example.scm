(load-shared-object "./libsimpleprocedure.so")
(foreign-entry? "foreign_double")
(define foreign-double (foreign-procedure "foreign_double" (integer-64) integer-64))
(foreign-double 2)
