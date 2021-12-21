// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '@fortawesome/fontawesome-free/js/all'
import "../src/application.scss"
import "../library/jquery.range.js"

require('jquery')
require('chart.js')

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$('#item_degree').jRange({
  from: 0,
  to: 100,
  step: 10,
  scale: [0,10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
  format: '%s',
  width: '100%',
  theme: "theme-blue",
  showLabels: false,
  onstatechange: function(){
    $("#item_degree").trigger('change');
  }
});
