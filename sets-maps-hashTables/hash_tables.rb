class HashTable 
    attr_reader :size

    def initialize(size = 53)
        @size = size
        @key_map = Array.new(size)
    end

# Hash function - converts key to index
  def _hash(key)
    total = 0
    prime = 31
    key.to_s[0, 100].each_char do |char|
      value = char.ord - 96 # a=1, b=2, c=3, ...
      total = (total * prime + value) % @size
    end
    total
  end

   # Set key-value pair (handles collisions with separate chaining)
def set(key, value)
    index = _hash(key)

    @key_map[index] ||= []

    # Check if key already exists, update if it does
    @key_map[index].each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end
     @key_map[index] << [key, value]
end

# Get value by key
  def get(key)
    index = _hash(key)

    if @key_map[index]
      @key_map[index].each do |pair|
        return pair[1] if pair[0] == key
      end
    end
    nil
  end

  # Get all keys
  def keys
    key_arr = []

    @key_map.each do |bucket|
      if bucket
        bucket.each do |pair|
          key_arr << pair[0] unless key_arr.include?(pair[0])
        end
      end
    end

    key_arr
  end

  # Get all values
  def values
    values_arr = []

    @key_map.each do |bucket|
      if bucket
        bucket.each do |pair|
          values_arr << pair[1] unless values_arr.include?(pair[1])
        end
      end
    end

    values_arr
  end

   # Check if key exists
  def has?(key)
    !get(key).nil?
  end

  # Remove key-value pair
  def delete(key)
    index = _hash(key)

    if @key_map[index]
      @key_map[index].each_with_index do |pair, i|
        if pair[0] == key
          @key_map[index].delete_at(i)
          return true
        end
      end
    end
    false
  end

   # Get load factor (measure of how full the hash table is)
  def load_factor
    item_count = 0

    @key_map.each do |bucket|
      item_count += bucket.length if bucket
    end
    
    (item_count.to_f / @size).round(2)
  end

  # Display the entire hash table
  def display
    puts "\n HASH TABLE STRUCTURE:"
    puts "=" * 40

    @key_map.each_with_index do |bucket, index|
      if bucket && !bucket.empty?
        puts "Index #{index}: #{bucket}"
      end
    end

    puts "Load Factor: #{load_factor}"
    puts "=" * 40
  end

# Ruby-style alias methods
  alias :[] :get
  alias :[]= :set
  alias :include? :has?
end

def test_hash_table
  puts "TESTING HASH TABLE IMPLEMENTATION\n"

  ht = HashTable.new(7) # Small size to force collisions

  # Test 1: Basic Set and Get
  puts "1. BASIC SET/GET:"
  ht.set("name", "Alice")
  ht.set("age", 30)
  puts "get('name'): #{ht.get("name")}" # Expected: 'Alice'
  puts "get('age'): #{ht.get("age")}" # Expected: 30
  puts "get('invalid'): #{ht.get("invalid")}" # Expected: nil

  # Test 2: Update Existing Key
  puts "\n2. UPDATE EXISTING KEY:"
  ht.set("name", "Bob")
  puts "After update - get('name'): #{ht.get("name")}" # Expected: 'Bob'

  # Test 3: Collision Handling
  puts "\n3. COLLISION HANDLING:"
  ht.set("cat", "animal1")
  ht.set("car", "animal2") # Might collide with 'cat'
  ht.set("dog", "animal3")
  puts "get('cat'): #{ht.get("cat")}"
  puts "get('car'): #{ht.get("car")}"
  puts "get('dog'): #{ht.get("dog")}"

  # Test 4: Has Method
  puts "\n4. HAS METHOD:"
  puts "has?('name'): #{ht.has?("name")}" # Expected: true
  puts "has?('invalid'): #{ht.has?("invalid")}" # Expected: false

  # Test 5: Keys Method
  puts "\n5. KEYS METHOD:"
  puts "Keys: #{ht.keys}" # Should include all keys

  # Test 6: Values Method
  puts "\n6. VALUES METHOD:"
  puts "Values: #{ht.values}" # Should include all values

  # Test 7: Delete Method
  puts "\n7. DELETE METHOD:"
  puts "Before delete - has?('age'): #{ht.has?("age")}"
  ht.delete("age")
  puts "After delete - has?('age'): #{ht.has?("age")}"
  puts "get('age'): #{ht.get("age")}" # Expected: nil

  # Test 8: Load Factor
  puts "\n8. LOAD FACTOR:"
  puts "Load Factor: #{ht.load_factor}"

  # Test 9: Display Structure
  puts "\n9. DISPLAY STRUCTURE:"
  ht.display

  # Test 10: Ruby-style syntax
  puts "\n10. RUBY-STYLE SYNTAX:"
  ht["email"] = "test@ruby.com"
  puts "ht['email']: #{ht["email"]}"
  puts "ht.include?('email'): #{ht.include?("email")}"

  # Test 11: Special Characters
  puts "\n11. SPECIAL CHARACTERS:"
  ht.set("phone-number", "123-456-7890")
  ht.set("salary$", 50000)
  puts "Special keys - get('phone-number'): #{ht.get("phone-number")}"
  puts "Special keys - get('salary$'): #{ht.get("salary$")}"

  puts "\n ALL TESTS COMPLETED!"
