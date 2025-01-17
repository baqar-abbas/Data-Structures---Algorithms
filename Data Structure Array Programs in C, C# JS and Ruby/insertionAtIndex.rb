# Program to insert an element at a specific index in an array

def display(arr, size)
# Array traversal
# Loop through the array elements and print them
arr.first(size).each_with_index do |val, index|
    puts "The element at index #{index} is #{val}"
end
end

def insertAtIndex(arr, size, element, capacity, index)
 # Check if the array is full
    return -1 if size >= capacity

    #Shift the elements to the right
    size.downto(index+1) do |i|
        arr[i] = arr[i-1]
    end

    # Insert the element at the specified index
    arr[index] = element
    puts "Element inserted successfully"
    return 1

end

def main
# Array declaration
arr = [7, 8, 12, 27, 88]
size = arr.length
capacity = 100
index = 3
element = 45

# Display the original array
puts "Original Array"
display(arr, size)

# Inserting element at index 3
puts "Inserting element #{element} at index #{index}"
insertAtIndex(arr, size, element, capacity, index)
size += 1;

# Display the array after insertion
puts "Array after insertion"
display(arr, size)
end

main()

