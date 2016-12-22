#encoding: UTF-8

file_path = File.dirname(__FILE__) + "./lesson2/" + (ARGV.first || '/movies.txt')

if !File.exist? file_path
  puts "file not found"
  exit
end

File.open(file_path) do |file|
  file.readlines.each do |line|
    title, rating = line.split('|').values_at(1, 7)
    stars = (rating.to_f - 8).round(1) * 10
    print "#{title} #{'*' * stars} "
  end
end
