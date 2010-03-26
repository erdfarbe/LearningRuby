=begin rdoc
 CSV Generator
 USAGE: 
 $ ruby csv_gen.rb arg1 
 e.g. $ ruby csv_gen.rb 1700.csv

 $ tree
 .
 |-- 1700
 |   |-- 03
 |   |   |-- 30
 |   |   |   |-- DSC121.jpg
 |   |   |   |-- DSC122.jpg
 |   |   |-- 31
 |   |   |   |-- DSC123.jpg
 |   |   |   |-- DSC124.jpg
 |   |   |   |-- DSC125.jpg

 create csv file contains:

 DSC121.jpg; nil; 2009-03-30; nil;
 DSC122.jpg; nil; 2009-03-30; nil;
 DSC123.jpg; nil; 2009-03-31; nil;
 DSC124.jpg; nil; 2009-03-31; nil;
 DSC125.jpg; nil; 2009-03-31; nil;
=end

require 'csv'

def set_year
  @csvfile = "1794.txt"
  @csv
end

def write_csv
  File.open(@csvfile, 'wb')
end

def search_through_dirs
  jahr = @csvfile.sub(/.txt/,"")
  Dir.chdir("#{jahr}/1/1") # in den Ordner mit dem Jahrgang wechseln
  
#  if csvfile.to_s.empty? # Wenn Dir Unterordner -> dann Dir.chdir("Unterordner")
#    Dir.chdir
#  if # Wenn Unterordner weiteren Unterordner -> dann Dir.chdir("Unterunterordner")

  @a = Dir.glob("*").to_s.gsub(/.tif/,"; ").to_a # List all files in current directory and copy the elements in an array and delete characters ".tif"
  @b = p @a
end

def write_into_csv
  CSV::Writer.generate(@csvfile) do |csv|
    csv << ['Newspapername', 'Ausgabe', 'Jahr', 'Monat', 'Tag', 'Ausgabetyp']
    csv << @b
  end
#  p @csvfile 
#  
  @csvfile.close
end

set_year
write_csv
search_through_dirs
write_into_csv

# #A. Create an array
# names = %w[chris sandy josie billy suzie]
#  
# #B. Find the length of the array and iterate through it 
# names.length.times do |i|
#   puts i.to_s + " " + names[i]
# end