# db/seeds/pois.rb
require "open-uri"

puts "Limpando POIs antigos e anexos..."
Poi.destroy_all

pois_data = [
  {
    name: "Praia de Alter do Chão",
    description: "Conhecida como o Caribe Amazônico, famosa por suas águas cristalinas e a Ilha do Amor.",
    category: "Praia",
    address: "Alter do Chão, Santarém - PA",
    latitude: -2.504100,
    longitude: -54.954700,
    image_url: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=1000&q=80",
    image_filename: "alter_do_chao.jpg"
  },
  {
    name: "Centro Cultural João Fona",
    description: "Espaço cultural e museu com acervo histórico e arqueológico da cerâmica tapajônica em Santarém.",
    category: "Cultura",
    address: "Praça Barão de Santarém, Centro, Santarém - PA",
    latitude: -2.418200,
    longitude: -54.708300,
    image_url: "https://images.unsplash.com/photo-1566127444979-b3d2b654e3d7?auto=format&fit=crop&w=1000&q=80",
    image_filename: "joao_fona.jpg"
  },
  {
    name: "Orla de Santarém",
    description: "Calçadão à margem do Rio Tapajós, ideal para caminhadas e contemplação do encontro das águas.",
    category: "Passeio",
    address: "Av. Tapajós, Centro, Santarém - PA",
    latitude: -2.438900,
    longitude: -54.701100,
    image_url: "https://images.unsplash.com/photo-1519046904884-53103b34b206?auto=format&fit=crop&w=1000&q=80",
    image_filename: "orla_santarem.jpg"
  }
]

pois_data.each do |poi_attrs|
  poi = Poi.create!(
    name: poi_attrs[:name],
    description: poi_attrs[:description],
    category: poi_attrs[:category],
    address: poi_attrs[:address],
    latitude: poi_attrs[:latitude],
    longitude: poi_attrs[:longitude]
  )

  begin
    # Passa User-Agent para evitar bloqueios de requisição HTTP
    downloaded_image = URI.open(poi_attrs[:image_url], "User-Agent" => "GuiaTapajosApp/1.0")
    
    poi.cover_image.attach(
      io: downloaded_image,
      filename: poi_attrs[:image_filename],
      content_type: "image/jpeg"
    )
    puts "✓ Foto anexada a: #{poi.name}"
  rescue StandardError => e
    puts "⚠ Não foi possível baixar a imagem para #{poi.name}: #{e.message}"
  end
end

puts "\n#{Poi.count} POIs cadastrados com sucesso!"