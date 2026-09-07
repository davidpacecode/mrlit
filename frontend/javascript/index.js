import "$styles/index.css"
import "$styles/syntax-highlighting.css"
import Willamette from "willamette"

Willamette.init()

// import and start Alpine. Check to make sure this is correct...
import Alpine from 'alpinejs'
 
window.Alpine = Alpine
 
Alpine.start()

// Import all JavaScript & CSS files from src/_components
import components from "$components/**/*.{js,jsx,js.rb,css}"

console.info("Bridgetown is loaded!")
