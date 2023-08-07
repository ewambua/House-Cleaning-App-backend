class Cleaner < ApplicationRecord
   has_secure_password

   has_many :requests
   has_many :reviews
   has_many :plans




    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create
end
