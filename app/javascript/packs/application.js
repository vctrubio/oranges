//= require jquery
//= require jquery_ujs

// window.initMap = function (...args) {
//   const event = document.createEvent("Events");
//   event.initEvent("google-maps-callback", true, true);
//   event.args = args;
//   window.dispatchEvent(event);
// };


require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
// require("jquery");
// require("jquery.easy-autocomplete");


import "bootstrap";
import "controllers";
// import "jquery.easy-autocomplete";
import "toggleme";

import flatpickr from "flatpickr";
require("flatpickr/dist/flatpickr.css")

document.addEventListener("turbolinks:load", () => {
    flatpickr("[data-behavior='flatpickr']", {
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "d-m-Y",
    })
})


