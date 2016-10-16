require_relative('../db/sql_runner')

class Film

  attr_reader :id, :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) RETURNING *"
    film = SqlRunner.run(sql).first
    @id = film['id']
  end

  def update()
    if @id
      sql = "UPDATE film SET title = '#{@title}', price = #{@price} WHERE id = #{@id}"
      SqlRunner.run(sql)
    else save() 
    end
  end
 
  def self.all()
    sql = "SELECT * FROM films"
    SqlRunner.run(sql)
    return Film.map_items(sql) 
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    films = SqlRunner.run(sql)
    result = films.map {|film|Film.new(film)}
    return result
  end

end