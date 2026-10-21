// app/javascript/controllers/geolocation_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["latitude", "longitude"]

  connect() {
    // Se os campos já tiverem valor, não sobrescreve
    if (this.hasLatitudeTarget && !this.latitudeTarget.value && navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        this.latitudeTarget.value = position.coords.latitude
        this.longitudeTarget.value = position.coords.longitude
      })
    }
  }

  locate(event) {
    event.preventDefault()
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        this.latitudeTarget.value = position.coords.latitude
        this.longitudeTarget.value = position.coords.longitude
        // Opcional: submete o formulário automaticamente se quiser
        // this.element.submit()
      }, (error) => {
        alert("Não foi possível obter sua localização.")
      })
    } else {
      alert("Geolocalização não é suportada pelo seu navegador.")
    }
  }
}