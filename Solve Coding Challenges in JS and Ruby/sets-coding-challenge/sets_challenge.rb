# Challenge description
# Sets

# These are the important methods a Set, in JavaScript, supports:

#     add(item) - Adds an item to the Set.
#     delete(item) - Removes an item from the Set.
#     has(item) - Returns true if the item is in the Set, and false otherwise.

# Purpose of Sets

# The Set is useful when you want to check if items are in a collection but there's no specific order that you care about. For example, let's say you're given a raw list of numbers and need to find the numbers that appear more than once. What Algorithm could you use to find them?
# Solution

# Create a Set for holding the items. For each item, check if it's already in the Set. If it is, you've found a duplicate. Otherwise add the item to the Set.
# Standard Sets

# Since ES5 JavaScript includes a Set class. Documentation: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set
# Challenge

# A duplicate is a number whose value appeared earlier in the list. Given a list of numbers, return an array with all the duplicates in the order that they appear. (Duplicates that appear multiple times should be printed multiple times). Use Ruby's Set class to solve the challenge.
# Example

# const arr = [1, 2, 3, 1, 5, 6, 7, 8, 5, 2]

# console.log(find_duplicates(arr))
# // => [1, 5, 2]

require 'set'

def find_duplicates(arr)
    seen = Set.new
    duplicates = []

    arr.each do |num|
        if seen.include?(num)
            duplicates << num
        else 
            seen.add(num)
        end
    end
    duplicates
end

# Test cases
arr1 = [1, 2, 3, 1, 5, 6, 7, 8, 5, 2]
puts "Test 1: #{find_duplicates(arr1)}" # => [1, 5, 2]

arr2 = [3, 501, 17, 23, -43, 67, 5, 888, -402, 235, 77, 99, 311, 1, -43]
puts "Test 2: #{find_duplicates(arr2)}" # => [-43]

# Additional test cases
puts "Test 3: #{find_duplicates([1, 1, 1, 1])}" # => [1, 1, 1]
puts "Test 4: #{find_duplicates([1, 2, 3])}" # => []
puts "Test 5: #{find_duplicates([])}" # => []
puts "Test 6: #{find_duplicates([5, 5, 3, 3, 2, 2, 1])}" # => [5, 3, 2]