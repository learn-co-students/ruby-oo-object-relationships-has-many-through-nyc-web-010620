require "pry"
require_relative "./meal.rb"
require_relative "./waiter.rb"

class Customer

attr_accessor :age     
attr_reader :name

@@all = []

  def initialize(name,age)
    @name = name 
    @age = age 
    @@all.push(self)
  end 

  def self.all
    @@all
  end 

  def new_meal(waiter, total, tip = 0)
    Meal.new(waiter,self,total,tip)
  end 

  def meals 
    Meal.all.select do |meal|
      meal.customer == self 
    end 
  end 

  def waiters
    meals.map do |meal|
      meal.waiter 
    end 
  end 

  

 

 

#   def initialize(waiter,customer,total,tip)
#     @waiter = waiter 
#     @customer = customer 
#     @total = total 
#     @tip = tip 
#     @@all.push(self)
# end 

end