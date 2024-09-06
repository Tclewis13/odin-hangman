class Guess
  attr_accessor :guess_letter, :turn

  def initialize(guess_letter, turn)
    self.guess_letter = guess_letter
    self.turn = turn
  end
end