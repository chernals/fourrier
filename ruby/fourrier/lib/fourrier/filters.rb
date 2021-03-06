module Fourrier
  module Filters
    def self.Hanning(signal)
      # Create C containers
      _signal = LibC.malloc(8 * signal.size)
      _window = LibC.malloc(8 * signal.size)
      
      # Obtain a window of the correct size
      _signal.write_array_of_double Array.new(signal.size) {1}
      Fourrier::CInterface.Hanning_r(_signal, signal.size, _window)
      window = _window.get_array_of_float64(0,signal.size)
      # Multiply the actual signal by the window
      windowed = Array.new(signal.size) { 0 }
      signal.size.times do |i|
        windowed[i] = signal[i] * window[i]
      end
      windowed
    end
  end # module Filters
end # module Fourrier