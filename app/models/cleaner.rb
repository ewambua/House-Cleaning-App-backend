class Cleaner < ApplicationRecord
    has_many :plans
    has_many :reviews through :users
end
