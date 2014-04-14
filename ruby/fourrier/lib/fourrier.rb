require 'ffi'
require 'fourrier/libc'

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
end


signal = []
File.open("signal.dat", 'r').each_line {|line| signal << line.to_f}
puts Fourrier::Filters::Hanning(signal)

f = Fourrier::Freqs.new(10)
f.setAmplitude(1.1,2)
puts f.getAmplitude(2)