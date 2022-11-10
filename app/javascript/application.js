// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

//= require flatpickr
//= require flatpickr/plugins/confirmDate/confirmDate
document.addEventListener('DOMContentLoaded', function() {
  flatpickr('.your-selector', {
    enableTime: true,
    plugins: [
      new confirmDatePlugin({})
    ]
  })
})
