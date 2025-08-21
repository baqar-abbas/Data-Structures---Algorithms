// Program to implement recursion in JavaScript

const prompt = require("prompt-sync")();

function factorial(n) {
  if (n === 0) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}

let num = parseInt(prompt("Enter a number: "), 10);

if (isNaN(num) || num < 0) {
  console.log("Please enter a valid non-negative integer!");
} else {
  let result = factorial(num);
  console.log(`Factorial of ${num} is ${result}`);
}
