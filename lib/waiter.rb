class Waiter
    @@all = []

    attr_accessor :yoe, :meals
    attr_reader :name

    def initialize(name, yoe)
        @@all << self
        @meals = []
        return
    end   
    
    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        new_meal = Meal.new(self, customer, total, tip)
        @meals << new_meal
    end

    def best_tipper
        highest_tip = Meal.all.map{|x| x.tip}.max
        Meal.all.each{ |meal|
            if meal.tip == highest_tip
                return meal.customer
            end
        }
    end

end