require 'ffi'
require 'fourrier/libc'
require 'fourrier/filters'
require 'fourrier/freqs'

module Fourrier
  extend FFI::Library
  ffi_lib "../../lib/fourrier.so"
  
  # Filters
  attach_function :Hanning_r, [ :pointer, :uint, :pointer], :void
  attach_function :Hanning_c, [ :pointer, :uint, :pointer], :void
  
  # Freqs
  attach_function :allocFrequencies, [ :uint ], :pointer
  attach_function :getHarmonics, [ :pointer ], :uint
  attach_function :getFrequency, [ :pointer, :uint ], :double
  attach_function :getAmplitude, [ :pointer, :uint ], :double
  attach_function :setAmplitude, [ :pointer, :double, :uint ], :void
  attach_function :getPhase, [ :pointer, :uint ], :double
  attach_function :setPhase, [ :pointer, :double, :uint], :void
  
  # Frequency
  
end
