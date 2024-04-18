#!/usr/bin/env ruby
# frozen_string_literal: true

files = Dir.glob('*').sort

def format_filename(filename, max_filename_len)
  filename.ljust(max_filename_len + 2)
end

def sort_files(files, cols)
  rows = files.size.ceildiv(cols)
  sliced_files = files.each_slice(rows)

  sliced_files.map { |arr| arr + [nil] * (rows - arr.size) }.transpose
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
