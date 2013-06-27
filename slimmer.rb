#!/usr/bin/env ruby

require 'listen'
require 'slim'


# if source folder specified
if ARGV[0]
  Listen.to!(ARGV[0], :filter => /\.slim$/) do |modified, added| 
    modified.each do |modified_file|
      system("slimrb #{ARGV[0]}/#{ modified_file} > #{ARGV[0]}/#{modified_file.gsub('.slim','')}.html")
    end
  end
end
