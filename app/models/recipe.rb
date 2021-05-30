class Recipe < ApplicationRecord
    validates :address,{presence: true} #空欄
end
