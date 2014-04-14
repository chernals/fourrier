require 'test/unit'
require 'fourrier'

class FiltersTest < Test::Unit::TestCase
  @@harmonics = 10
  @@amplitude = 3.1415 # Whatever amplitude
  @@phase = 45.45 # Whatever phase

  def test_harmonics
    f = Fourrier::Freqs.new(@@harmonics)
    assert_equal @@harmonics, f.getHarmonics
  end
  
  def test_amplitude
    f = Fourrier::Freqs.new(@@harmonics)
    @@harmonics.times do |i|
      f.setAmplitude(@@amplitude, i)
      assert_equal f.getAmplitude(i), @@amplitude
    end
  end
  
  def test_phase
    f = Fourrier::Freqs.new(@@harmonics)
    @@harmonics.times do |i|
      f.setPhase(@@phase, i)
      assert_equal f.getPhase(i), @@phase
    end
  end
 
end
