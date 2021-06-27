class Recipe < ApplicationRecord
    has_many :meals
    has_many :ingredients
    validates :name,:keyword,:address, {presence: true} #空欄
end
