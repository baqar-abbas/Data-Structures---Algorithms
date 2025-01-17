// Program to insert an element at a specific index in an array

function display(arr, size) {
    // Array Traversal
  // Loop through array elements and print them
    for (let i = 0; i < size; i++) {
        console.log(`The value at index ${i} is ${arr[i]}`);
    }
}

function indexInsertion(arr, size, element, capacity, index) {
    // Check if the array is full
    if (size >= capacity) {
        return -1;
    }
    // Shift the elements to the right
    for (let i=size-1; i>=index; i--) {
        arr[i+1] = arr[i];
    }
    // Insert the element at the specified index
    arr[index] = element;
    console.log("Element inserted successfully");
    return 1;
}

function main() {
    let arr = [7, 8, 12, 27, 88];
    let size = 5;
    const element = 45, index = 3;
    display(arr, size);
    // Inserting element at index
    indexInsertion(arr, size, element, 100, index);
    size += 1;
    display(arr, size);
}

main();