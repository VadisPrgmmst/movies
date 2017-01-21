#encoding: UTF-8

path = File.dirname(__FILE__) + './movies/' + (ARGV.first || 'movies.txt')

if !File.exist? path
  puts 'File not found'
  exit
end

file = File.new path

keys = %i(link title year country release genre time rating director stars)

movies = file.readlines.map{|line| keys.zip(line.split('|')).to_h}
file.close

long_movies = movies.sort_by{|movie| movie[:time].to_i}.last(5)
#показать 5 самых длынных фильмов
puts long_movies.map{|movie| movie[:title]}

puts

#10 комедий (первые по дате выхода)
puts movies.
  find_all{|movie| movie[:genre].include? 'Comedy'}.
  sort_by{|movie| movie[:release]}.map{|movie| movie[:title]}.first(10)

puts

#список всех режиссёров по алфавиту (без повторов!) — по фамилии
puts movies.
  map{|movie| movie[:director]}.uniq.
  sort_by{|director| director.split(' ').last}

puts

#количество фильмов, снятых не в США
puts movies.count{|movie| movie[:country] != 'USA'}
