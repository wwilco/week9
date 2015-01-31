class Food
  # attr_accessor :name, :taste
  #
  # def initialize(name, tatse)
  #   @name = name
  #   @taste = taste
  def eat
    puts "eating now..."
  end
end

class Pizza < Food
  def taste
    puts "cowabunga"
  end
end



class Asparagus < Food
  def taste
    puts "yuck!"
  end
end

p = Pizza.new
puts p.taste

a = Asparagus.new
puts a.taste
