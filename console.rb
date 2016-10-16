require_relative('models/ticket')
require_relative('models/customer')
require_relative('models/film')
require('pry-byebug')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({'name' => "Gilbert", 'funds' => 24.99})
customer1.save()
customer2 = Customer.new({'name' => "Gregory", 'funds' => 24.99})
customer2.save()
customer3 = Customer.new({'name' => "Tonia", 'funds' => 24.99})
customer3.save()
customer4 = Customer.new({'name' => "Theresa", 'funds' => 24.99})
customer4.save()
customer5 = Customer.new({'name' => "Frankie", 'funds' => 24.99})
customer5.save()
customer6 = Customer.new({'name' => "Jennifer", 'funds' => 24.99})
customer6.save()
customer7 = Customer.new({'name' => "Percy", 'funds' => 24.99})
customer7.save()
customer8 = Customer.new({'name' => "Carleen", 'funds' => 24.99})
customer8.save()


film1 = Film.new({'title' => "Inferno", 'price' => 10.99})
film1.save()
film2 = Film.new({'title' => "The Girl on the Train", 'price' => 7.99})
film2.save()
film3 = Film.new({'title' => "Trolls", 'price' => 5.99})
film3.save()
film4 = Film.new({'title' => "Storks", 'price' => 5.99})
film4.save()
film5 = Film.new({'title' => "Bridget Jones''s Baby", 'price' => 7.99})
film5.save()
film6 = Film.new({'title' => "Deepwater Horizon", 'price' => 8.99})
film6.save()
film7 = Film.new({'title' => "The Magnificent 7", 'price' => 7.99})
film7.save()
film8 = Film.new({'title' => "Finding Dory", 'price' => 5.99})
film8.save()

ticket01 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id})
ticket01.save()
ticket02 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer8.id})
ticket02.save()
ticket03 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer7.id})
ticket03.save()
ticket04 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id})
ticket04.save()
ticket05 = Ticket.new({'film_id' => film8.id, 'customer_id' => customer1.id})
ticket05.save()
ticket06 = Ticket.new({'film_id' => film8.id, 'customer_id' => customer3.id})
ticket06.save()
ticket07 = Ticket.new({'film_id' => film7.id, 'customer_id' => customer6.id})
ticket07.save()
ticket08 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer4.id})
ticket08.save()
ticket09 = Ticket.new({'film_id' => film6.id, 'customer_id' => customer5.id})
ticket09.save()
ticket10 = Ticket.new({'film_id' => film4.id, 'customer_id' => customer3.id})
ticket10.save()
ticket11 = Ticket.new({'film_id' => film5.id, 'customer_id' => customer4.id})
ticket11.save()
ticket12 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer8.id})
ticket12.save()
ticket13 = Ticket.new({'film_id' => film4.id, 'customer_id' => customer1.id})
ticket13.save()
ticket14 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id})
ticket14.save()
ticket15 = Ticket.new({'film_id' => film8.id, 'customer_id' => customer5.id})
ticket15.save()
ticket16 = Ticket.new({'film_id' => film5.id, 'customer_id' => customer6.id})
ticket16.save()

binding.pry
nil