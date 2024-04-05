#!/usr/bin/env ruby
require 'date'
require 'optparse'

def display_calendar(year, month)
  first_day = Date.new(year, month, 1)
  last_day = Date.new(year, month, -1)
  puts "      #{month}月 #{year}"
  puts "日 月 火 水 木 金 土"
  print "   " * first_day.wday

  (first_day..last_day).each do |date|
    print "#{date.day.to_s.rjust(2)} "
    puts if date.wday == 6
  end

  # 最後に%が出ないように改行
  puts
end

# コマンドオプションの設定
options = {}
opt = OptionParser.new
opt.on("-y year", Integer) { |year| options[:year] = year }
opt.on("-m month", Integer) { |month| options[:month] = month }
opt.parse!(ARGV)

year = options[:year] || Date.today.year
month = options[:month] || Date.today.month

if month < 1 || month > 12
  puts "月は1月から12月の間で入力してください"
  exit
end

display_calendar(year, month)
