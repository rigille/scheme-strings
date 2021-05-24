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
void free_istr(uptr raw_istr);
// istring -> string
ptr istr_to_str(uptr raw_istr);
// istring -> Char
ptr istr_head(uptr raw_istr);
// istring -> istring
uptr istr_tail(uptr raw_istr);
// istring -> size
ptr istr_length(uptr raw_istr);
// istring -> Bool
ptr istr_eql(uptr raw_fst, uptr raw_snd);
// (istring, istring) -> istring
uptr istr_concat(uptr raw_fst, uptr raw_snd);
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
void free_istr(uptr raw_istr) {
  delete (istring_t*)raw_istr;
}

ptr istr_to_str(uptr raw_istr) {
  auto istr = (istring_t*)raw_istr;
  auto ret = Smake_uninitialized_string(istr->size());
  int i = 0;
  for (const auto c : *istr) {
    Sstring_set(ret, i, c);
    i++;
  }
  return ret;
}

ptr istr_head(uptr raw_istr) {
  auto istr = (istring_t*)raw_istr;
  return Schar(istr->front());
}

uptr istr_tail(uptr raw_istr) {
  auto istr = (istring_t*)raw_istr;
  istring_t *ret = new istring_t;
  *ret = istr->drop(1);
  return (uptr)ret;
}

ptr istr_length(uptr raw_istr) {
  auto istr = (istring_t*)raw_istr;
  return Sunsigned(istr->size());
}

ptr istr_eql(uptr raw_fst, uptr raw_snd) {
  auto fst = (istring_t*)raw_fst;
  auto snd = (istring_t*)raw_snd;
  return Sboolean(*snd == *fst);
}

uptr istr_concat(uptr raw_fst, uptr raw_snd) {
  auto fst = (istring_t*)raw_fst;
  auto snd = (istring_t*)raw_snd;
  istring_t *ret = new istring_t;
  *ret = (*fst) + (*snd);
  return (uptr)ret;
}
