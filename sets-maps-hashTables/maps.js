// Complete map operations in JavaScript

// Create a new map
const myMap = new Map();

// set(key, value): Adds or updates an element
myMap.set("name", "Alice");
myMap.set("age", 30);
myMap.set("city", "New York");

console.log("After setting name and age:", myMap);

//After setting name, age and city: Map(3) { 'name' => 'Alice', 'age' => 30, 'city' => 'New York' }

// get(key): Returns the value for a key
console.log("Get name: ", myMap.get("name")); // Alice

// has(key): Checks if a key exists
console.log("Has age? ", myMap.has("age")); // true
console.log("Has country? ", myMap.has("country")); // false
console.log("Has city? ", myMap.has("city")); // true

// size: Returns the number of elements
console.log("Map size: ", myMap.size); // 3

// delete(key): Removes an element by key
myMap.set("To Delete", "data");
console.log("My Map: ", myMap);
myMap.delete("To Delete");
console.log("After deleting To Delete: ", myMap);

// keys(): Returns an iterator for keys
console.log("Map keys:");
for (let key of myMap.keys()) {
  console.log("  Key:", key);
}

// values(): Returns an iterator for values
console.log("Map values:");
for (let value of myMap.values()) {
  console.log("  Value:", value);
}

// entries(): Returns an iterator for [key, value] pairs
console.log("Map entries:");
for (let [key, value] of myMap.entries()) {
  console.log("Key:", key, "Value:", value);
}

// forEach(callback): Iterates over each element
console.log("Map forEach:");
myMap.forEach((value, key) => {
  console.log(`${key}: ${value}`);
});

// Create Map from Array
console.log("\n CREATE MAP FROM ARRAY:");
const array = [
  ["a", 1],
  ["b", 2],
  ["c", 3],
];
const mapFromArray = new Map(array);
console.log("Map from array:", mapFromArray);

// Convert Map to Array
console.log("\n CONVERT MAP TO ARRAY:");
const arrayFromMap = Array.from(myMap);
console.log("Array from map:", arrayFromMap);

// clear(): Removes all elements
myMap.clear();
console.log("After clear, size:", myMap.size); // 0
console.log("\n ALL MAP METHODS DEMONSTRATED!");
