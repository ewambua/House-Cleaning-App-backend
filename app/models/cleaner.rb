class Cleaner < ApplicationRecord


   has_many :requests
   has_secure_password
   has_many :reviews


    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create
end
