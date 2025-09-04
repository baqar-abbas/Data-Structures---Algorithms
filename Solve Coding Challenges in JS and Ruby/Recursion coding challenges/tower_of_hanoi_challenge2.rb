# Challenge description
# Towers of Hanoi - Part 2 - Solution in Ruby

# Create a program that solves the tower of Hanoi. You will be given one number as input - the number of disks on Peg 1. Create a method that prints a string with the correct steps to solve the puzzle.

# Output Format

# Print the peg to move from, an arrow "->", and the peg to move to. For example, to move from peg 1 to peg 3, print: 1->3. Store the string with all the steps, each step on its own line and then print return the string at the end of the function.
# Examples

# console.log(hanoi_steps(2))
# // => 1->2 
# //    1->3 
# //    2->3

# console.log(hanoi_steps(3))
# // => 1->3 
# //    1->2
# //    3->2
# //    1->3
# //    2->1
# //    2->3
# //    1->3

# console.log(hanoi_steps(4))
# // => 1->2
# //    1->3
# //    2->3
# //    1->2
# //    3->1
# //    3->2
# //    1->2
# //    1->3
# //    2->3
# //    2->1
# //    3->1
# //    2->3
# //    1->2
# //    1->3
# //    2->3

def hanoi_steps(n)
    moves = []
    solve(n, 1, 2, 3, moves)
    return moves.join("\n")
end

def solve(n, source, auxiliary, destination, moves) 
    if n == 1
        moves << "#{source}->#{destination}"
        return
    end
    solve(n-1, source, destination, auxiliary, moves)
    moves << "#{source}->#{destination}"
    solve(n-1, auxiliary, source, destination, moves)
end

# Test cases
puts "Tower of Hanoi \n"
puts "With 2 disks:"
puts hanoi_steps(2)
#output:
# 1->2
# 1->3
# 2->3
puts "\nWith 3 disks:"
puts hanoi_steps(3)
#output:
# 1->3
# 1->2
# 3->2
# 1->3
# 2->1
# 2->3
# 1->3
puts "\nWith 4 disks:"
puts hanoi_steps(4)
#output:
# 1->2
# 1->3
# 2->3
# 1->2
# 3->1
# 3->2
# 1->2
# 1->3
# 2->3
# 2->1
# 3->1
# 2->3
# 1->2
# 1->3
# 2->3