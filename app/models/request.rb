class Request < ApplicationRecord


    validates :status, presence: true
    validates :user_id, presence: true
    enum status: {pending: 0, accepted: 1, denied: 2, done: 3}


end
