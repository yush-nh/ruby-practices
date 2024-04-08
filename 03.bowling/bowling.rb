#!/usr/bin/env ruby
require 'rubygems'

score = ARGV[0]
scores = score.split(",")
shots = []

scores.each do |score|
  if score == 'X'
    shots << 10
    shots << 0
  else
    shots << score.to_i
  end
end

frames = []
shots.each_slice(2) do |shot|
  frames << shot
end
frames << [0,0] if frames.size == 10

point = 0
frames.each_cons(2).with_index do |(current_frame, next_frame), i|
  if i == 9
    # 10投目の処理
    if current_frame[0] == 10 && next_frame[0] == 10
      point += 20 + frames.last.sum
    elsif current_frame.sum == 10
      point += 10 + next_frame.sum
    else
      point += current_frame.sum
    end
    break
  else
    # ストライクの処理
    if current_frame[0] == 10
      if next_frame[0] == 10
        point += (current_frame[0] + next_frame[0] + frames[i+2][0])
      else
        point += (current_frame[0] + next_frame.sum)
      end
    # スペアの処理
    elsif current_frame.sum == 10
      point += (current_frame.sum + next_frame[0])
    else
      point += current_frame.sum
    end
    end
end

puts point
