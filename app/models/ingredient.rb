class Ingredient < ApplicationRecord
    has_many :foods
    has_many :recipes
    validates :food_id,:amount, {presence:true} #空欄
end
