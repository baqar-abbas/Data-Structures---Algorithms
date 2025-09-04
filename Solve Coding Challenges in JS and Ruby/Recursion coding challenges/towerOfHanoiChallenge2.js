// Challenge description
// Towers of Hanoi - Part 2 - Solution in JavaScript

// Create a program that solves the tower of Hanoi. You will be given one number as input - the number of disks on Peg 1. Create a method that prints a string with the correct steps to solve the puzzle.

// Output Format

// Print the peg to move from, an arrow "->", and the peg to move to. For example, to move from peg 1 to peg 3, print: 1->3. Store the string with all the steps, each step on its own line and then print return the string at the end of the function.
// Examples

// console.log(hanoi_steps(2))
// => 1->2
//    1->3
//    2->3

// console.log(hanoi_steps(3))
// => 1->3
//    1->2
//    3->2
//    1->3
//    2->1
//    2->3
//    1->3

// console.log(hanoi_steps(4))
// => 1->2
//    1->3
//    2->3
//    1->2
//    3->1
//    3->2
//    1->2
//    1->3
//    2->3
//    2->1
//    3->1
//    2->3
//    1->2
//    1->3
//    2->3

function hanoi_steps(n) {
  let result = [];
  solve(n, 1, 2, 3, result);
  return result.join("\n");
}

function solve(n, source, auxiliary, destination, result) {
  if (n === 1) {
    result.push(`${source}->${destination}`);
    return;
  }
  solve(n - 1, source, destination, auxiliary, result);
  result.push(`${source}->${destination}`);
  solve(n - 1, auxiliary, source, destination, result);
}

console.log("Towers of Hanoi Solution\n");
console.log("Number of disks: 2");
console.log(hanoi_steps(2));
// => 1->2
//    1->3
//    2->3

console.log("\nNumber of disks: 3");
console.log(hanoi_steps(3));
// => 1->3
//    1->2
//    3->2
//    1->3
//    2->1
//    2->3
//    1->3

console.log("\nNumber of disks: 4");
console.log(hanoi_steps(4));
// => 1->2
//    1->3
//    2->3
//    1->2
//    3->1
//    3->2
//    1->2
//    1->3
//    2->3
//    2->1
//    3->1
//    2->3
//    1->2
//    1->3
//    2->3
