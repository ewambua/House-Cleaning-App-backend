# db/seeds.rb

# Cleaners
cleaners_data = [
  { name: 'Alice Johnson', rating: 4.5, email: 'alice@example.com', password: 'password' },
  { name: 'Bob Smith', rating: 4.0, email: 'bob@example.com', password: 'password' },
  { name: 'Charlie Brown', rating: 4.8, email: 'charlie@example.com', password: 'password' },
  { name: 'David Miller', rating: 4.2, email: 'david@example.com', password: 'password' },
  { name: 'Emily Davis', rating: 4.7, email: 'emily@example.com', password: 'password' },
  { name: 'Frank Wilson', rating: 4.9, email: 'frank@example.com', password: 'password' },
  { name: 'Grace Taylor', rating: 4.6, email: 'grace@example.com', password: 'password' },
  { name: 'Henry Harris', rating: 4.3, email: 'henry@example.com', password: 'password' },
  { name: 'Isabella Anderson', rating: 4.4, email: 'isabella@example.com', password: 'password' }
]

cleaners_data.each do |cleaner_data|
  Cleaner.find_or_create_by(email: cleaner_data[:email]) do |cleaner|
    cleaner.name = cleaner_data[:name]
    cleaner.rating = cleaner_data[:rating]
    cleaner.password = cleaner_data[:password]
    # Add other attributes as needed
  end
end

# Users
users_data = [
  { name: 'Michael Johnson', username: 'michaelj', email: 'michael@example.com', password: 'password' },
  { name: 'Emily Brown', username: 'emilyb', email: 'emily@example.com', password: 'password' },
  # Add more users here
]

users_data.each do |user_data|
  User.find_or_create_by(email: user_data[:email]) do |user|
    user.name = user_data[:name]
    user.username = user_data[:username]
    user.password = user_data[:password]
    # Add other attributes as needed
  end
end

# Requests
Request.create!(
  task_one: 'Dusting and vacuuming',
  task_two: 'Bathroom cleaning',
  task_three: 'Kitchen cleaning',
  status: 'pending',
  user: User.first,
  cleaner: Cleaner.first
)

Request.create!(
  task_one: 'Mopping and floor cleaning',
  task_two: 'Window cleaning',
  status: 'accepted',
  user: User.second,
  cleaner: Cleaner.second
)

# Reviews
Review.create!(
  review: 'John did a fantastic job cleaning my house. Everything looks spotless!',
  score: 5,
  rating: 4.5,
  user: User.first,
  cleaner: Cleaner.first
)

Review.create!(
  review: 'Alice is a thorough cleaner. She pays attention to detail and left my place sparkling clean.',
  score: 4,
  rating: 4.0,
  user: User.second,
  cleaner: Cleaner.second
)

# Add more requests and reviews here...

