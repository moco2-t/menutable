class Meal < ApplicationRecord
    validates :start_time,:recipe_id, {presence:true} 
    belongs_to :recipes
end
