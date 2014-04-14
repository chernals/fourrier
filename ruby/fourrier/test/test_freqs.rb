require 'test/unit'
require 'fourrier'

class FiltersTest < Test::Unit::TestCase
  @@harmonics = 3
  @@amplitude = 3.1415 # Whatever amplitude
  @@phase = 45.45 # Whatever phase
  @@frequency = 0.2512345 # Whatever frequency

  def test_harmonics
    f = Fourrier::Private::Freqs.new(@@harmonics)
    assert_equal @@harmonics, f.getHarmonics
  end
  
  def test_amplitude
    f = Fourrier::Private::Freqs.new(@@harmonics)
    @@harmonics.times do |i|
      f.setAmplitude(@@amplitude, i)
      assert_equal f.getAmplitude(i), @@amplitude
    end
    assert_equal f.getAmplitudes, [@@amplitude, @@amplitude, @@amplitude]
  end
  
  def test_phase
    f = Fourrier::Private::Freqs.new(@@harmonics)
    @@harmonics.times do |i|
      f.setPhase(@@phase, i)
      assert_equal f.getPhase(i), @@phase
    end
    assert_equal f.getPhases, [@@phase, @@phase, @@phase]
  end
  
  def test_frequency
    f = Fourrier::Private::Freqs.new(@@harmonics)
    @@harmonics.times do |i|
      f.setFrequency(@@frequency, i)
      assert_equal f.getFrequency(i), @@frequency
    end
    assert_equal f.getFrequencies, [@@frequency, @@frequency, @@frequency]
  end
  
end
