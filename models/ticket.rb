require_relative('../db/sql_runner')

class Ticket

  attr_reader :id, :film_id, :customer_id

  def initialize(options)
    @id = options['id'].to_i
    @film_id = options['film_id'].to_i
    @customer_id = options['customer_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id) VALUES (#{@film_id}, #{@customer_id}) RETURNING *"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  def update()
    if @id
      sql = "UPDATE tickets SET film_id = #{@film_id}, customer_id = #{@customer_id} WHERE id = #{@id}"
      SqlRunner.run(sql)
    else
      save()
    end
  end

  def film
    sql = "SELECT * FROM films WHERE id = #{@film_id}"
    return Film.map_item(sql)
  end

  def customer
    sql = "SELECT * FROM customers WHERE id = #{@customer_id}"
    return Customer.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    return Ticket.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    tickets = SqlRunner.run(sql)
    result = tickets.map {|ticket|Ticket.new(ticket)}
    return result
  end

end