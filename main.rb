require 'rubocop'
require_relative 'lib/game'
require 'yaml'

game = Game.new
display = Display.new(game.word.length)
# display.draw_display(game.solution)

def game_flow(game, display)
  puts ''
  print 'Wrong guesses:'
  game.wrong_guesses.each do |guess|
    print " #{guess}"
  end
  puts ''
  puts 'Input a single character as a guess'
  guess_char = gets.chomp
  save_game(game, display) if guess_char == 'SAVE'
  guess_char = guess_char[0]

  game.process_guess(guess_char)
  display.draw_display(game.solution)
  game.check_win
  game_flow(game, display)
end

def intro(game, display)
  puts 'Welcome to Hangman. You have 7 incorrect guesses.'
  puts 'At any time, input SAVE to save game and exit.'
  puts 'Would you like to load a game? Y loads a game. N starts a new game.'
  choice = gets.chomp
  choice = choice[0]
  choice.upcase!
  if choice == 'Y' then load_game
  elsif choice == 'N'
    display.draw_display(game.solution)
    game_flow(game, display)
  end
end

def load_game
  in_file = File.open('out.txt', 'r')
  hash_serialized = File.read(in_file)
  save_hash = YAML.load(hash_serialized, permitted_classes: [Game, Display, Symbol])
  game = save_hash[:game]
  display = save_hash[:display]
  display.draw_display(game.solution)
  game_flow(game, display)
end

def save_game(game, display)
  save_hash = {}
  save_hash[:game] = game
  save_hash[:display] = display
  out_file = File.new('out.txt', 'w')
  out_file.puts(save_hash.to_yaml)
  out_file.close
  exit
end

intro(game, display)
