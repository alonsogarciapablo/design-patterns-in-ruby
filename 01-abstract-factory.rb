# 01. ABSTRACT FACTORY

# Abstract factory
class FruitsFactory
  def make_apple
    raise NotImplementedError
  end

  def make_orange
    raise NotImplementedError
  end
end

# Concrete factory
class BlueFruitsFactory < FruitsFactory
  def make_apple
    return new BlueApple
  end

  def make_orange
    return new BlueOrange
  end
end

# Concrete factory
class GreenFruitsFactory < FruitsFactory
  def make_apple
    return new GreenApple
  end

  def make_orange
    return new GreenOrange
  end
end

# Abstract product
class Apple
end

# Concrete product
class GreenApple < Apple
end

# Concrete product
class BlueApple < Apple
end

# Abstract product
class Orange
end

# Concrete product
class GreenOrange < Orange
end

# Concrete product
class BlueOrange < Orange
end

# Usage
#
# factory = if color == 'green'
#   GreenFruitsFactory
# elsif color == 'blue'
#   BlueFruitsFactory
# else
#   raise 'No factory for that color'
# end
#
# apple = factory.create_apple
# orange = factory.create_orange
# fruits = [apple, orange]
#
