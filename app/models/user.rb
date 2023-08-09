class User < ApplicationRecord

    has_many :requests
    has_many :reviews


    has_secure_password



    validates :name, presence: true
    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create
    validates :password, length: {minimum: 4}


end
