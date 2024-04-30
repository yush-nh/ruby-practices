# frozen_string_literal: true

require_relative 'frame'

class Game
  def initialize(scores)
    shots = []

    scores.split(',').each do |score|
      if score == 'X'
        shots << 10
        shots << 0
      else
        shots << score.to_i
      end
    end

    frames = shots.each_slice(2).to_a
    @frames = frames.map { |frame| Frame.new(*frame) }
  end

  def point
    0.upto(9).sum do |i|
      current_frame = @frames[i]
      next_frame = @frames[i + 1]
      after_next_frame = @frames[i + 2]
      strike = current_frame.strike?
      spare = current_frame.spare?

      if strike
        if next_frame.strike?
          20 + after_next_frame.first_shot.mark
        else
          10 + next_frame.score
        end
      elsif spare
        10 + next_frame.first_shot.mark
      else
        current_frame.score
      end
    end
  end
end
