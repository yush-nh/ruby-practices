require_relative 'shot'

class Frame
  attr_reader :first_mark, :second_mark, :third_mark

  def initialize(first_mark, second_mark = nil, third_mark = nil)
    @first_mark = Shot.new(first_mark)
    @second_mark = Shot.new(second_mark)
    @third_mark = Shot.new(third_mark)
  end

  def strike?
    true if @first_mark.score == 10
  end

  def spare?
    true if !strike? && @first_mark.score + @second_mark.score == 10
  end

  def total
    total = @first_mark.score + @second_mark.score + @third_mark.score
  end
end
