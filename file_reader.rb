#encoding: UTF-8

if !ARGV.empty?
  file_path = File.dirname(__FILE__) + "./lesson2/#{ARGV.join}"
else
  file_path = File.dirname(__FILE__) + "./lesson2/movies.txt"
end

if File.exist? file_path
  File.open(file_path) do |file|
    file.readlines.each do |line|
      info_movie = line.split('|')
      rating = info_movie[7]
            
      if rating[1].to_i < 9
        print "#{info_movie[1]} <#{'*' * rating[2].to_i}> "
      else
        print "#{info_movie[1]} <#{'*' * rating[2].to_i * 10}> "
      end
    end
  end
else
  puts "file not found"
end
