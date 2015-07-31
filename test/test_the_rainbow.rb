require 'minitest/autorun'
require './src/rainbows'

class RainbowsTest < Minitest::Test
  def setup
    @rainbow = Rainbow.new
  end

  def test_greyscale
    assert_equal [0, 0, 0], @rainbow.greyscale(0)         # Black
    assert_equal [127, 127, 127], @rainbow.greyscale(180) # Mid-grey
    assert_equal [255, 255, 255], @rainbow.greyscale(360) # White
  end

  # TODO(Lito): make spectra respect min and max, e.g.
  # def test_greyscale_start_and_end
  #   # Half a greyscale spectrum
  #   assert_equal [127, 127, 127], @rainbow.greyscale(0, 180, 360)
  # end

  def test_hue
    assert_equal [255, 0, 0], @rainbow.hue(0)     # Red
    assert_equal [255, 127, 0], @rainbow.hue(30)  # Orange
    assert_equal [255, 255, 0], @rainbow.hue(60)  # Yellow
    assert_equal [0, 255, 0], @rainbow.hue(120)   # Green
    assert_equal [0, 255, 255], @rainbow.hue(180) # Cyan
    assert_equal [0, 0, 255], @rainbow.hue(240)   # Blue
    assert_equal [255, 0, 255], @rainbow.hue(300) # Magenta
    assert_equal [255, 0, 0], @rainbow.hue(360)   # Red
  end

  def test_perceptual
  end

  def test_cubehelix
    # Cubehelix reference values from James Davenport's Python implementation
    reference_values = [[0.0, 0.0, 0.0],                              # 0
    [0.052086060929534689, 0.34174526961141383, 0.30658807547214501], # 90
    [0.65901854013946559, 0.46936557468373608, 0.24845035363356044],  # 180
    [0.78295958648052344, 0.69774239781785263, 0.96714049479106534],  # 270
    [1.0, 1.0, 1.0]]                                                  # 360
    # Move the colors from 0-1 scale to a 0-255 scale
    rgb_255_reference = reference_values.map do|rgb|
      rgb.map do |color|
        (color*255).floor
      end
    end

    assert_equal rgb_255_reference[0], @rainbow.cubehelix(0)
    assert_equal rgb_255_reference[1], @rainbow.cubehelix(90)
    assert_equal rgb_255_reference[2], @rainbow.cubehelix(180)
    assert_equal rgb_255_reference[3], @rainbow.cubehelix(270)
    assert_equal rgb_255_reference[4], @rainbow.cubehelix(360)

  end

  def test_jet
  end
end
