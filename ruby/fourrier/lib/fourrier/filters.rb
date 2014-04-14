module Fourrier
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
end # module Fourrier