class Cleaner < ApplicationRecord
   has_secure_password
   has_many :reviews

   attribute :rating, :integer

   has_many :requests





    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create

    def avg_score
        return 0 unless reviews.count.positive?
        reviews.average(:score).round(2).to_f
    end
end
