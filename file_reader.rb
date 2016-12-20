#encoding: UTF-8

path = File.dirname(__FILE__) + './lesson2/movies.txt'

if File.exist? path
  puts 'file exist now U can process the file'
else
  puts 'file not found'
  exit
end

File.open(path) do |file|
  file.readlines.each do |line|
    title = line.split('|')[1]
    rating = line.split('|')[7]

    if title.include? 'Max'
      puts "#{title} #{rating}"
    end
  end
end
