require 'listen'
require 'slim'


# if source folder specified
if ARGV[0]
  Listen.to!(ARGV[0], :filter => /\.slim$/) do |modified, added| 
    modified.each do |modified_file|
      system("slimrb --pretty #{modified_file} > #{modified_file.gsub('.slim','')}.html --trace")
    end
  end
end
