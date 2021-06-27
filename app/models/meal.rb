class Meal < ApplicationRecord
    validates :start_time,:recipe_id, {presence:true} 
    
    

end
