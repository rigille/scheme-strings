#include <stdint.h>
#include <iostream>
#include "scheme.h"
#include <immer/flex_vector.hpp>

extern "C" {

// tests
int64_t foreign_double(int64_t n);
int64_t string_test(ptr obj);

// string -> istring
uptr str_to_istr(ptr str);
// free istring
void free_istr(uptr istr);
// istring -> string #TODO
uptr istr_to_str(uptr istr);
// istring -> Char #TODO
string_char istr_head(uptr istr);
// istring -> istring #TODO
uptr istr_tail(uptr istr);
// istring -> Bool #TODO
uptr istring_eql(uptr istr);
// (istring, istring) -> istring #TODO
uptr istring_concat(uptr fst, uptr snd);
// (string, istring) -> istring #TODO
uptr str_istr_concat(uptr fst, uptr snd);
// (istring, string) -> istring #TODO
uptr istr_str_concat(uptr fst, uptr snd);
// (string, string) -> istring #TODO
uptr str_str_concat(uptr fst, uptr snd);

}

typedef immer::flex_vector<char> istring_t;

int64_t foreign_double(int64_t n) {
  return 2*n;
}

iptr string_test(ptr obj) {
  return (int64_t)Sstring_length(obj);
}

// string -> istring
uptr str_to_istr(ptr str) {
  // i think this is dumb, but let's see
  // it works for now, but initializing with
  // iterators would be better as it would
  // allocate less memory
  auto size = Sstring_length(str);
  istring_t tmp;
  for(auto i = 0; i < size; i++) {
    const auto c = Sstring_ref(str, i);
    tmp = tmp.push_back(c);
  }
  istring_t *ret = new istring_t;
  *ret = tmp;
  return (uptr)ret;
}

// free istring
void free_istr(uptr istr) {
  delete (istring_t*)istr;
}
