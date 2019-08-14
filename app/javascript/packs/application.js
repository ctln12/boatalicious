import "bootstrap"



// import "../plugins/flatpickr"

import flatpickr from 'flatpickr'
import 'flatpickr/dist/themes/airbnb.css'
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr("#start_date", {
  altInput: true,
  minDate: "today",
  "plugins": [new rangePlugin({ input: "#end_date"})]
})



// Geocoding

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();


import { initBoatMapbox } from '../plugins/init_mapbox';

initBoatMapbox();
