class Task < ApplicationRecord
    enum name: {
      'Gardening': 1,
      'Laundry': 2,
      'House Cleaning': 3
    }
  end
  