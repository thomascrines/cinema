require_relative('../db/sql_runner')
require_relative('data_mapper')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

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
    sql = "SELECT f.* FROM films f INNER JOIN tickets t ON t.film_id = f.id WHERE t.customer_id = #{@id}"
    return Film.map_items(sql)
  end

  def tickets()
    sql = "SELECT t.id FROM tickets t WHERE t.customer_id = #{@id}"
    return Ticket.map_items(sql)
  end

  # def money_owed()
  #   sql = "SELECT SUM(price) FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE tickets.customer_id = #{@id}"
  #   cost = Film.map_item(sql)
  # end

  def number_of_tickets()
    sql = "SELECT t.id FROM tickets t WHERE t.customer_id = #{@id}"
    tickets = Ticket.map_items(sql)
    return tickets.count
  end

  def self.all()
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
    # result = DataMapper.data_to_objects(self, result)
    return result
  end

  def self.map_item(sql)
    result = Customer.map_items(sql)
    return result.first
  end

end