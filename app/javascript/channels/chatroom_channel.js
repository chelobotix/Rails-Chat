import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const chatBox = document.getElementById("chatBox")
    chatBox.insertAdjacentHTML("beforeend", data.messageHtml)
    scrollBottom()
  },
})

const scrollBottom = function () {
  if (container) {
    container.scrollTop = container.scrollHeight
  }
}
