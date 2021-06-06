class Food < ApplicationRecord
    has_ancestry
    has_many :ingredients
    validates :name, presence: true #空欄

end
