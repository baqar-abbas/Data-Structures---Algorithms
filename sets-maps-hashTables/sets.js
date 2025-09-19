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

// 2. SET THEORY OPERATIONS
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

// 3. SET ITERATION
console.log("\n=== SET ITERATION ===");
console.log("Iterating through set A:");
for (const item of setA) {
  console.log(" ->", item);
}

// Convert to array and use array methods
const doubled = [...setA].map((x) => x * 2);
console.log("Doubled values of A:", doubled);
