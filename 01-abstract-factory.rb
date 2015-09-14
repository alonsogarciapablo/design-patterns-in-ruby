# ABSTRACT FACTORY

# Abstract factory
class FruitFactory
  def make_apple
    raise NotImplementedError
  end

  def make_orange
    raise NotImplementedError
  end
end

# Concrete factory
class BlueFruitFactory < FruitFactory
  def make_apple
    return new BlueApple
  end

  def make_orange
    return new BlueOrange
  end
end

# Concrete factory
class GreenFruitFactory < FruitFactory
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
#   GreenFruitFactory
# else
#   BlueFruitFactory
# end
#
# apple = factory.create_apple
# orange = factory.create_orange
#
