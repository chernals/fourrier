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
    
  class Filters
    def Filters.Hanning(signal)
      # Create C containers
      _signal = LibC.malloc(8 * signal.size)
      _window = LibC.malloc(8 * signal.size)
      
      # Obtain a window of the correct size
      _signal.write_array_of_double Array.new(signal.size) {1}
      Fourrier.Hanning_r(_signal, signal.size, _window)
      window = _window.get_array_of_float64(0,signal.size)

      # Multiply the actual signal by the window
      windowed = Array.new(signal.size) { 0 }
      signal.each_with_index { |v, i| windowed[i] = v*window[i] }
      windowed
    end
  end # class Filters
  
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
puts Fourrier::Filters::Hanning(signal)

f = Fourrier::Freqs.new(10)
f.setAmplitude(1.1,2)
puts f.getAmplitude(2)