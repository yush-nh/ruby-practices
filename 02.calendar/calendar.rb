#!/usr/bin/env ruby
require 'date'
require 'optparse'

def display_calendar(month, year)
  first_day = Date.new(year, month, 1)
  last_day = Date.new(year, month, -1)
  
  puts "      #{month}月 #{year}"
  puts "日 月 火 水 木 金 土"
  print "   " * first_day.wday

  (first_day..last_day).each do |date|
    print "#{date.day} ".rjust(3)
    puts if date.saturday?
  end

  # 最後に%が表示されるため改行を用いて対処
  puts ""
end

# オプションの設定
options = {}

opt = OptionParser.new
opt.on("-y year", Integer) { |year| options[:year] = year }
opt.on("-m month", Integer) { |month| options[:month] = month }
opt.parse!(ARGV)

year = options[:year] || Date.today.year
month = options[:month] || Date.today.month

# 月のバリデーション
if month > 12 || month < 1
  puts "月は1~12の範囲で指定してください"
  exit
end

display_calendar(month, year)
