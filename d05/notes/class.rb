sam = person.new("sam", 26)

class person
  def initialize(name, age) #name w/o @ is part of the object
    @name = name
    @age = age
  end
  def say_hello
    puts "Hi my name is #{@name}"
  end
end
#getters, allow you to acquire
def name
  return @name
end
def age
  return @age
end
#setters, allows you to change or set something
def name=(name)
  @name = name
end
