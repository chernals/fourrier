require_relative '../../../ruby/fourrier/lib/fourrier.rb'

# Read in an example signal
signal = []
File.open("signal.dat", 'r').each_line {|line| signal << line.to_f}



Fourrier::Frequency.new(signal, 2)