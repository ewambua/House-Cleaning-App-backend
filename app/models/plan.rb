class Plan < ApplicationRecord


    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true
    validates :task_one, presence: true
    validates :task_two, presence: true
    validates :task_three, presence: true
end
