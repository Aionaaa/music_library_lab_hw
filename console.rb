require("pry")
require_relative("models/album")
require_relative("models/artist")

Album.delete_all()
Artist.delete_all()


artist1 = Artist.new({ "name" => "REM" })
artist1.save()

album1 = Album.new({ "name" => "Automatic for the People", "genre" => "Alternative Rock", "artist_id" => artist1.id()})
album1.save()

binding.pry
nil
