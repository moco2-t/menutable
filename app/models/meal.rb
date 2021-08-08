class Meal < ApplicationRecord
    def start_time
        self.start_date
    end
end
