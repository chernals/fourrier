module Fourrier
  class Frequency
    def initialize(signal, harmonics)
      _signal = LibC.malloc(8 * signal.size)
      _signal.write_array_of_double(signal)
      @freqs = Fourrier::Private::Freqs.new(harmonics)
      Fourrier.frequencies(_signal, signal.size, @freqs.ptr , true, true)
      puts @freqs.getHarmonics
  end
  
  def getAmplitudes()
    @freqs.getAmplitudes
  end
  
  def getAmplitudes()
    @freqs.getAmplitudes
  end
    
  end # class Frequency
end # module Fourrier
