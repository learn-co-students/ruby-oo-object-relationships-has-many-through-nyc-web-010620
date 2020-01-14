class Customer
  attr_accessor :name, :age

  @@all = []

   def initialize(name, age)
      @name = name 
      @age = age 

      @@all << self 
   end 

   def self.all
      @@all
   end 

   # we are already within the Customer class, so we do not need to pass in the customer 
   def new_meal(waiter, total, tip = 0)
      Meal.new(waiter, self, total, tip)
   end 

   # returns an Array of Meal instances associated with this customer
   def meals
      Meal.all.select{|meal| meal.customer == self}
   end 

   # returns an Array of Waiter instances associated with this customer's meals
   def waiters
      self.meals.map{|meal| meal.waiter}
   end 

end