# frozen_string_literal: true

require_relative 'shot'

class Frame
  attr_reader :first_shot, :second_shot

  def initialize(first_mark, second_mark = nil)
    @first_shot = Shot.new(first_mark)
    @second_shot = Shot.new(second_mark)
  end

  def strike?
    @first_shot.mark == 10
  end

  def spare?
    !strike? && @first_shot.mark + @second_shot.mark == 10
  end

  def score
    @first_shot.mark + @second_shot.mark
  end
end
