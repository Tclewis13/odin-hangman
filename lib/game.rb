require_relative 'display'

class Game
  attr_accessor :fails_remaining, :word, :solution, :display, :wrong_guesses

  def initialize
    self.fails_remaining = 7
    self.word = pick_word
    self.solution = Array.new(word.length - 1, '')
    self.wrong_guesses = []
    # puts "Word is #{word}"
    # puts "Length is #{word.length}"
  end

  def pick_word
    lines = File.readlines('google-10000-english-no-swears.txt')
    lines.sample
  end

  def process_guess(guess_char)
    if !word.include?(guess_char)
      guess_fail(guess_char)
    else
      guess_success(guess_char)
    end
  end

  def check_win
    if fails_remaining <= 0
      puts ''
      puts ''
      puts "Out of tries! You lose! Word was #{word}"
      exit
    elsif !solution.include?('')
      puts ''
      puts ''
      puts "You win! Word was #{word}"
      exit
    end
  end

  def guess_fail(guess_char)
    self.fails_remaining -= 1
    puts ''
    puts "Incorrect guess! Fails remaining: #{fails_remaining}"
    wrong_guesses << guess_char
  end

  def guess_success(guess_char)
    puts ''
    puts "Correct Guess! Fails remaining: #{fails_remaining}"
    word_array = word.chars
    index_array = []
    word_array.each_with_index do |letter, index|
      index_array << index if letter == guess_char
    end
    index_array.each do |guess_index|
      solution[guess_index] = guess_char
    end
  end
end
