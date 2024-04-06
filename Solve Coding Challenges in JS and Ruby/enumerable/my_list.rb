require_relative 'my_enumerable'

class MyList

include MyEnumerable

def initialize(*elements)
   @list = elements
end

def each(&block)
  @list.each(&block)
end

end

# Create our list
list = MyList.new(1,2,3,4)

# Test the all? method
puts(list.all? { |e| e < 5 }) # Output: true
puts(list.all? { |e| e > 5 }) # Output: false

# Test the any? method
puts(list.any? { |e| e == 2 }) # Output: true
puts(list.any? { |e| e == 5 }) # Output: false

# Test the filter method
puts(list.filter(&:even?)) # Output: [2, 4]