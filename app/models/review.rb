class Review < ApplicationRecord
    validates :review, presence: true
    belongs_to :cleaner
end
