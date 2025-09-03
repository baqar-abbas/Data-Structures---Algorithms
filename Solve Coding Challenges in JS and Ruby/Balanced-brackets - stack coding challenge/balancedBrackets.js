// Challenge description
// Balanced Brackets

// There are 3 kinds of Brackets: [] {} (). Given a String of characters, check if all the brackets in the String are Balanced. A string is balanced if all the start and end brackets are in a correct order so they match each other. Here are some balanced Strings:

//     {}
//     (hello)[world]
//     [({}{}{})([])]

// Here are some Unbalanced ones:

//     (hello - no ending )
//     ([)] - The [ is improperly enclosed in the ().
//     )( - There's an ending ) without a ( before it.

// Return true if a line is balanced and false otherwise.
// Examples

// The following are 3 test cases:

// console.log(balanced_brackets?('(hello)[world]'))
// // => true

// console.log(balanced_brackets?('([)]'))
// // => false

// console.log(balanced_brackets?('[({}{}{})([])]'))
// // => true

function balancedBrackets(str) {
  const stack = [];

  for (let i = 0; i < str.length; i++) {
    const char = str[i];
    if (char === "(" || char === "[" || char === "{") {
      stack.push(char);
    } else if (char === ")" || char === "]" || char === "}") {
      let top = stack.pop();
      if (
        !top ||
        (char === ")" && top !== "(") ||
        (char === "]" && top !== "[") ||
        (char === "}" && top !== "{")
      ) {
        return false;
      }
    }
  }
  return stack.length === 0;
}

console.log(balancedBrackets("(hello)[world]"));
// => true

console.log(balancedBrackets("([)]"));
// => false

console.log(balancedBrackets("[({}{}{})([])]"));
// => true
