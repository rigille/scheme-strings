#include <stdint.h>
#include "scheme.h"
#include <immer/flex_vector.hpp>

extern "C" {

// tests
int64_t foreign_double(int64_t n);
iptr string_test(uptr obj);

// istring -> Char
string_char istring_head(uptr istr);
// istring -> istring #TODO
uptr istring_tail(uptr istr);
// istring -> Bool #TODO
uptr istring_eql(uptr istr);
// (istring, istring) -> istring #TODO
uptr istring_concat(uptr fst, uptr snd);
// (string, istring) -> istring #TODO
uptr str_istr_concat(uptr fst, uptr snd);
// (istring, string) -> istring #TODO
uptr istr_str_concat(uptr fst, uptr snd);
// (string, string) -> istring #TODO
uptr istr_str_concat(uptr fst, uptr snd);

}

int64_t foreign_double(int64_t n) {
  return 2*n;
}

iptr string_test(ptr obj) {
  return Sstring_length(obj);
}
