class Request < ApplicationRecord

    belongs_to :user
    belongs_to :cleaner

    attribute :task_data, :json
    # validates :status, presence: true
    # validates :user_id, presence: true
    enum status: {pending: 0, accepted: 1, denied: 2, done: 3},_default: :pending


end
