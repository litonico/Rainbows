def clamp d, min, max
  [[min, d].max, max].min
end

##
# Takes a value and a range,
# and scales that range to 0-360
def scale d, min, max
  range = max - min
  if range != 0
    scaled = (d.to_f / range) * 360
    return clamp(scaled, 0, 360).round
  else
    0
  end
end

class Rainbow
  attr_reader :cache

  def initialize
    @cache = self.cache_colors
  end

  def cache_colors
    # Saves all the colors to a hash
    cache = {}
    (0..360).each do |degree|
      cache[degree] = _color degree
    end
    cache
  end

  def color d, min=0, max=360
    scaled = scale d, min, max
    @cache[scaled]
  end

  def _color degree
    raise "Subclass responsibility"
  end
  private :_color

end

class Greyscale < Rainbow

  def initialize
    super
  end

  def _color degree
    brightness_unit = degree/360.0
    brightness = (brightness_unit*255.0).floor # Scale back to RGB

    [brightness, brightness, brightness]
  end
end

##
# The full RGB spectrum
#
class Hue < Rainbow

  def initialize
    super
  end

  def _color degree
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
end


##
# Spectrum with linearly increasing brightness
#
class Cubehelix < Rainbow

  def initialize
    super
  end

  def _color degree
    #angle = 2*Math::PI*(start/3.0+1.0+rotation*fract)
    [0, 0, 0]
  end
end

# TODO(Lito)
#   ##
#   # Spectrum with constant brightness
#   #
#   def perceptual degree
#   end
#
#   ##
#   # NOTE(Lito): Do we really need this?
#   #
#   def jet degree
#   end
#
#   ##
#   #
#   #
#   def parula degree
#   end
#
#   ##
#   # Blue-green-yellow-red spectrum for for simulations
#   #
#   def nico degree
#   end
# end
