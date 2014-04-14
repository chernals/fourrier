module Fourrier
  class Freqs
    def initialize(harmonics)
      @p = Fourrier.allocFrequencies(harmonics)
    end
    
    def uninitialize
      
    end
    
    def ptr
      @p
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
end # module Fourrier