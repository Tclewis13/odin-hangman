require_relative 'guess'
require_relative 'display'

class Game
  attr_accessor :turn, :word

  def initialize
    self.turn = 1
    self.word = pick_word
  end

  def pick_word
  end
end
