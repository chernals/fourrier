require_relative '../../../ruby/fourrier/lib/fourrier.rb'

# Read in an example signal
signal = []
File.open("signal.dat", 'r').each_line {|line| signal << line.to_f}

#puts Fourrier::Filters::Hanning(signal)

#f = Fourrier::Freqs.new(10)
#f.setAmplitude(1.1,2)
#puts f.getAmplitude(2)

Fourrier::Frequency.new(signal, 2)