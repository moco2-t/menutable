class Meal < ApplicationRecord
    validates :start_date ,presence: true
    def start_time
        self.start_date
    end
end
