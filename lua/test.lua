local ffi = require("ffi")
ffi.load('lib/fourrier.so')
ffi.cdef [[
  int printf(const char *fmt, ...);
  void Hanning_r(double*, const unsigned int, double*);
  ]]
ffi.C.printf("Hello %s!\n", "world")