class Cleaner < ApplicationRecord
    has_many :reviews
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create

    def avg_score
        reviews.average(:score).round(2).to_f
    end
end
