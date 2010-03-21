# CSV Generator
# USAGE: 
# $ ruby csv_gen.rb arg1 
# e.g. $ ruby csv_gen.rb 1700.csv

# $ tree
# .
# |-- 1700
# |   |-- 03
# |   |   |-- 30
# |   |   |   |-- DSC121.jpg
# |   |   |   |-- DSC122.jpg
# |   |   |-- 31
# |   |   |   |-- DSC123.jpg
# |   |   |   |-- DSC124.jpg
# |   |   |   |-- DSC125.jpg

# create csv file contains:
#
# DSC121.jpg; nil; 2009-03-30; nil;
# DSC122.jpg; nil; 2009-03-30; nil;
# DSC123.jpg; nil; 2009-03-31; nil;
# DSC124.jpg; nil; 2009-03-31; nil;
# DSC125.jpg; nil; 2009-03-31; nil;

require 'csv'
require 'fileutils'
include FileUtils

def create_csv(csvfile)
  csvfile = File.open(csvfile, 'wb')
end

def write_in_csv
  
  FileUtils.cd("1881/1")
  Dir.foreach(".") {|f| x=File.stat(f) ; puts "1881-#{f}"}
  CSV::Writer.generate(csvfile) do |csv|
      csv << ['c1', nil, '', '"', "\r\n", 'c2']
    end
  
end
  

create_csv("kp.csv")

csvfile.close