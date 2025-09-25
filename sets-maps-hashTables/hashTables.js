class HashTable {
  constructor(size = 53) {
    this.keyMap = new Array(size);
    this.size = size;
  }

  // Hash function - converts key to index
  _hash(key) {
    let total = 0;
    const PRIME = 31; // A prime number to reduce collisions
    for (let i = 0; i < Math.min(key.length, 100); i++) {
      const char = key[i];
      const value = char.charCodeAt(0) - 96; // a=1, b=2, c=3, ...
      total = (total * PRIME + value) % this.size;
    }
    return total;
  }

  // Set key-value pair (handles collisions with separate chaining)
  set(key, value) {
    const index = this._hash(key);

    if (!this.keyMap[index]) {
      this.keyMap[index] = [];
    }

    // Check if key already exists, update if it does
    for (let i = 0; i < this.keyMap[index].length; i++) {
      if (this.keyMap[index][i][0] === key) {
        this.keyMap[index][i][1] = value;
        return;
      }
    }
    this.keyMap[index].push([key, value]);
  }

  // Get value by key
  get(key) {
    const index = this._hash(key);

    if (this.keyMap[index]) {
      for (let pair of this.keyMap[index]) {
        if (pair[0] === key) {
          return pair[1];
        }
      }
    }
    return undefined;
  }

  // Get all keys
  keys() {
    const keyArr = [];

    for (let i = 0; i < this.keyMap.length; i++) {
      if (this.keyMap[i]) {
        for (let pair of this.keyMap[i]) {
          if (!keyArr.includes(pair[0])) {
            keyArr.push(pair[0]);
          }
        }
      }
    }

    return keyArr;
  }

  // Get all values
  values() {
    const valuesArr = [];

    for (let i = 0; i < this.keyMap.length; i++) {
      if (this.keyMap[i]) {
        for (let pair of this.keyMap[i]) {
          if (!valuesArr.includes(pair[1])) {
            valuesArr.push(pair[1]);
          }
        }
      }
    }
    return valuesArr;
  }

  // Check if key exists
  has(key) {
    return this.get(key) !== undefined;
  }

  // Remove key-value pair
  // Remove key-value pair
  delete(key) {
    const index = this._hash(key);

    if (this.keyMap[index]) {
      for (let i = 0; i < this.keyMap[index].length; i++) {
        if (this.keyMap[index][i][0] === key) {
          this.keyMap[index].splice(i, 1);
          return true;
        }
      }
    }
    return false;
  }

  // Get load factor (measure of how full the hash table is)
  loadFactor() {
    let itemCount = 0;

    for (let i = 0; i < this.keyMap.length; i++) {
      if (this.keyMap[i]) {
        itemCount += this.keyMap[i].length;
      }
    }
    return (itemCount / this.size).toFixed(2);
  }

  // Display the entire hash table
  display() {
    console.log("\n HASH TABLE STRUCTURE:");
    console.log("=".repeat(40));

    for (let i = 0; i < this.keyMap.length; i++) {
      if (this.keyMap[i]) {
        console.log(`Index ${i}:`, this.keyMap[i]);
      }
    }

    console.log(`Load Factor: ${this.loadFactor()}`);
    console.log("=".repeat(40));
  }
}

