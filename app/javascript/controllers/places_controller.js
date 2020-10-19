import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["field", "map", "latitude", "longitude"];

  connect() {
    // if (typeof google != "underfinded") {
    //   this.initMap();
    // }
  }
  initMap() {
    //does not fucking work dude
    this.map = new google.maps.Map(this.mapTarget, {
      center: new google.maps.LatLng(39.5, 98.4),
      zoom: 5,
    });
    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget);
    this.autocomplete.bindTo("bounds", this.map);
    this.autocomplete.setFieds([
      "address_components",
      "geometry",
      "icon",
      "name",
    ]);
    this.autocomplete.addListener(
      "place_changed",
      this.placeChanged.bind(this)
    );
    this.marker = new google.maps.Marker({
      map: this.map,
      anchorPoint: new google.maps.Point(0, -29),
    });
  }
  placeChanged() {
    let place = this.autocomplete.getPlace();

    if (!place.geometry) {
      window.alert(`No details availale for input ${client.name}`);
      return;
    }

    if (place.geometry.viewport) {
      this.map.fitBounds(place.geometry.viewport);
    } else {
      this.map.setCenter(place.geometry.location);
      this.map.setZoom(17);
    }

    this.marker.setPosition(place.geometry.location);
    this.marker.setVisible(true);
    this.latitudeTarget.value = place.geometry.location.lat();
    this.longitudeTarget.value = place.geometry.location.lng();
  }
}
