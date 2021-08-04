class Ingredient < ApplicationRecord
    has_many :foods
    has_many :recipes
    validates :amount, {presence:true} #空欄
end
