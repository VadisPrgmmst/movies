#encoding: UTF-8
require 'csv'
require 'ostruct'
require 'date'

def show_movies(movies)
  movies.map{ |m|
    m.title + " (" + m.release + "; " +
    m.genre.gsub(',','/') + ") - " + m.time
  }.join("\n")
end

abort 'File not found' unless File.exist?('./movies.txt')

HEADER = %w(link title year country release genre time rating director stars)

movies = CSV.read(
  './movies.txt',
  col_sep: '|',
  headers: HEADER,
).map{|row|OpenStruct.new(row.to_h)}

puts show_movies(movies.select{|m| m.time.to_i}.last(5))

puts
puts show_movies(
  movies.select{|m| m.genre.include?('Comedy')}.
    sort_by(&:release).first(10)
)

puts
puts movies.map(&:director).uniq.sort_by{|m| m.split(' ').last}

puts
puts movies.count{|m| m.country != 'USA'}

puts
movies.select{|m| m.release.size.eql?(10)}.
  sort_by{|m| Date.parse(m.release).mon}.
  map{|m|Date.parse(m.release).strftime("%B")}.
  group_by(&:itself).each{|k,v| puts "#{k}: #{v.size}"}
