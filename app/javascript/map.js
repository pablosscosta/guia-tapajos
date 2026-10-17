document.addEventListener("turbo:load", function() {
  const mapElement = document.getElementById("map");
  if (!mapElement) return;

  // Lógica para ler os POIs do data-attribute
  const poisData = mapElement.dataset.pois;
  if (!poisData) return;

  const pois = JSON.parse(poisData);

  // Santarém / Alter do Chão como centro padrão caso não haja POIs
  const defaultLat = -2.4431;
  const defaultLng = -54.7083;

  // Filtra apenas POIs com coordenadas válidas
  const validPois = pois.filter(p => p.latitude && p.longitude);

  const initialLat = validPois.length > 0 ? validPois[0].latitude : defaultLat;
  const initialLng = validPois.length > 0 ? validPois[0].longitude : defaultLng;

  // Inicializa o mapa
  const map = L.map("map").setView([initialLat, initialLng], 12);

  // Adiciona a camada de mapa do OpenStreetMap
  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 19,
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);

  // Plota cada marcador no mapa
  validPois.forEach(poi => {
    const popupContent = `
      <div style="min-width: 150px;">
        <span class="badge bg-secondary mb-1" style="font-size: 0.75rem;">${poi.category || ''}</span>
        <h6 style="margin: 0 0 5px 0; font-weight: bold;">${poi.name}</h6>
        <p style="margin: 0 0 8px 0; font-size: 0.85rem; color: #555;">${poi.address || ''}</p>
        <a href="${poi.url}" class="btn btn-sm btn-primary text-white" style="text-decoration: none; font-size: 0.8rem; padding: 2px 8px;">Ver detalhes</a>
      </div>
    `;

    L.marker([poi.latitude, poi.longitude])
      .addTo(map)
      .bindPopup(popupContent);
  });
});