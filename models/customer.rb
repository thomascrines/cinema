require_relative('../db/sql_runner')

class Customer

  attr_reader :id, :name, :funds

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING *"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def update()
    if @id
      sql = "UPDATE customers SET name = '#{@name}' funds = #{@funds} WHERE id = #{@id}"
      SqlRunner.run(sql)
    else save()
    end
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = film.id WHERE ticket.customer_id = #{@id}"
    return Film.map_items(sql)
  end

  def self.all
    sql = "SELECT * FROM customers"
    return Customer.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    customers = SqlRunner.run(sql)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end

end