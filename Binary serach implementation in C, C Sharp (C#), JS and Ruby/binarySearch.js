// Program to implement Binary Search in JavaScript

// The binarySearch function takes an array and an element as input and returns 
// the index of the element in the array. If the element is not found, it returns -1.
// The array must be sorted for binary search to work. The time complexity of binary 
// search is O(log n).

// Function to implement Binary Search
function binarySearch(arr, element) {
    // Set the low and high pointers for the array
    let low = 0;
    let high = arr.length - 1;
    // Loop until the low pointer is less than or equal to the high pointer
    while(low<=high) {
        // Calculate the mid pointer
        let mid = Math.floor((low + high) / 2);
        // If the element is found at the mid pointer, return the mid index
        if(arr[mid]===element) {
            return mid;
        }

        // If the element at mid pointer is less than the element to be searched for, 
        // search the right half of the array
        
        if(arr[mid]<element) {
            low = mid + 1;
        }

        // Else search the left half of the array if the element 
        // at mid pointer is greater than the element to be searched for.

        else {
            high = mid - 1;
        }
    }
    // If the element is not found in the array return -1
    return -1;
}

// Test the function for binary search
// Sorted Array for Binary Search

const arr = [1,3,5,56,64,73,123,225,444];
const element = 73;

// Search for the element in the array

const searchIndex = binarySearch(arr, element);
// Print the result
console.log(`The Element ${element} is found at index ${searchIndex}`);
// Output: The Element 73 is found at index 5