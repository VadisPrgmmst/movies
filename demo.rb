# encoding: UTF-8

require_relative 'movie'
require_relative 'movie_collection'

abort "Collection not found" unless File.exist?('./movies.txt')

movies = MovieCollection.new('./movies.txt')

puts movies.all

puts 
puts movies.sort_by(:date)

puts 
puts movies.filter(genre: 'Comedy')

puts
puts movies.stats(:director)

puts
puts movies.all.first.actors

puts
begin
  puts movies.all.first.has_genre?('Tragedy')
rescue Exception => e
  puts e
end



