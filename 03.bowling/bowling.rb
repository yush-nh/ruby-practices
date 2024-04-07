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

point = 0
frames.each do |frame|
  if frame[0] == 10
    point += 30
  elsif frame.sum == 10
    point += frame[0] + 10
  else
    point += frame.sum
  end
end

puts point
