class Waiter
   attr_accessor :name, :years_of_experience 

  @@all = []

   def initialize(name, years_of_experience)
      @name = name 
      @years_of_experience = years_of_experience

      @@all << self 
   end 

   def self.all
      @@all
   end 

   # initializes a meal using the current Waiter instance, a provided Customer instance and a total and tip
   def new_meal(customer, total, tip = 0)
      Meal.new(self, customer, total, tip)
   end 

   # returns an Array of Meal instances associated with this waiter
   def meals
      Meal.all.select{|meal| meal.waiter == self}
   end 

   # returns the Customer instance associated with the meal that received the largest tip
   def best_tipper
      best_tipped_meal = meals.max do |meal_a, meal_b|
         meal_a.tip <=> meal_b.tip
      end
       
      best_tipped_meal.customer
   end
end 