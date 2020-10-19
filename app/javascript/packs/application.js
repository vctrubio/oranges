// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

window.initMap = function (...args) {
  const event = document.createEvent("Events");
  event.initEvent("google-maps-callback", true, true);
  event.args = args;
  window.dispatchEvent(event);
};


//= require jquery
//= require jquery_ujs

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

import "bootstrap";
import "controllers";



function onPLaceChanged() {

};



// const autocomplete = () => {
//   //var input = document.getElementById('autocomplete');
//   var inputs = document.querySelectorAll('#autocomplete');
//   inputs.forEach((input, index) => {
//     var autocomplete = new google.maps.places.Autocomplete(input);
//     google.maps.event.addListener(autocomplete, 'place_changed', function () {
//       fillInAddress();
//     });

//     function fillInAddress() {
//       // Get the place details from the autocomplete object.
//       var place = autocomplete.getPlace();
//       console.log(place);
//       console.log(place.geometry.location.lat());
//       var full_address = "";
//       for (var i in place.address_components) {
//         var component = place.address_components[i];

//         full_address += component.long_name + " ";


//         // for (var j in component.types) {
//         //   // Some types are ["country", "political"]
//         //   var type_element = document.getElementById(component.types[j]);

//         //   if (type_element) {
//         //     type_element.value = component.long_name;
//         //   }
//         // }

//       }
//       document.querySelectorAll('#autocomplete')[index].value = place.name;
//       document.querySelectorAll('#latitude')[index].value = place.geometry.location.lat();
//       document.querySelectorAll('#longitude')[index].value = place.geometry.location.lng();
//       document.querySelectorAll('#zone')[index].value = place.geometry.location.zip_code();
//       //document.getElementById('full_address').value = full_address;
//       //document.getElementById('autocomplete').value = place.name;
//     }
//   });

// }

// autocomplete();
