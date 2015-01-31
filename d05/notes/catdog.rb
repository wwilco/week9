class animal
  attr_accessor :name, :owner
  def initialize(name, owner, type)
    @name = name
    @owner = owner
  end
end

a = animal.new("giraffe", "peach")
puts a.name

class dog < animal
  def initialize(name, owner)
    super(name, owner, "dog")
  def bark
    puts "bark"
  end
end

class cat < animal
  def meow
    puts "meow"
  end
end

d = dog.new("waffles", "peach")
puts d.name
puts d.owner
d.name = "rex"
puts d.name
d.bark

c = cat.new("felix", "peach")
c.meow # wont work
