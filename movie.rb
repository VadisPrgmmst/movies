require_relative 'movie_collection'

class Movie

  attr_reader :link, :title, :date, :director

  def initialize(movie, collection)
    @link,
    @title,
    @year,
    @country,
    @date,
    @genre,
    @time,
    @rating,
    @director,
    @actors = movie.values_at(0..-1)
    @collection = collection
  end

  def genre
    @genre.split(',')
  end

  def genres
    @collection.available_genres
  end

  def time
    @time.to_i
  end

  def year
    @year.to_i
  end

  def rating
    @rating.to_f
  end

  def actors
    @actors.chomp.split(',')
  end

  def has_genre? gen
    raise ArgumentError.new("Такой жарнр отсутсвует в списке жанров") unless genres.include? gen
    @genre.include? gen
  end

  def to_s
    "\"#{title}\" (#{year}; #{genre.join('/')}; #{time} min.)"
  end

  def inspect
    "<#{self.class}: \"#{title}\">"
  end

  def match_filter?(filter, pattern)
    value = self.send(filter)

    value.is_a?(Array) ? value.include?(pattern) : (pattern === value)
  end

end