function testHashTable() {
  console.log("TESTING HASH TABLE IMPLEMENTATION\n");

  const ht = new HashTable(7); // Small size to force collisions

  // Test 1: Basic Set and Get
  console.log("1. BASIC SET/GET:");
  ht.set("name", "Alice");
  ht.set("age", 30);
  console.log('get("name"):', ht.get("name")); // Expected: 'Alice'
  console.log('get("age"):', ht.get("age")); // Expected: 30
  console.log('get("invalid"):', ht.get("invalid")); // Expected: undefined

  // Test 2: Update Existing Key
  console.log("\n2. UPDATE EXISTING KEY:");
  ht.set("name", "Bob");
  console.log('After update - get("name"):', ht.get("name")); // Expected: 'Bob'

  // Test 3: Collision Handling
  console.log("\n3. COLLISION HANDLING:");
  ht.set("cat", "animal1");
  ht.set("car", "animal2"); // Might collide with 'cat'
  ht.set("dog", "animal3");
  console.log('get("cat"):', ht.get("cat"));
  console.log('get("car"):', ht.get("car"));
  console.log('get("dog"):', ht.get("dog"));

  // Test 4: Has Method
  console.log("\n4. HAS METHOD:");
  console.log('has("name"):', ht.has("name")); // Expected: true
  console.log('has("invalid"):', ht.has("invalid")); // Expected: false

  // Test 5: Keys Method
  console.log("\n5. KEYS METHOD:");
  console.log("Keys:", ht.keys()); // Should include all keys

  // Test 6: Values Method
  console.log("\n6. VALUES METHOD:");
  console.log("Values:", ht.values()); // Should include all values

  // Test 7: Delete Method
  console.log("\n7. DELETE METHOD:");
  console.log('Before delete - has("age"):', ht.has("age"));
  ht.delete("age");
  console.log('After delete - has("age"):', ht.has("age"));
  console.log('get("age"):', ht.get("age")); // Expected: undefined

  // Test 8: Load Factor
  console.log("\n8. LOAD FACTOR:");
  console.log("Load Factor:", ht.loadFactor());

  // Test 9: Display Structure
  console.log("\n9. DISPLAY STRUCTURE:");
  ht.display();

  // Test 10: Empty Operations
  console.log("\n10. EMPTY OPERATIONS:");
  const emptyHT = new HashTable();
  console.log("Empty get:", emptyHT.get("test"));
  console.log("Empty has:", emptyHT.has("test"));
  console.log("Empty keys:", emptyHT.keys());
  console.log("Empty values:", emptyHT.values());
  console.log("Delete non-existent:", emptyHT.delete("test"));

  // Test 11: Special Characters
  console.log("\n11. SPECIAL CHARACTERS:");
  ht.set("email", "test@email.com");
  ht.set("phone-number", "123-456-7890");
  ht.set("salary$", 50000);
  console.log('Special keys - get("email"):', ht.get("email"));
  console.log('Special keys - get("phone-number"):', ht.get("phone-number"));

  console.log("\n ALL TESTS COMPLETED!");
}

testHashTable();

// OutPut

// TESTING HASH TABLE IMPLEMENTATION

// 1. BASIC SET/GET:
// get("name"): Alice
// get("age"): 30
// get("invalid"): undefined

// 2. UPDATE EXISTING KEY:
// After update - get("name"): Bob

// 3. COLLISION HANDLING:
// get("cat"): animal1
// get("car"): animal2
// get("dog"): animal3

// 4. HAS METHOD:
// has("name"): true
// has("invalid"): false

// 5. KEYS METHOD:
// Keys: [ 'age', 'cat', 'name', 'dog', 'car' ]

// 6. VALUES METHOD:
// Values: [ 30, 'animal1', 'Bob', 'animal3', 'animal2' ]

// 7. DELETE METHOD:
// Before delete - has("age"): true
// After delete - has("age"): false
// get("age"): undefined

// 8. LOAD FACTOR:
// Load Factor: 0.57

// 9. DISPLAY STRUCTURE:

//  HASH TABLE STRUCTURE:
// ========================================
// Index 0: []
// Index 1: [ [ 'cat', 'animal1' ] ]
// Index 4: [ [ 'name', 'Bob' ], [ 'dog', 'animal3' ] ]
// Index 6: [ [ 'car', 'animal2' ] ]
// Load Factor: 0.57
// ========================================

// 10. EMPTY OPERATIONS:
// Empty get: undefined
// Empty has: false
// Empty keys: []
// Empty values: []
// Delete non-existent: false

// 11. SPECIAL CHARACTERS:
// Special keys - get("email"): test@email.com
// Special keys - get("phone-number"): 123-456-7890

//  ALL TESTS COMPLETED!
