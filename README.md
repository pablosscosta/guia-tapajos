# Guia Tapajós

Aplicação web desenvolvida em Ruby on Rails para gerenciamento e exibição de pontos de interesse (POIs) em Santarém e região.

## Stack
* **Ruby on Rails** 7+
* **MySQL**
* **Bootstrap 5** (Layout responsivo e sóbrio)
* **Active Storage** (Upload de imagens)
* **Rails I18n** (Internacionalização pt-BR modularizada por domínio)

## Funcionalidades
* CRUD completo de Pontos de Interesse (POIs) com suporte a nome, categoria, endereço, coordenadas geográficas e descrição.
* Upload de foto de capa (Active Storage) associada a cada ponto turístico.
* Povoamento automatizado de dados via seeds modulares (`db/seeds/pois.rb`) com imagens de placeholder integradas.
* Interface responsiva estruturada com Bootstrap 5.
* Internacionalização (I18n) configurada para português do brasil (`pt-BR`) com arquivos separados por domínio.
* Mapa interativo (via Leaflet / OpenStreetMap) exibido na página de detalhes de cada ponto turístico, sinalizando a localização exata através de coordenadas geográficas.
* Busca por nome/endereço, filtro por categoria e cálculo de proximidade por raio (km) com geolocalização do navegador.

## Próximas Features (Roadmap)
* Painel de autenticação e perfis de usuário (Administradores vs. Visitantes).
* Avaliações, comentários e notas para os pontos turísticos.