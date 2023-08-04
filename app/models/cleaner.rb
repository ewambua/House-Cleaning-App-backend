class Cleaner < ApplicationRecord
    has_many :reviews
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create
end
