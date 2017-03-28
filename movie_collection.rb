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
  	@collection.find_all{|m| m.match_filter?(option.keys.first, option.values.first)}
  end


  def stats method
    @collection.map(&(method)).group_by(&:itself).
      map{|k,v| [k,v.length]}.to_h
  end

  def available_genres
  	@collection.map(&:genre).flatten.uniq
  end

  def init_collection
    File.readlines(@file).map{|l| Movie.new(l.split('|'), self)}
  end
  
end
