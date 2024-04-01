# Program to implement Linear Search in Ruby

# Function that implements Linear Search logic

def linear_search(arr, element)
arr.each_with_index do |val, index|
if val == element
    return index
end
end
# Return -1 if the element is not found
return -1
end

# Test the linear_search function
arr = [1, 3, 5, 56, 4, 3, 23, 5, 4, 5632, 56, 34]
element = 23
# Search for the element in the array
search_index = linear_search(arr, element)
# Display the search result
if search_index != -1
puts "Element #{element} found at index #{search_index}"
else
puts "Element not found in the array"
end