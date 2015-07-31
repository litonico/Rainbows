# TODO(Lito): respect min and max
# (By wrapping each fn?)

class Rainbow
  def greyscale degree
    brightness_unit = degree/360.0
    brightness = (brightness_unit*255.0).floor # Scale back to RGB
    [brightness, brightness, brightness]
  end

  ##
  # The full RGB spectrum
  #
  def hue degree
    main_color = 1 * 255 # Let chroma (saturation * brightness) always == 1
    second_strongest_color = ((1 - (degree/60.0 % 2 - 1).abs) * 255).floor

    case degree
    when 0..60
      [main_color, second_strongest_color, 0]
    when 61..120
      [second_strongest_color, main_color, 0]
    when 121..180
      [0, main_color, second_strongest_color]
    when 181..240
      [0, second_strongest_color, main_color]
    when 241..300
      [second_strongest_color, 0, main_color]
    when 301..360
      [main_color, 0, second_strongest_color]
    end
  end

  ##
  # Spectrum with linearly increaing brightness
  #
  def cubehelix degree
  end

  ##
  # Spectrum with constant brightness
  #
  def perceptual degree
  end

  ##
  #
  #
  def jet degree # NOTE(Lito): Do we really need this?
  end

  ##
  #
  def parula degree
  end

  ##
  # Blue-green-yellow-red spectrum for for simulations
  #
  def nico degree
  end
end
