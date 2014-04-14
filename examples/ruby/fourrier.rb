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
  
  # Freqs
  attach_function :allocFrequencies, [ :uint ], :pointer
  attach_function :getHarmonics, [ :pointer ], :uint
  attach_function :getFrequency, [ :pointer, :uint ], :double
  attach_function :getAmplitude, [ :pointer, :uint ], :double
  attach_function :setAmplitude, [ :pointer, :double, :uint ], :void
  attach_function :getPhase, [ :pointer, :uint ], :double
  attach_function :setPhase, [ :pointer, :double, :uint], :void
    
  class Freqs
    def initialize(harmonics)
      @p = Fourrier.allocFrequencies(harmonics)
    end
    
    def uninitialize
      
    end
    
    def getHarmonics
      Fourrier.getHarmonics(@p)
    end
    
    def getAmplitude(h)
      Fourrier.getAmplitude(@p, h)
    end
    
    def setAmplitude(value, h)
      Fourrier.setAmplitude(@p, value, h)
    end
    
    def getPhase(h)
      Fourrier.getPhase(@p, h)
    end
    
    def setPhase(value, h)
      Fourrier.setPhase(@p, value, h)
    end
    
  end # class Freqs

end


signal = []
File.open("signal.dat", 'r').each_line {|line| signal << line.to_f}
_signal = LibC.malloc(8 * signal.size)
_signal.write_array_of_double signal

_windowed = LibC.malloc(8 * signal.size)
Fourrier.Hanning_r(_signal, signal.size, _windowed)
windowed = _windowed.get_array_of_float64(0,signal.size)

f = Fourrier::Freqs.new(10)
f.setAmplitude(1.1,2)
puts f.getAmplitude(2)