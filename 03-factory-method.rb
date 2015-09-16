# 03. FACTORY METHOD

# Creator
class VehicleFactory
  def create(options)
    type = options.fetch(:type)
    color = options.fetch(:color)

    if type == 'car'
      Car.new(color)
    elsif type == 'motorbike'
      Motorbike.new(color)
    else
      raise ArgumentError.new("The type #{ type } is not valid")
    end
  end
end

# Concrete creator
class BlueVehicleFactory < VehicleFactory
  def create(options)

    # This factory only creates blue vehicles
    super(options.merge(color: 'blue'))
  end
end

# Product
class Vehicle
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

# Concrete products
class Car < Vehicle
  def to_s
    "I'm a #{ self.color } car"
  end
end

class Motorbike < Vehicle
  def to_s
    "I'm a #{ self.color } motorbike"
  end
end

# Client using the Creator
factory = VehicleFactory.new
blue_car = factory.create(type: 'car', color: 'blue')
pink_car = factory.create(type: 'car', color: 'pink')
pink_motorbike = factory.create(type: 'motorbike', color: 'pink')

puts blue_car
puts pink_car
puts pink_motorbike

# Client using a Contrete creator
factory = BlueVehicleFactory.new
blue_car = factory.create(type: 'car', color: 'blue')
pink_car = factory.create(type: 'car', color: 'pink')
pink_motorbike = factory.create(type: 'motorbike', color: 'pink')

puts blue_car
puts pink_car
puts pink_motorbike
