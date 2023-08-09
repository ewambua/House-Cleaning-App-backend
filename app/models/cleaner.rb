class Cleaner < ApplicationRecord

   has_secure_password
   has_many :reviews

   attribute :rating, :integer

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create
end
