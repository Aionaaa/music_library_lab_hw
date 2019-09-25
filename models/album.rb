require("pg")
require_relative("../db/sql_runner")
require_relative("artist")

class Album

attr_reader(:id, :artist_id)
attr_accessor(:name, :genre)

def initialize( options )
  @id = options['id'].to_i() if options['id']
  @name = options['name']
  @genre = options['genre']
  @artist_id = options['artist_id'].to_i()
end

def save()
  sql = "INSERT INTO albums(
  name,
  genre,
  artist_id
  ) VALUES ($1, $2, $3)
  RETURNING id"
  values = [@name, @genre, @artist_id]
  @id = SqlRunner.run(sql, values)[0]['id'].to_i()
end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album)}
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_hash = results[0]
    artist = Artist.new(artist_hash)
    return artist
  end

end
