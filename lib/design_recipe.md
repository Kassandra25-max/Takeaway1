# {TAKEAWAY ONE}

# --USER STORIES-----------------

>As a customer
>So that I can check if I want to order something
>I would like to see a list of dishes with prices.

>As a customer
>So that I can order the meal I want
>I would like to be able to select some number of several available dishes.

>As a customer
>So that I can verify that my order is correct
>I would like to see an itemised receipt with a grand total.

# Use the twilio-ruby gem to implement this next one. You will need to use doubles too.
>As a customer
>So that I am reassured that my order will be delivered on time
>I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.


# --DESIGN----------------------


```ruby

class Dish #initialized with name and price as strings
  def initialize(name, price)
    #...
  end

  def name
    # returns Dish name
  end

  def price
    # returns Dish price
  end
end

class Menu
  def initialize
    #...
  end

  def add(dish)
    # pushes a Dish object to a list
  end

  def list
    # returns a list of Dishes
  end

  def show_menu
    # returns a list of dishes as strings
  end
end

class Order # is initialized with a menu object
  def initialize(menu)
    #...
  end

  def choose(dish)
    # pushes a Dish object from menu to a list 
  end

  def ordered
    # returns a list of inputted dishes
  end

  def total
    # returns a string with the total cost of the order
  end
end

class Receipt
  def initialize(order)
    #...
  end

  def summary
    # returns a list of ordered items and total cost as strings
  end
end

```

# --TESTS----------------------

# Integration: 
``` ruby

#1
# orders two dishes from a menu containing three dishes
menu = Menu.new
dish_1 = Dish.new("Fries", "£3.50")
dish_2 = Dish.new("Chicken wings", "£9.60")
dish_3 = Dish.new("Seabass and Mash", "£19.00")
menu.add(Fries)
menu.add(Chicken wings)
menu.add(Seabass and Mash)
order = Order.new(menu)
order.choose(Chicken wings)
order.choose(Seabass and Mash)
receipt = Receipt.new(order)
receipt.summary # => "Fries: £3.50", "Chicken wings: £9.60" "Seabass and Mash: £19.00", Total: £38.60


```

# Dish Unit Tests
```ruby
#1
# instantiated with name
dish = Dish.new("Fries", "£3.50")
dish.name #=> "Fries"

#2
## instantiated with price
dish = Dish.new("Fries", "£3.50")
dish.price #=> "£3.50"
```

# Menu Unit Tests
```ruby
#1 
# add dish objects to the menu and return the menu as a list of strings
menu = Menu.new
menu.add(Dish.new("Fries", "£3.50"))
menu.add(Dish.new("Chicken wings", "£9.60"))
menu.add(Dish.new("Seabass and Mash", "£19.00"))
menu.list #=> ["Fries: £3.50", "Chicken wings: £9.60", "Seabass and Mash: £19.00"]

#2
# call list method on an empty menu
menu = Menu.new
menu.list #=> raise error "There are no dishes on this menu yet!"
```

# Order Unit Tests
```ruby
#1
# returns the dish ordered from the menu
order = Order.new(menu)
order.choose("Fries")
order.ordered # => ["Fries"]

#2
# returns all dishes ordered from the menu
order = Order.new(menu)
order.choose("Fries")
order.choose("Chicken wings")
order.choose("Seabass and Mash")
order.ordered # => ["Fries", "Chicken wings", "Seabass and Mash"]

#3
# throws an error if ordered is called on an empty order
order = Order.new(menu)
order.ordered # => raise error "You haven't ordered anything yet!"

#4
# returns the total value of ordered dishes
order = Order.new(menu)
order.choose("Chickem wings")
order.total # => "£9.60"
```
# Receipt Unit Tests
```ruby
#1
# returns a receipt printed with items ordered with total price
receipt = Receipt.new(order)
receipt.summary #=> "[Fries: £3.50", "Chicken wings: £9.60" "Seabass and Mash: £19.00"] Total: £38.60"
```