# Challenge description - Solve the Morse Code challenge in Ruby

# Decode a Morse code message

=begin

Description

During your vacation at the seaside, time after time you find old bottles with parchment
inside. Out of curiosity, you look into the next bottle and see that there is a message 
written in Morse code. Your curiosity grows even more - maybe you just found the lost 
treasure of the pirates! However, you are getting tired of decrypting messages manually. 
Fortunately, you can program in Ruby and you can help yourself by automating this process.

Let's not waste time, the pirate treasure awaits! Let's get to work.

Create a method to decode a Morse code character, takes a string parameter, and return 
the corresponding character in uppercase (e.g. decode_char(".-") returns "A").

Create a method to decode an entire word in Morse code, takes a string parameter, and 
return the string representation. Every character in a word will be separated by a 
single space (e.g. decode_word("-- -.--") returns "MY").

Create a method to decode the entire message in Morse code, takes a string parameter, 
and return the string representation. Every word will be separated by 3 spaces (e.g.

  decode("-- -.--   -. .- -- .")

returns "MY NAME").

Reuse methods whenever possible. Make sure that your code is DRY.



    Once your code is ready use it to decode the message from the old bottle:

      .-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...

    
=end

# Morse code class containing methods to decode a Morse code character, word and message
class MorseCodeDecode
    # defined a const MORSE_CODE hash

    MORSE_CODE = {
        ".-" => "A",
        "-..." => "B",
        "-.-." => "C",
        "-.." => "D",
        "." => "E",
        "..-." => "F",
        "--." => "G",
        "...." => "H",
        ".." => "I",
        ".---" => "J",
        "-.-" => "K",
        ".-.." => "L",
        "--" => "M",
        "-." => "N",
        "---" => "O",
        ".--." => "P",
        "--.-" => "Q",
        ".-." => "R",
        "..." => "S",
        "-" => "T",
        "..-" => "U",
        "...-" => "V",
        ".--" => "W",
        "-..-" => "X",
        "-.--" => "Y",
        "--.." => "Z", 
    }.freeze

    # Method to decode a Morse code character
    def self.decode_char(morse_code)
        MORSE_CODE[morse_code]
    end

    # Method to decode an entire word in Morse code
    def self.decode_word(morse_code)
      morse_code.split(' ').map { |morse_char| decode_char(morse_char) }.join
    end

    # Method to decode the entire message in Morse code
    def self.decode_message(morse_code)
      morse_code.split(' ').map { |morse_word| decode_word(morse_word) }.join(' ')
    end

end

# puts MorseCodeDecode::MORSE_CODE
char = MorseCodeDecode.decode_char('.-') # returns "A"
puts char # prints A

word = MorseCodeDecode.decode_word("-- -.--") # returns "MY"
puts word # prints MY

message = MorseCodeDecode.decode_message("-- -.--   -. .- -- .") # returns "MY NAME"
puts message # prints MY NAME

message = MorseCodeDecode.decode_message(".-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...") # returns "ABOX FULL OF RUBIES"
puts message # prints A BOX FULL OF RUBIES