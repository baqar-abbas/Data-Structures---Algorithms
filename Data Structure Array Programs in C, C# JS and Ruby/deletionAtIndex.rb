# Program to delete an element at a specific index in an array

def display(array) 
    # Array traversal
    # Loop through the array elements and print them
    puts "Array Elements:"
    array.each_with_index do |val, index|
        puts "The element at index #{index}: #{val}"
    end
end

def deleteAtIndex(array, size, index)
    # Check if the index is valid
    if index < 0 || index >= size
        puts "Invalid index. Deletion failed."
        return array
    end

    # Shift the elements to the left
    index.upto(size-1) do |i|
        array[i] = array[i+1]
    end

      # Remove the last element as it's duplicated after shifting
  array.pop

  puts "Element at index #{index} has been deleted successfully."
  array
end

# Main Program
# Initialize the array
array = [7, 8, 12, 27, 88]
size = array.size
index_to_delete = 2

# Display the original array
puts "Original Array"
display(array)

# Deleting element at index 2
puts "Deleting element at index #{index_to_delete}"
array = deleteAtIndex(array, size, index_to_delete)

puts "\nArray after deletion:"
display(array)

# Output
# Original Array
# Array Elements:
# The element at index 0: 7
# The element at index 1: 8
# The element at index 2: 12
# The element at index 3: 27
# The element at index 4: 88
# Deleting element at index 2
# Element at index 2 has been deleted successfully.

# Array after deletion:
# Array Elements:
# The element at index 0: 7
# The element at index 1: 8
# The element at index 2: 27
# The element at index 3: 88