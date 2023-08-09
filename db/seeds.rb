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
  Cleaner.create(cleaner_data)
end

# Create tasks
task1 = Task.create(name: 'Gardening', description: 'Take care of the garden and plants', duration: 120)
task2 = Task.create(name: 'House Cleaning', description: 'Clean and organize the house', duration: 90)
task3 = Task.create(name: 'Laundry', description: 'Wash and fold laundry', duration: 60)

# Retrieve existing cleaner and user records
cleaner = Cleaner.find_by(name: 'Alice Johnson')  # Use the correct name for the cleaner
user = User.find_by(name: 'John')                # Use the correct name for the user

# Create requests with associated tasks
request1 = Request.create(user: user, cleaner: cleaner, task_data: [task1.id, task2.id])
request2 = Request.create(user: user, cleaner: cleaner, task_data: [task2.id, task3.id])

puts 'Seed data for requests and tasks created!'
