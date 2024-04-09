#!/usr/bin/env ruby
# frozen_string_literal: true

files = []
Dir.open('.').each_child do |f|
  files << f
end

files.reject! { |f| f.start_with?('.') }
files.sort!
cols = 3
rows = files.size / cols
rows += 1 if files.size % cols != 0
max_filename_len = files.max_by(&:length).length

def format_filename(filename, max_filename_length)
  filename.to_s + "#{' ' * (max_filename_length - filename.length)}  "
end

def display_ls(files, cols, rows, max_filename_len)
  rows.times do |i|
    tmp = 0
    cols.times do |j|
      next if files[i + j + tmp].nil?

      print format_filename(files[i + j + tmp], max_filename_len)
      tmp += rows - 1
    end
    print "\n"
  end
end

display_ls(files, cols, rows, max_filename_len)
