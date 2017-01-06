#encoding: UTF-8

path = File.dirname(__FILE__) + './movies/' + (ARGV.first || 'movies.txt')

if !File.exist? path
  puts 'File not found'
  exit
end

file = File.new path

keys = %i(link title year country release genre time rating director stars)

file.readlines.map{|line| keys.zip(line.split('|')).to_h}

file.close
