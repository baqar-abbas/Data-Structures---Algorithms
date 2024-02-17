// Program to demonstrate Data Structure array delete operation at a specific index.
function display(arr, size) {
    // Array Traversal
  // Loop through array elements and print them
    for (let i = 0; i < size; i++) {
        console.log(`The value at index ${i} is ${arr[i]}`);
    }
}

function indexDeletion(arr, size, index) {
    // Check if the array is empty
    if (size === 0) {
        return -1;
    }
    // Deleting element at specific index
    for (let i = index; i < size - 1; i++) {
        arr[i] = arr[i + 1];
    }
    console.log(`Element at index ${index} deleted successfully!`);
    return 1;
}

function main() {
    let arr = [7, 8, 12, 27, 88];
    let size = 5;
    const index = 1;
    display(arr, size);
    // Deleting element at index
    indexDeletion(arr, size, index);
    // Decrease the size of the array after deletion
    size -= 1;
    console.log("After Deletion");
    // Print the array after deletion operation
    display(arr, size);
}

main();