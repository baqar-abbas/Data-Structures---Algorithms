# Program to implement Binary Search in Ruby

# Function to implement Binary Search
def binary_search(arr, element)
# Set the low and high pointers for the array
low = 0
high = arr.length - 1
# Loop until the low pointer is less than or equal to the high pointer
while low <= high
# Calculate the mid pointer
mid = (low + high) / 2
# If the element is found at the mid pointer, return the mid index
if arr[mid] == element
  return mid
end
 # If the element at mid pointer is less than the element to be searched for, 
    # search the right half of the array
 if arr[mid] < element
   low = mid + 1
 else
    # Else if the element at mid pointer is greater than the element to be searched for, 
    # search the left half of the array
    high = mid - 1 
end
end
# If the element is not found in the array return -1
return -1
end

# Test the function for binary search
# Sorted Array for Binary Search
arr = [1,3,5,56,64,73,123,225,444]
element = 73
# Search for the element in the array
search_index = binary_search(arr, element)
# If the element is found, print the index of the element
if search_index != -1
puts "Element #{element} found at index #{search_index}"
else
# Else print that the element is not found
puts "Element not found in the array"
end