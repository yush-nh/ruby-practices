#!/usr/bin/env ruby
require 'rubygems'
require 'debug'

obtained_score = ARGV[0]
scores = obtained_score.split(',')
shots = []

scores.each do |score|
  if score == 'X'
    shots << 10
    shots << 0
  else
    shots << score.to_i
  end
end

frames = shots.each_slice(2).to_a
frames << [0, 0] if frames.size == 10

point = 0
frames.each_with_index do |current_frame, i|
  next_frame = frames[i + 1]
  after_next_frame = frames[i + 2]
  strike = current_frame[0] == 10
  spare = current_frame.sum == 10

  if i < 9
    point +=
      if strike
        if next_frame[0] == 10
          current_frame[0] + next_frame[0] + after_next_frame[0]
        else
          current_frame[0] + next_frame.sum
        end
      elsif spare
        current_frame.sum + next_frame[0]
      else
        current_frame.sum
      end
  else
    point +=
      if strike && next_frame[0] == 10
        current_frame.sum + next_frame.sum + after_next_frame.sum
      elsif spare
        10 + next_frame.sum
      else
        current_frame.sum
      end
    break
  end
end

puts point
