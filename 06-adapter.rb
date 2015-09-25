# 06. Adapter (using composition)

# Target
class Person
  attr_accessor :name, :lastname

  def initialize(name, lastname)
    @name = name
    @lastname = lastname
  end

  def say_hello
    puts "Hello, my name is #{ [self.name, self.lastname].join(' ') }"
  end
end

# Adaptee
class FrenchPerson
  attr_accessor :prenom, :nom, :age

  def initialize(prenom, nom, age)
    @prenom = prenom
    @nom = nom
    @age = age
  end

  def say_bon_jour
    puts "Bon jour, je m'appelle #{ [self.prenom, self.nom].join(' ') }"
  end
end

# Adapter (adapts FrenchPerson -> Person)
class FrenchPersonAdapter
  def initialize(frenchPerson)
    @frenchPerson = frenchPerson
  end

  def say_hello
    @frenchPerson.say_bon_jour
  end
end

# Client
french_person = FrenchPersonAdapter.new(FrenchPerson.new('Chuck', 'Norris', 35))
person = Person.new('Britney', 'Spears')
[french_person, person].each do |person|
  person.say_hello
end

