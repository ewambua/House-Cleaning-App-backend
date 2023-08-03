class User < ApplicationRecord

    has_secure_password

    validates :name, presence: true
    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create


end
