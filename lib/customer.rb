require_relative './meal.rb'
require_relative './waiter.rb'

class Customer
  attr_reader :name, :age
    @@all = []

    def initialize(name,age)
        @name = name
        @age = age

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter,total,tip)
        Meal.new(waiter,self,total,tip)
    end

    def meals
        Meal.all.select do |food|
            food.customer == self
        end
    end

    def waiters
        self.meals.map do |servers|
            servers.waiter
        end
    end

end