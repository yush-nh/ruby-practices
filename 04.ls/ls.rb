#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

def format_filename(filename, max_width)
  filename.ljust(max_width + 2)
end

def sort_files(files, cols)
  rows = files.size.ceildiv(cols)
  sliced_files = files.each_slice(rows)

  sliced_files.map { |arr| arr + [nil] * (rows - arr.size) }.transpose
end

def ls(options)
  files = Dir.glob('*', options[:all] ? File::FNM_DOTMATCH : 0)

  sorted_files = sort_files(files, 3)
  max_width = files.max_by(&:length).length

  sorted_files.each do |rows|
    rows.each do |row|
      next if row.nil?

      print format_filename(row, max_width)
    end
    print "\n"
  end
end

# options settings
options = {}

opt = OptionParser.new
opt.on('-a', '--all') { |a| options[:all] = a }
opt.parse!(ARGV)

ls(options)
