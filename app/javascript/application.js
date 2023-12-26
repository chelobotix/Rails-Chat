// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "channels/chatroom_channel"

// Get the container element
const container = document.getElementById("chatBox")
const messageBody = document.getElementById("messageBody")
const chatBtn = document.getElementById("chatBtn")

document.addEventListener("turbo:load", function () {
  scrollBottom()
  handleEnterKey()
})

const handleEnterKey = () => {
  messageBody.addEventListener("keyup", function (event) {
    if (event.key === "Enter") {
      event.preventDefault()
      chatBtn.click()
      event.target.value = ""
    }
  })
}

const scrollBottom = function () {
  if (container) {
    container.scrollTop = container.scrollHeight
  }
}
