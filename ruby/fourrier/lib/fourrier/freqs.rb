module Fourrier
  module Private
    class Freqs
      def initialize(harmonics)
        @p = Fourrier::CInterface.allocFrequencies(harmonics)
      end
      
      def uninitialize
        
      end
      
      def ptr
        @p
      end
      
      def getHarmonics
        Fourrier::CInterface.getHarmonics(@p)
      end
      
      def getFrequency(h)
        Fourrier::CInterface.getFrequency(@p, h)
      end
      
      def getFrequencies
        freqs = []
        getHarmonics.times do |i|
          freqs << getFrequency(i)
        end
        freqs
      end
      
      def setFrequency(value, h)
        Fourrier::CInterface.setFrequency(@p, value, h)
      end
      
      def getAmplitude(h)
        Fourrier::CInterface.getAmplitude(@p, h)
      end
      
      def getAmplitudes
        amps = []
        getHarmonics.times do |i|
          amps << getAmplitude(i)
        end
        amps
      end
      
      def setAmplitude(value, h)
        Fourrier::CInterface.setAmplitude(@p, value, h)
      end
      
      def getPhase(h)
        Fourrier::CInterface.getPhase(@p, h)
      end
      
      def getPhases
        phases = []
        getHarmonics.times do |i|
          phases << getPhase(i)
        end
        phases
      end
      
      def setPhase(value, h)
        Fourrier::CInterface.setPhase(@p, value, h)
      end
      
    end # class Freqs
  end #module Private
end # module Fourrier