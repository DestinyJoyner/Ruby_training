# CLASSES -> first-class objects—each is an instance of class
# create new class:
class Name
  # some code describing the class behavior
end

# class methods -> self keyword -> references scope its in
class House
  # class variable -> begin with 2-@ -> @@
  # count class varibale to count how many instances of class have been created
  @@count = 0

  def self.count
    @@count
  end

  # need the self keyword for class methods -> method called on class itself and not instance -> arent passed down in instances
  def self.report_count
    # the count variable is accessing the self.count method not the variable
    "There are #{count}  instances of #{name} class"
  end

  # instance method, passed and available to instances
  def report_count
    # Instance methods can directly access class variables (@@variables) without needing a method to get to them
    "instance count: #{@@count}"
  end

  # define method called initialize -> constructor method in JS (called automatically when new instance created)
  def initialize(color, size, style)
    # instance variable -> begins with @
    @color = color
    @size = size
    @style = style
    # increment count here since initalize functions runs everytime new instance created
    @@count += 1
  end

  # how to access variable attributes in class-> same as:
  # def color
  # @color
  # end

  # attr_reader :color -> getter only
  # attr_writer :color   setter only
  attr_accessor :color, :style, :size # Creates both getter and setter so can update can list more than one
end

# create instance of class -> all objects -> everything in ruby is an object
# .name method is built in method for Classes not available on instances of class
house_1 = House.new('blue', 2, 'Victorian')

puts House.name
p house_1
puts house_1.style
# update attributes in class
house_1.color = 'red'
puts house_1.color
puts House.count
puts House.report_count
puts house_1.report_count
