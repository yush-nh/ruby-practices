#!/usr/bin/env ruby
# frozen_string_literal: true

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

frames = shots.each_slice(2).to_a

point = 0.upto(9).sum do |i|
  current_frame = frames[i]
  next_frame = frames[i + 1]
  after_next_frame = frames[i + 2]
  strike = current_frame[0] == 10
  spare = !strike && current_frame.sum == 10

  if strike
    if next_frame[0] == 10
      20 + after_next_frame[0]
    else
      10 + next_frame.sum
    end
  elsif spare
    10 + next_frame[0]
  else
    current_frame.sum
  end
end

puts point
