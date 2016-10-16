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

  def customers()
    sql = "SELECT c.* FROM customers c INNER JOIN tickets t ON t.customer_id = c.id WHERE film_id = #{@id}"
    return Customer.map_items(sql)
  end

  def attendance()
    sql = "SELECT t.id from tickets t WHERE t.film_id = #{@id}"
    tickets = Film.map_items(sql)
    return tickets.count
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

  def self.map_item(sql)
    result = Film.map_items(sql)
    return result.first
  end

end