require "pry"
require_relative './customer.rb'
require_relative './meal.rb'

class Waiter
    attr_accessor :name, :year_of_experience
    @@all = []

    def initialize(name, year_of_experience)
        @name = name
        @year_of_experience = year_of_experience

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer,total,tip)
        Meal.new(self,customer,total,tip)
    end

    def meals
        Meal.all.select do |food|
            food.waiter == self
        end
    end
    
    def best_tipper
        meal_with_highest_tip = self.meals.max_by do |food|
            food.tip
        end
        meal_with_highest_tip.customer
    end
        

end