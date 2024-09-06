require_relative 'guess'

class Display
  attr_accessor :word_length, :display_array

  attr_reader :guesses_left

  def initialize(word_length)
    self.guesses_left = 11
    self.word_length = word_length
    self.display_array = Array.new(self.word_length)
  end
end
