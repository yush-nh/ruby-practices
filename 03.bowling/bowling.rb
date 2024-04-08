#!/usr/bin/env ruby
require 'rubygems'

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

frames = []
shots.each_slice(2) do |shot|
  frames << shot
end
frames << [0, 0] if frames.size == 10

point = 0
frames.each_cons(2).with_index do |(current_frame, next_frame), i|
  # 10投目の処理
  if i == 9
    point += if current_frame[0] == 10 && next_frame[0] == 10
               20 + frames.last.sum
             elsif current_frame.sum == 10
               10 + next_frame.sum
             else
               current_frame.sum
             end
    break
  end

  point += if current_frame[0] == 10 # ストライクの処理
             if next_frame[0] == 10
               current_frame[0] + next_frame[0] + frames[i + 2][0]
             else
               current_frame[0] + next_frame.sum
             end
           elsif current_frame.sum == 10 # スペアの処理
             current_frame.sum + next_frame[0]
           else
             current_frame.sum
           end
end

puts point
