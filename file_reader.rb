#encoding: UTF-8
require 'csv'

abort 'File not found' unless File.exist?('./movies.txt')

HEADER = %w(link title year country release genre time rating director stars)

movies = CSV.read(
  './movies.txt',
  col_sep: '|',
  headers: HEADER,
)
