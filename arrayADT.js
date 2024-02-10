// Array ADT implementation in JavaScript

// Array ADT (Abstract Data Type) is a model of a data structure that 
// defines the operations that can be performed on a data structure. 
// It is a mathematical model of a data structure that defines a set of
// operations that can be performed on the data structure.

// Function to create an array ADT
function createArray(totalSize, usedSize) {
    console.log("Array created...")
return {
    totalSize: totalSize,
    usedSize: usedSize,
    data: new Array(totalSize).fill(0),
}
}

// Function to show the values of the ADT array
function show(arrayADT) {
    for(let i=0; i<arrayADT.usedSize; i++) {
        console.log(`The value at index ${i} is ${arrayADT.data[i]}`);
    }
}

// Function to set the value at a particular index
function setValue(arrayADT, index, value) {
    if(index < arrayADT.usedSize) {
        arrayADT.data[index] = value;
        console.log(`Value ${value} set at index ${index}`);
    }
    else {
        console.log("Invalid Index");
    }
}

console.log("Creating array...");
// Creating an array of size 10 with 3 used elements
const myArray = createArray(10, 3);
console.log(myArray);

console.log("Setting values...");
// Setting values at index 0, 1, 2
setValue(myArray, 0, 10);
setValue(myArray, 1, 20);
setValue(myArray, 2, 30);

console.log("Showing values...");
show(myArray);