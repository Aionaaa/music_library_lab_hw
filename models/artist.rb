require("pg")
require_relative("../db/sql_runner")
require_relative("album")

class Artist

  attr_reader(:id, :name)

  def initialize ( options )
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

end
