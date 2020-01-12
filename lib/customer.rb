class Customer
    @@all = []

    attr_accessor :age, :meals, :waiters
    attr_reader :name

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
        @meals = []
        @waiters = []
        return
    end 

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        new_meal = Meal.new(waiter,self,total, tip)
        @waiters << waiter
        @meals << new_meal
        waiter.meals << new_meal
        #puts waiter
    end

end