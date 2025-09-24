# Complete map operations in Ruby using Hash

# Create a new hash (Ruby's equivalent of Map)
my_map = {}

# []= : Adds or updates an element
my_map["name"] = "Alice"
my_map["age"] = 30
my_map["city"] = "New York"

puts "After setting values: #{my_map}" 

# [] : Returns the value for a key
puts "Get Name: #{my_map["name"]}" 
puts "Get Age: #{my_map["age"]}"
puts "Get City: #{my_map["city"]}"

# has_key? : Checks if a key exists
puts "Has key 'name'? #{my_map.has_key?("name")}" 
puts "Has key 'country'? #{my_map.has_key?("country")}"
puts "Has key 'age'? #{my_map.has_key?("age")}"

# size : Returns the number of elements
puts "Size of map: #{my_map.size}"

# delete : Removes an element by key
my_map["To Delete"] = "This will be deleted"
puts "Before deletion: #{my_map}"
my_map.delete("To Delete")
puts "After deletion: #{my_map}"

# keys : Returns an array of keys
puts "Map keys: #{my_map.keys}"
# OR
my_map.keys.each { |key| puts "Key: #{key}"}

# values : Returns an array of values
puts "Map values: #{my_map.values}"
# OR
my_map.values.each { |value| puts "Value: #{value}"}

# each_pair : Iterates over [key, value] pairs
puts "Iterating over key-value pairs:"
my_map.each_pair do |key,value|
    puts "Key: #{key} => Value: #{value}"
end

# each : Iterates over each element (same as each_pair)
puts "Map forEach:"
my_map.each { |key, value| puts "#{key}: #{value}" }

# Create Hash from Array of pairs
puts "\nCREATE MAP FROM ARRAY:"
array = [["a", 1], ["b", 2], ["c", 3]]
map_from_array = Hash[array]
puts "Map from array: #{map_from_array}"

# Convert Hash to Array
puts "\nCONVERT MAP TO ARRAY:"
array_from_map = my_map.to_a
puts "Array from map: #{array_from_map}"

# clear : Removes all elements
my_map.clear
puts "After clear, size: #{my_map.size}" # 0
puts "\nALL MAP METHODS DEMONSTRATED!"