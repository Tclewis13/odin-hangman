class Display
  attr_accessor :word_length, :display_array

  def initialize(word_length)
    self.word_length = word_length
    self.display_array = Array.new(self.word_length - 1)
  end

  def draw_display(solution)
    solution.each do |letter|
      if letter == ''
        print '_ '
      else
        print "#{letter} "
      end
    end
  end
end
