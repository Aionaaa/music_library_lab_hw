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

end
