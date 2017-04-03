class MovieCollection

  def initialize file
  	@file = file
    @collection = init_collection
  end

  def all
   @collection
  end

  def sort_by method
    @collection.sort_by{|m| m.send method}
  end

  def filter option
  	option.reduce(@collection) do |result,(filter,pattern)| 
  		result.find_all{|m| m.match_filter?(filter,pattern)}
  	end
  end

  def stats method
    @collection.flat_map(& method).sort.group_by(&:itself).
      map{|k,v| [k,v.length]}.to_h
  end

  def available_genres
  	@collection.flat_map(&:genre).uniq
  end

  def init_collection
    File.readlines(@file).map{|l| Movie.new(l.split('|'), self)}
  end
  
end