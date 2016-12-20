#encoding: UTF-8

path = File.dirname(__FILE__) + './lesson2/movies.txt'

if File.exist? path
  puts 'file exist now U can process the file'
else
  puts 'file not found'
  exit
end

file = File.read(path)
puts file
