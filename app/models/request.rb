class Request < ApplicationRecord


    enum status: {pending: 0, accepted: 1, denied: 2}


end
