require 'minitest/autorun'
require './src/rainbows'

class RainbowsTest < Minitest::Test
  def setup
    @rainbow = Rainbow.new
  end

  def test_greyscale
    # Black
    assert_equal @rainbow.greyscale(0), [0.0, 0.0, 0.0]
    # Mid-grey
    assert_equal [127.5, 127.5, 127.5], @rainbow.greyscale(180)
    # White
    assert_equal [255.0, 255.0, 255.0], @rainbow.greyscale(360)
  end

  def test_hue
  end

  def test_perceptual
  end

  def test_cubehelix
  end

  def test_jet
  end
end
