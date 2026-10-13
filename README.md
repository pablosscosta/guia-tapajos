# Guia Tapajós

Aplicação web desenvolvida em Ruby on Rails para gerenciamento e exibição de pontos de interesse (POIs) em Santarém e região.

## Stack
* **Ruby on Rails** 7+
* **MySQL**
* **Bootstrap 5** (Layout responsivo e sóbrio)
* **Active Storage** (Upload de imagens)
* **Rails I18n** (Internacionalização pt-BR modularizada por domínio)

## Funcionalidades do MVP
* CRUD completo de Pontos de Interesse (POIs) com suporte a nome, categoria, endereço, coordenadas geográficas e descrição.
* Upload de foto de capa (Active Storage) associada a cada ponto turístico.
* Povoamento automatizado de dados via seeds modulares (`db/seeds/pois.rb`) com imagens de placeholder integradas.
* Interface responsiva estruturada com Bootstrap 5.
* Internacionalização (I18n) configurada para português do brasil (`pt-BR`) com arquivos separados por domínio.

## Próximas Features (Roadmap)
* Integração com mapas interativos (Leaflet ou Google Maps) baseada nas coordenadas geográficas dos POIs.
* Sistema de busca e filtros avançados por categoria e proximidade.
* Painel de autenticação e perfis de usuário (Administradores vs. Visitantes).
* Avaliações, comentários e notas para os pontos turísticos.