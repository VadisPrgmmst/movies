#encoding: UTF-8

file_path = File.dirname(__FILE__) + "./lesson2/#{ARGV.join}"

if !File.exist?(file_path) || ARGV.empty?
  file_path = File.dirname(__FILE__) + './lesson2/movies.txt'
end

File.open(file_path) do |file|
  file.readlines.each do |line|
    info_movie = line.split('|')
    puts "#{info_movie[1]} <#{'*' * info_movie[7][2].to_i}>"
  end
end
