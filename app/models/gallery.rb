class Gallery

  attr_reader :name, :city

  @@all = []

  def initialize(name, city)
    @name = name
    @city = city

    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.find_all { |painting| painting.gallery == self }
  end

  def artists
    paintings.map(&:artist)
  end

  def artist_names
    artists.map(&:name)
  end

  def most_expensive_painting
    paintings.max_by { |painting| painting.price }
  end

end
