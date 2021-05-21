#include <stdint.h>
#include "scheme.h"

int64_t foreign_double(int64_t n) {
  return 2*n;
}

iptr string_test(ptr obj) {
  return Sstring_length(obj);
}
