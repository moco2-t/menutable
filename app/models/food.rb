class Food < ApplicationRecord
    has_ancestry
    has_many :ingredients
end
