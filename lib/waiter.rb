class Waiter

    attr_reader :name
    attr_accessor :experience

    @@all = []

    def initialize(name,experience)
        @name = name 
        @experience = experience
        @@all.push(self)
    end 

    def self.all
        @@all
    end 

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end 
    end 

    def best_tipper
        higest_tipped_meal = ""
        tip = 0
        Meal.all.each do |meal|
            if meal.tip > tip 
            tip = meal.tip     
            higest_tipped_meal = meal.customer
            end 
        end 
        higest_tipped_meal
    end 

   
end