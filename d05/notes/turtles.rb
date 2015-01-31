# leo = turtle.new("leo", "blue", "sword")
# donatello = turtle.new("donatello", "purple", "bo")
# raphael = turtle.new("raphael", "red", "sai")
# michaelangelo = turtle.new("michaelangelo", "orange", "nunchuck")
#
# class turtle
#   def initialize(name, color, weapon) #name w/o @ is part of the object
#     @name = name
#     @color = color
#     @weapon = weapon
#   end
#   def show_turtles
#     puts "#{@name} #{@color} #{@weapon}"
#   end
# end

#Ng's code

class Turtle
  attr_accessor :name, :color, :weapon

  def initialize(name, color, weapon)
    @name = name
    @color = color
    @weapon = weapon
  end

  def my_turtle
    puts "My name is #{@name} and my favorite color is #{@color} and I kick ass with #{@weapon}"
  end
end

Leonardo = Turtle.new("Leonardo", "Blue", "Katana")
Donatello = Turtle.new("Donatello", "Purple", "Bo")
Raphael = Turtle.new("Raphael", "Red", "Sai")
Michaelangelo = Turtle.new("Michaelangelo", "Orange", "Nunchucks")

puts Leonardo.my_turtle
