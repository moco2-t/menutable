class Shopping < ApplicationRecord
    validates :start_date, presence: true
    validates :end_date, presence: true
end
