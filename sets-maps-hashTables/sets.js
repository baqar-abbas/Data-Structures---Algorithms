// Complete Set Operations in JavaScript

// Create some sets to work with
const setA = new Set([1, 2, 3, 4]);
const setB = new Set([3, 4, 5, 6]);
const setC = new Set([1, 2]);

// 1. BASIC OPERATIONS
console.log("=== BASIC SET OPERATIONS ===");
console.log("Set A: ", setA);
console.log("Set B: ", setB);
console.log("Set C: ", setC);

// Add and remove elements
setA.add(7);
console.log("After adding 7 to Set A: ", setA);

setA.delete(2);
console.log("After removing 2 from Set A: ", setA);

console.log("Set A has 3: ", setA.has(3));
console.log("Set A has size: ", setA.size);

// 2. ALL SET METHODS DEMONSTRATION
console.log("\n=== ALL SET METHODS ===");
// entries() - Returns iterator of [value, value] pairs
console.log("entries() method:");
const entries = setA.entries();
for (const entry of entries) {
  console.log("  Entry:", entry);
}

// keys() - Returns iterator of values (same as values())
console.log("keys() method:");
const keys = setA.keys();
for (const key of keys) {
  console.log("  Key:", key);
}

// values() - Returns iterator of values
console.log("values() method:");
const values = setA.values();
for (const value of values) {
  console.log("  Value:", value);
}

// forEach() - Executes function for each value
console.log("forEach() method:");
setA.forEach((value) => {
  console.log("  Value from forEach:", value);
});

// 3. SET PROPERTIES
console.log("\n=== SET PROPERTIES ===");
console.log("Set A size property:", setA.size);
console.log("Set B size property:", setB.size);
console.log("Set C size property:", setC.size);

// 4. SET THEORY OPERATIONS
console.log("\n=== SET THEORY OPERATIONS ===");

// Union: A ∪ B (elements in A OR B)
const union = new Set([...setA, ...setB]);
console.log("Union of A and B (A ∪ B): ", union);

// Intersection: A ∩ B (elements in A AND B)
const intersection = new Set([...setA].filter((x) => setB.has(x)));
console.log("Intersection of A and B (A ∩ B): ", intersection);

// Difference: A - B (elements in A but NOT in B)
const difference = new Set([...setA].filter((x) => !setB.has(x)));
console.log("Difference A - B:", [...difference]);

// Symmetric Difference: A Δ B (elements in A OR B but NOT both)
const symmetricDifference = new Set([
  ...[...setA].filter((x) => !setB.has(x)),
  ...[...setB].filter((x) => !setA.has(x)),
]);
console.log("Symmetric Difference A Δ B:", [...symmetricDifference]);

// 5. CLEAR METHOD
console.log("\n=== CLEAR METHOD ===");
const tempSet = new Set([10, 20, 30]);
console.log("Temp set before clear:", tempSet);
tempSet.clear();
console.log("Temp set after clear:", tempSet);

// 6. SET ITERATION
console.log("\n=== SET ITERATION ===");
console.log("Iterating through set A:");
for (const item of setA) {
  console.log(" ->", item);
}

// Convert to array and use array methods
const doubled = [...setA].map((x) => x * 2);
console.log("Doubled values of A:", doubled);
