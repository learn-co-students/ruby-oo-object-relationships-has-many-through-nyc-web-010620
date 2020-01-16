class Waiter
 
    attr_accessor :name, :yrs_experience
   
    @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def self.all
      @@all
    end
   
    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end
    
    def meals
        Meal.all.select do |meal|
            meal.waiter ==self
        end 
    end

    def customer
        self.meals.map do |meal|
            meal.customer
        end
    end 

    def best_tipper
        tipped_meal = self.meals.max do |meal_1, meal_2|
            meal_1.tip <=> meal_2.tip
        end
        tipped_meal.customer
    end

  end