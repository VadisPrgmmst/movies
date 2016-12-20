#encoding: UTF-8



path = File.dirname(__FILE__) + './lesson2/movies.txt'

if File.exist? path
  puts 'file exist now U can process the file'
else
  puts 'file not found'
  exit
end

File.open(path) do |file|

  found_title = nil

  file.readlines.each do |line|
    title = line.split('|')[1]
    rating = line.split('|')[7]

    if line.include? ARGV.join(' ')
      found_title = "#{title} <#{'*' * rating[2].to_i}>"
    end
  end

  if found_title != nil
    puts found_title
  else
    puts 'Movie with this titls not found'
  end
end
