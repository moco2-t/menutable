class Recipe < ApplicationRecord
    validates :name,:keyword,:address, {presence: true} #空欄
end
