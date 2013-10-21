words = ["ant", "baboon", "badger", "bat", "bear", "beaver", "camel", "cat", "clam", "cobra", "cougar", "coyote", "crow", "deer", "dog", "donkey", "duck", "eagle", "ferret", "fox", "frog", "goat", "goose", "hawk", "lion", "lizard", "llama", "mole", "monkey", "moose", "mouse", "mule", "newt", "otter", "owl", "panda", "parrot", "pigeon", "python", "rabbit", "ram", "rat", "raven", "rhino", "salmon", "seal", "shark", "sheep", "skunk", "sloth", "snake", "spider", "stork", "swan", "tiger", "toad", "trout", "turkey", "turtle", "weasel", "whale", "wolf", "wombat", "zebra"]
puts "\e[H\e[2J"
puts "WELCOME TO HANGMAN"
word_to_guess = words.sample
dash = "_ "
blanks = dash * word_to_guess.length
array_to_guess = word_to_guess.chars.to_a
puts blanks


guessed_wrong = Array.new
guessed_right = Array.new
array_to_guess = word_to_guess.chars.to_a #an array from the word itself
#results = Array.new


def already_guessed(guessed_letter, guessed_right, guessed_wrong)
  
  if guessed_right.include?(guessed_letter)
      puts "You already guessed this letter. Guess another"
  end
    
  if guessed_wrong.include?(guessed_letter)
      puts "You already wrongly guessed this letter. Guess another"
  end
  
end

def is_it_in_the_word(word_to_guess, guessed_letter, guessed_right, guessed_wrong)

  if word_to_guess.include?(guessed_letter)
      guessed_right.push(guessed_letter)
      puts "Wrong #{guessed_wrong}"
      puts "Right #{guessed_right}"
  else
      guessed_wrong.push(guessed_letter)
      puts "Wrong #{guessed_wrong}"
      puts "Right #{guessed_right}"
      
  end

end

def printing_image(guessed_wrong)
  which_hang = guessed_wrong.length
  
  hang_1 = "  +---+
    |   |
        |
        |
        |
        |
  ========="
  hang_2 =  "  +---+
    |   |
    O   |
        |
        |
        |
  ========="
  hang_3 = "  +---+
    |   |
    O   |
    |   |
        |
        |
  ========="
  hang_4 = "  +---+
    |   |
    O   |
   /|   |
        |
        |
  ========="
  hang_5 = "  +---+
    |   |
    O   |
   /|\\  |
        |
        |
  ========="
  hang_6 = "  +---+
    |   |
    O   |
   /|\\  |
   /    |
        |
  ========="

  hang_7 = "  +---+
    |   |
    O   |
   /|\\  |
   / \\  |
        |
  ========="
  
  
  if which_hang == 1
    puts hang_1
  end
  
  if which_hang == 2
    puts hang_2
  end
  
  if which_hang == 3
    puts hang_3
  end
  
  if which_hang == 4
    puts hang_4
  end
  
  if which_hang == 5
    puts hang_5
  end
  
  if which_hang == 6
    puts hang_6
  end
  
  if which_hang == 7
    puts hang_7
  end

end
  

def print_guess_results(array_to_guess, guessed_right)
  results = Array.new
  array_to_guess.each do |l|
    if guessed_right.include?(l)
      results.push(l)
    else 
      results.push("_ ")
    end
  end
 results = results.join(",")
 return "#{results}"
end

def is_the_game_over(guessed_wrong)
  if guessed_wrong.length < 7
    return "game_continues"
  else 
    return "game over"
  end
end

while guessed_wrong.length < 7
  puts "Guess a letter"
  guessed_letter = STDIN.gets.chomp()
  puts "\e[H\e[2J"
  puts "HANGMAN!"
  puts "\n"
  puts "\n"
  if guessed_letter.length > 1
    puts "Please enter a single letter"
    next
  end
  if guessed_letter == ""
    puts "Please do not enter a blank letter"
    next
  end
  already_guessed(guessed_letter, guessed_right, guessed_wrong)
  is_it_in_the_word(word_to_guess, guessed_letter, guessed_right, guessed_wrong)
  printing_image(guessed_wrong)
  puts print_guess_results(array_to_guess, guessed_right)
  puts "\n"
  if guessed_right.length == array_to_guess.length
    puts "YOU WON!!"
    break
  end

end

if guessed_wrong.length == 7
  puts "Game Over!"
  puts "The winning word was #{word_to_guess}"
end

