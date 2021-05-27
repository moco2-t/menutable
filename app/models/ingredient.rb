class Ingredient < ApplicationRecord
    has_many :foods
    validates :food_id,:amount, {presence:true}
end
