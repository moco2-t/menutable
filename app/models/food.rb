class Food < ApplicationRecord
    has_many :ingredients
    has_ancestry
end
