class Waiter

    attr_accessor :name, :years_exp

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, years_exp)
        @name = name
        @year_exp = years_exp

        @@all << self
    end

    def new_meal(customer, total, tip=0)
       Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal|
            meal.waiter == self
        }
    end

    def best_tipper
        best_tip = Meal.all.max_by { |meal| meal.tip }
        best_tip.customer
    end
end