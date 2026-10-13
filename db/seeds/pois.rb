puts "Cadastrando Pontos de Interesse (POIs)..."

Poi.destroy_all

pois_data = [
  {
    name: "Praia de Alter do Chão",
    description: "Conhecida como o Caribe Amazônico, famosa por suas águas cristalinas e a Ilha do Amor.",
    category: "Praia",
    address: "Alter do Chão, Santarém - PA",
    latitude: -2.504100,
    longitude: -54.954700
  },
  {
    name: "Centro Cultural João Fona",
    description: "Espaço cultural e museu com acervo histórico e arqueológico da cerâmica tapajônica em Santarém.",
    category: "Cultura",
    address: "Praça Barão de Santarém, Centro, Santarém - PA",
    latitude: -2.418200,
    longitude: -54.708300
  },
  {
    name: "Orla de Santarém",
    description: "Calçadão à margem do Rio Tapajós, ideal para caminhadas e contemplação do encontro das águas.",
    category: "Passeio",
    address: "Av. Tapajós, Centro, Santarém - PA",
    latitude: -2.438900,
    longitude: -54.701100
  }
]

pois_data.each do |poi_attrs|
  Poi.find_or_create_by!(name: poi_attrs[:name]) do |p|
    p.description = poi_attrs[:description]
    p.category = poi_attrs[:category]
    p.address = poi_attrs[:address]
    p.latitude = poi_attrs[:latitude]
    p.longitude = poi_attrs[:longitude]
  end
end

puts "#{Poi.count} POIs cadastrados com sucesso!"