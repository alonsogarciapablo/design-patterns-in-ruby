# 04. Prototype

# Prototype

class Prototype
  def klone
    raise NotImplementedError
  end
end

# Concrete Prototypes

class Wadus1Prototype < Prototype
  def klone
    self.clone
  end
end

class Wadus2Prototype < Prototype
  def klone
    self.clone
  end
end

# Factory

class WadusFactory
  def initialize(prototype)
    @prototype = prototype
  end

  def create_wadus
    @prototype.klone
  end
end

# Client

prototype = Wadus1Prototype.new
factory = WadusFactory.new(prototype)
wadus = factory.create_wadus
puts wadus.class

prototype = Wadus2Prototype.new
factory = WadusFactory.new(prototype)
wadus = factory.create_wadus
puts wadus.class

