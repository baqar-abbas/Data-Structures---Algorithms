# Complete set operations in Ruby

require 'set'

# Create some sets to work with
set_a = Set.new([1, 2, 3, 4, 5])
set_b = Set.new([4, 5, 6, 7, 8])
set_c = Set.new([1, 2, 3])

# 1. BASIC OPERATIONS
puts "=== BASIC SET OPERATIONS ==="
puts "Set A: #{set_a.to_a}"
puts "Set B: #{set_b.to_a}"
puts "Set C: #{set_c.to_a}"

# Add and remove elements
set_a.add(6)
puts "After adding 6 to Set A: #{set_a.to_a}"

set_a.delete(2)
puts "After removing 2 from Set A: #{set_a.to_a}"

puts "Set A has 3: #{set_a.include?(3)}"
puts "Set A has size: #{set_a.size}"

# 2. ALL SET METHODS DEMONSTRATION
puts "\n=== ALL SET METHODS ==="

# Ruby Sets don't have entries() like JavaScript, but we can simulate
puts "each method (similar to entries):"
set_a.each do |element|
    puts "Element: #{element}"
end

# Ruby Sets don't have separate keys() and values() since they're value-based
puts "each method (acts as both keys and values):"
set_a.each do |value|
  puts "  Value: #{value}"
end

# each method is similar to forEach
puts "each method (similar to forEach):"
set_a.each do |value|
  puts "  Value from each: #{value}"
end

# 3. SET PROPERTIES
puts "\n=== SET PROPERTIES ==="
puts "Set A size property: #{set_a.size}"
puts "Set B size property: #{set_b.size}"
puts "Set C size property: #{set_c.size}"

# 4. SET THEORY OPERATIONS
puts "\n=== SET THEORY OPERATIONS ==="

# Union: A ∪ B (elements in A OR B)
union_set = set_a | set_b
puts "Union of Set A and Set B: #{union_set.to_a}"

# Intersection: A ∩ B (elements in A AND B)
intersection = set_a & set_b
puts "Intersection of A and B (A ∩ B): #{intersection.to_a}"

# Difference: A - B (elements in A but NOT in B)
difference = set_a - set_b
puts "Difference A - B: #{difference.to_a}"

# Symmetric Difference: A Δ B (elements in A OR B but NOT both)
symmetric_difference = (set_a - set_b) | (set_b - set_a)
puts "Symmetric Difference A Δ B: #{symmetric_difference.to_a}"

# 5. CLEAR METHOD
puts "\n=== CLEAR METHOD ==="
temp_set = Set.new([10, 20, 30])
puts "Temp set before clear: #{temp_set.to_a}"
temp_set.clear
puts "Temp set after clear: #{temp_set.to_a}"

# 6. SET ITERATION
puts "\n=== SET ITERATION ==="
puts "Iterating through set A:"
set_a.each do |item|
  puts " -> #{item}"
end

# Convert to array and use array methods
doubled = set_a.map { |x| x * 2 }
puts "Doubled values of A: #{doubled.to_a}"