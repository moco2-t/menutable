class Food < ApplicationRecord
    has_ancestry
    has_many :ingredinets
    validates :name,:ancestry, {presence:true}　#空欄

end
