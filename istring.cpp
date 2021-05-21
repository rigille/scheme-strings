#include <stdint.h>
#include "scheme.h"
#include <immer/flex_vector.hpp>

extern "C" {

int64_t foreign_double(int64_t n);
iptr string_test(ptr obj);
uptr rrb_string(ptr obj);

}

int64_t foreign_double(int64_t n) {
  return 2*n;
}

iptr string_test(ptr obj) {
  return Sstring_length(obj);
}

