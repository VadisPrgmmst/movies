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


  def filter hash
    @collection.select{|m| m.send(hash.keys.first).include? hash[:key]}
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
