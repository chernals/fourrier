require 'test/unit'
require 'fourrier'

class FiltersTest < Test::Unit::TestCase
  @@eps = 1.0E-10
  def test_hanning_filter_real
    signal = []
    File.open("test/data/signal.dat", 'r').each_line {|line| signal << line.to_f}
    filtered = []
    File.open("test/data/filtered.dat", 'r').each_line {|line| filtered << line.to_f}
    assert_equal signal.size, filtered.size
    result = Fourrier::Filters::Hanning(signal)
    assert_equal result.size, signal.size
    signal.size.times do |i|
      assert_operator filtered[i]-result[i], :<, @@eps
    end
  end
end