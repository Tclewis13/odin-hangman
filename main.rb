require 'rubocop'
require_relative 'lib/game'
require 'yaml'

game = Game.new
display = Display.new(game.word.length)
display.draw_display(game.solution)

def game_flow(game, display)
  puts ''
  print 'Wrong guesses:'
  game.wrong_guesses.each do |guess|
    print " #{guess}"
  end
  puts ''
  puts 'Input a single character as a guess'
  guess_char = gets.chomp
  guess_char = guess_char[0]

  game.process_guess(guess_char)
  display.draw_display(game.solution)
  game.check_win
  game_flow(game, display)
end

# serialized_game = YAML.dump(game)
# puts serialized_game

game_flow(game, display)
