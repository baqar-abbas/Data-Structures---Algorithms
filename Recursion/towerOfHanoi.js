// Tower of Hanoi Problem using Recursion
// The Tower of Hanoi is a classic problem that can be solved using recursion. The objective is to move a stack of disks from one peg to another, following these rules:
// Only one disk can be moved at a time.
// Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack or on an empty peg.
// No larger disk may be placed on top of a smaller disk.

// Let's Start with 2 Disks:

// Pegs: A (source), B (auxiliary), C (destination)
// Disks: Disk1 (small), Disk2 (large)

// Steps:

//     Move Disk1 from A to B (using C as auxiliary).

//     Move Disk2 from A to C.

//     Move Disk1 from B to C (now both are on C).

// Algorithm for n Disks:

// function towerOfHanoi(n, source, auxiliary, destination):
//   if n == 1:
//     print "Move disk 1 from source to destination"
//   else:
//     towerOfHanoi(n-1, source, destination, auxiliary)   # Step 1
//     print "Move disk n from source to destination"        # Step 2
//     towerOfHanoi(n-1, auxiliary, source, destination)   # Step 3

// Example with n=2:

//     towerOfHanoi(2, 'A', 'B', 'C')

//         Call towerOfHanoi(1, 'A', 'C', 'B') → Move disk1 from A to B

//         Print: Move disk2 from A to C

//         Call towerOfHanoi(1, 'B', 'A', 'C') → Move disk1 from B to C

// Implementation in JavaScript:

function towerOfHanoi(n, source, auxiliary, destination) {
  if (n === 1) {
    console.log(`Move disk 1 from ${source} to ${destination}`);
    return;
  }
  towerOfHanoi(n - 1, source, destination, auxiliary);
  console.log(`Move disk ${n} from ${source} to ${destination}`);
  towerOfHanoi(n - 1, auxiliary, source, destination);
}

// With 2 disks:
console.log("With 2 disks:");
towerOfHanoi(2, "A", "B", "C");
// Output:
// Move disk 1 from A to B
// Move disk 2 from A to C
// Move disk 1 from B to C

// With 3 disks:
console.log("With 3 disks:");
towerOfHanoi(3, "A", "B", "C");
// Output:
// Move disk 1 from A to C
// Move disk 2 from A to B
// Move disk 1 from C to B
// Move disk 3 from A to C
// Move disk 1 from B to A
// Move disk 2 from B to C
// Move disk 1 from A to C
