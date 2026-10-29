# db/seeds/categories.rb

puts "Criando categorias..."

categories = [
  "Cultura",
  "Passeio",
  "Gastronomia",
  "Natureza",
  "Praia",
  "História"
]

categories.each do |cat_name|
  Category.find_or_create_by!(name: cat_name)
end

puts "#{Category.count} categorias prontas."