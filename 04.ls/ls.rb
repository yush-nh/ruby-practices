#!/usr/bin/env ruby
# frozen_string_literal: true

files = Dir.entries('.').reject { |f| f.start_with?('.') }.sort

def format_filename(filename, max_filename_length)
  filename.to_s + "#{' ' * (max_filename_length - filename.length)}  "
end

def sort_files(files, cols)
  rows = files.size / cols
  rows += 1 if files.size % cols != 0
  sliced_files = files.each_slice(rows).to_a
  max_array_size = sliced_files.max_by(&:size).size

  sliced_files.map! { |arr| arr + [nil] * (max_array_size - arr.size) }.transpose
end

sorted_files = sort_files(files, 3)
max_filename_len = files.max_by(&:length).length

sorted_files.each do |rows|
  rows.each do |row|
    next if row.nil?

    print format_filename(row, max_filename_len)
  end
  print "\n"
end
