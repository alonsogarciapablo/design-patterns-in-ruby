# 05. Singleton

# Singleton
class RandomNumber
  attr_reader :number

  def initialize
    @number = rand(100)
  end

  def self.get_instance
    @@instance ||= new
  end

  private_class_method :new
end

# Client
begin
  instance = RandomNumber.new
rescue NoMethodError
  puts "RandomNumber can't be instantiated, please use RandomNumber.get_instance"
end

random_number = RandomNumber.get_instance
puts "1. Random number: #{ random_number.number }"

random_number = RandomNumber.get_instance
puts "2. Random number: #{ random_number.number }"

random_number = RandomNumber.get_instance
puts "3. Random number: #{ random_number.number }"

