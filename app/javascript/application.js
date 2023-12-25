// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "channels/chatroom_channel"

// Get the container element
const container = document.getElementById("chatBox")
const chatBtn = document.getElementById("chatBtn")

document.addEventListener("turbo:load", function () {
  scrollBottom()
  console.log("cargado")
})
