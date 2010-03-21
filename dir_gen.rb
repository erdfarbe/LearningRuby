# Directory Generator
# USAGE: 
# ruby directory_gen.rb arg1 
# e.g. ruby directory_gen.rb 1700
# OUTPUT: 12 directories each with 31 subdirectories

require 'fileutils'
include FileUtils

def create_dir(jahr)
  jahr = ARGV.to_s
  FileUtils.mkdir jahr
  FileUtils.cd(jahr)
  i = 1
  while i <= 12 # creates 12 Directories
    FileUtils.mkdir i.to_s
    FileUtils.cd(i.to_s)
    1.upto(31) { |j| FileUtils.mkdir j.to_s } # creates 31 Directories inside 
    FileUtils.cd('../')
    i += 1
  end
end

create_dir(ARGV)