end

# Run the tests
test_hash_table

# Additional demonstration of Ruby features
puts "\n" + "="*50
puts "ADDITIONAL RUBY FEATURES DEMONSTRATION"
puts "="*50

# Demonstrate Ruby's built-in Hash vs custom HashTable
puts "\nRuby Built-in Hash vs Custom HashTable:"

# Built-in Ruby Hash
ruby_hash = { "name" => "Alice", "age" => 30 }
puts "Built-in Hash: #{ruby_hash}"

# Custom HashTable
custom_hash = HashTable.new
custom_hash.set("name", "Alice")
custom_hash.set("age", 30)
puts "Custom HashTable keys: #{custom_hash.keys}"
puts "Custom HashTable values: #{custom_hash.values}"

# Demonstrate enumeration
puts "\nIterating through Custom HashTable:"
custom_hash.keys.each do |key|
  puts "Key: #{key}, Value: #{custom_hash.get(key)}"
end

# Output 

# TESTING HASH TABLE IMPLEMENTATION
# 1. BASIC SET/GET:
# get('name'): Alice
# get('age'): 30
# get('invalid'):

# 2. UPDATE EXISTING KEY:
# After update - get('name'): Bob

# 3. COLLISION HANDLING:
# get('cat'): animal1
# get('car'): animal2
# get('dog'): animal3

# 4. HAS METHOD:
# has?('name'): true
# has?('invalid'): false

# 5. KEYS METHOD:
# Keys: ["age", "cat", "name", "dog", "car"]

# 6. VALUES METHOD:
# Values: [30, "animal1", "Bob", "animal3", "animal2"]

# 7. DELETE METHOD:
# Before delete - has?('age'): true
# After delete - has?('age'): false
# get('age'):

# 8. LOAD FACTOR:
# Load Factor: 0.57

# 9. DISPLAY STRUCTURE:

#  HASH TABLE STRUCTURE:
# ========================================
# Index 1: [["cat", "animal1"]]
# Index 4: [["name", "Bob"], ["dog", "animal3"]]
# Index 6: [["car", "animal2"]]
# Load Factor: 0.57
# ========================================

# 10. RUBY-STYLE SYNTAX:
# ht['email']: test@ruby.com
# ht.include?('email'): true

# 11. SPECIAL CHARACTERS:
# Special keys - get('phone-number'): 123-456-7890
# Special keys - get('salary$'): 50000

#  ALL TESTS COMPLETED!

# ==================================================
# ADDITIONAL RUBY FEATURES DEMONSTRATION
# ==================================================

# Ruby Built-in Hash vs Custom HashTable:
# Built-in Hash: {"name"=>"Alice", "age"=>30}
# Custom HashTable keys: ["name", "age"]
# Custom HashTable values: ["Alice", 30]

# Iterating through Custom HashTable:
# Key: name, Value: Alice
# Key: age, Value: 30