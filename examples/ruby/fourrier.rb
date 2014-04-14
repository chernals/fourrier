require 'ffi'

module LibC
  extend FFI::Library
  ffi_lib FFI::Library::LIBC

  # Memory allocators
  attach_function :malloc, [:size_t], :pointer
  attach_function :calloc, [:size_t], :pointer
  attach_function :valloc, [:size_t], :pointer
  attach_function :realloc, [:pointer, :size_t], :pointer
  attach_function :free, [:pointer], :void

  # Memory movers
  attach_function :memcpy, [:pointer, :pointer, :size_t], :pointer
  attach_function :bcopy, [:pointer, :pointer, :size_t], :void

end # module LibC

module Fourrier
  extend FFI::Library
  ffi_lib "../../lib/fourrier.so"
  attach_function :Hanning_r, [ :pointer, :uint, :pointer], :void

end

signal = []
File.open("signal.dat", 'r').each_line {|line| signal << line.to_f}
_signal = LibC.malloc(8 * signal.size)
_signal.write_array_of_double signal

_windowed = LibC.malloc(8 * signal.size)
Fourrier.Hanning_r(_signal, signal.size, _windowed)
windowed = _windowed.get_array_of_float64(0,signal.size)


#Hello.puts("Hello, World")
