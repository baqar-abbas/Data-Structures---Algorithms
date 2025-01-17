# Array ADT implementation in Ruby

# Declare a Class for implementing array ADT
class MyArray
    attr_accessor :total_size, :used_size, :data

# Method to initialize the array with total size and used size
def initialize(total_size, used_size)
  @total_size = total_size
  @used_size = used_size
  @data = Array.new(total_size, 0)
  puts "Array has been created"
end

# Method to show the array elements
def show
     @data.first(@used_size).each_with_index do |element, index|
        puts "Element at index #{index} is #{element}"
    end
end

# Method to insert an element in the array at a given index
def insert(index, value)
    if index < @used_size 
        @data[index] = value
    else 
        puts "Index is greater than usable index"
    end
end

end

puts "Creating an array"
# Create an array of size 10 and used size 4
# Create an object of MyArray class
my_array = MyArray.new(10, 4)

puts "Inserting elements in the array"
# Insert elements in the array at index 0, 1, 2, 3
my_array.insert(0, 10)
my_array.insert(1, 20)
my_array.insert(2, 30)
my_array.insert(3, 40)

puts "Showing the array elements"
# Show the array elements
my_array.show