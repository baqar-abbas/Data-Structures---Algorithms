// Array ADT implementation in JavaScript using classes

// Array ADT Class to create an array ADT
class ArrayADT {
    constructor (totalSize, usedSize) {
        this.totalSize = totalSize;
        this.usedSize = usedSize;
        this.data = this.initializeData(totalSize);
    }

    // Function to initialize the array with 0
    initializeData(size) {
        let data = {};
        for(let i=0; i<size; i++) {
            data[i] = 0;
        }
        console.log("Array created...");
        return data;
    }

    // Function to show the values of the ADT array
    show() {
        for(let i=0; i<this.usedSize; i++) {
            console.log(`The value at index ${i} is ${this.data[i]}`);
        }
    }

    // Function to set the value at a particular index
    setValue(index, value) {
        if(index < this.usedSize) {
            this.data[index] = value;
            console.log(`Value ${value} set at index ${index}`);
        }
        else {
            console.log("Invalid Index");
        }
    }
}

console.log("Creating array...");
// Creating an array of size 10 with 3 used elements
const myArray = new ArrayADT(10, 3);
console.log(myArray);

console.log("Setting values...");
// Setting values at index 0, 1, 2
myArray.setValue(0, 10);
myArray.setValue(1, 20);
myArray.setValue(2, 30);

console.log("Displaying values...");
// Displaying values
myArray.show();

