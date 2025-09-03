# Challenge description
# Balanced Brackets - in Ruby

# There are 3 kinds of Brackets: [] {} (). Given a String of characters, check if all the brackets in the String are Balanced. A string is balanced if all the start and end brackets are in a correct order so they match each other. Here are some balanced Strings:

#     {}
#     (hello)[world]
#     [({}{}{})([])]

# Here are some Unbalanced ones:

#     (hello - no ending )
#     ([)] - The [ is improperly enclosed in the ().
#     )( - There's an ending ) without a ( before it.

# Return true if a line is balanced and false otherwise.
# Examples

# The following are 3 test cases:

# console.log(balanced_brackets?('(hello)[world]'))
# // => true

# console.log(balanced_brackets?('([)]'))
# // => false

# console.log(balanced_brackets?('[({}{}{})([])]'))
# // => true

# Solve Balanced brackets coding challenge in Ruby using stack data structure

def balanced_brackets?(str)
    stack = []
    str.each_char do |char|
        if char == "(" || char == "[" || char == "{"
            stack.push(char)
        elsif char == ")" || char == "]" || char == "}"
            top = stack.pop
            if !top || (char == ")" && top != "(") || (char == "]" && top != "[") || (char == "}" && top!= "{")
                return false
            end
        end
    end
    return stack.empty?
end

puts balanced_brackets?('(hello)[world]')   # => true
puts balanced_brackets?('([)]')             # => false
puts balanced_brackets?('[({}{}{})([])]')   # => true