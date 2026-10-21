document.addEventListener("turbo:load", function() {
  const mapElement = document.getElementById("map");
  if (!mapElement) return;

  const lat = parseFloat(mapElement.dataset.latitude);
  const lng = parseFloat(mapElement.dataset.longitude);
  const name = mapElement.dataset.name;

  // Valida se as coordenadas existem
  if (!lat || !lng) return;

  // Inicializa o mapa centralizado no POI específico
  const map = L.map("map").setView([lat, lng], 15);

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 19,
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);

  // Plota o marcador único com o nome do local
  L.marker([lat, lng])
    .addTo(map)
    .bindPopup(`<strong>${name}</strong>`)
    .openPopup();
});