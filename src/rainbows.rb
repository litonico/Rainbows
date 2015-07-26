class Rainbow
  def greyscale degree
    brightness_unit = degree/360.0
    brightness = brightness_unit*255.0 # Scale back to RGB
    [brightness, brightness, brightness]
  end

  def hue
  end

  def cubehelix
  end

  def perceptual
  end

  def jet
  end
end
