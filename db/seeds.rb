# db/seeds.rb

puts "== Iniciando Seeds =="

puts "Limpando dados antigos..."
PoiCategory.destroy_all
Poi.destroy_all
User.destroy_all
Category.destroy_all

require_relative 'seeds/users'
require_relative 'seeds/categories'
require_relative 'seeds/pois'

puts "== Seeds concluídos com sucesso! =="