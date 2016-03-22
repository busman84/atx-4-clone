class Song

  attr_accessor :name, :artist, :album, :url

  def initialize(name, artist, album, url)
    @name = name
    @artist = artist
    @album = album
    @url = url
  end

  def print
    puts "#{@name} – #{@album}"
  end

end
