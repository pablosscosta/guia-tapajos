# db/seeds/users.rb

puts "Limpando usuários antigos..."
User.destroy_all

users_data = [
  {
    name: "Administrador",
    email: "admin@email.com",
    role: "admin", 
    password: "password123"
  },
  {
    name: "Parceiro",
    email: "parceiro@email.com",
    role: "partner",
    password: "password123"
  },
  {
    name: "Usuário Comum",
    email: "usuario@email.com",
    role: "user",
    password: "password123"
  }
]

users_data.each do |user_attrs|
  User.create!(
    name: user_attrs[:name],
    email: user_attrs[:email],
    role: user_attrs[:role],
    password: user_attrs[:password],
    password_confirmation: user_attrs[:password]
  )
  puts "✓ Usuário criado: #{user_attrs[:email]}"
end

puts "\n#{User.count} usuários cadastrados com sucesso!"