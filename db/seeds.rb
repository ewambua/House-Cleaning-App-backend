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
