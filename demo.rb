# encoding: UTF-8

require_relative 'movie'
require_relative 'movie_collection'

abort "Collection not found" unless File.exist?('./movies.txt')

movies = MovieCollection.new('./movies.txt')

#p movies.all.last(5)

#puts 
#puts movies.sort_by(:date)

#puts
puts movies.filter(title: "It's a Wonderful Life")
puts
puts movies.filter(title: /It's a Wonderful Life/)
puts
puts movies.filter(year: 2000..2001)
puts
puts movies.filter(actors: 'Bob Gunton')



#puts
#puts movies.stats(:director)

#puts
#puts movies.all.first.actors

#puts
#begin
  #puts movies.all.first.has_genre?('Tragedy')
#rescue Exception => e
  #puts e
#end