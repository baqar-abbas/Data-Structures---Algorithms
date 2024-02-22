// Program to implement Linear Search in JavaScript

// Function to implement Linear Search
function linearSearch(arr, element) {
    for (let i = 0; i <arr.length; i++) {
        if (arr[i] === element) {
            return i;
        }
    }
    // If the element is not found in the array return -1
    return -1;
}

// Test the function for linear search
const arr = [1, 3, 5, 56, 4, 3, 23, 5, 4, 5632, 56, 34];
const element = 54;
// Search for the element in the array
const searchIndex = linearSearch(arr, element);
// Print the result
console.log(`The Element ${element} is found at index ${searchIndex}`);

