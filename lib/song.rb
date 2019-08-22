class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(name)
    Song.all.detect{|song| song.name == name}
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      return song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|alpha| alpha.name}
  end

  def self.new_from_filename(filename)
  end

end
