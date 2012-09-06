# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

websocket_endpoint = 'localhost:3000/websocket'

$ ->
    websocket_dispatcher = new WebSocketRails(websocket_endpoint)

    websocket_dispatcher.on_open = (data) ->
        console.log "Connection has been established: #{data}"

    websocket_dispatcher.on_close = (data) ->
        console.log "Connection has been closed: #{data}"
        window.websocket_dispatcher = new WebSocketRails(websocket_endpoint)

    $('#rsvp_yes').bind 'click', (message) =>
        rsvp =
          attending: true
        websocket_dispatcher.trigger 'rsvp.new',rsvp

    $('#rsvp_no').bind 'click', (message) =>
        rsvp =
          attending: false
        websocket_dispatcher.trigger 'rsvp.new',rsvp

    channel = websocket_dispatcher.subscribe 'rsvp'
    channel.bind 'new', (rsvp) =>
      $('#rsvp_yes_count').html rsvp.yes
      $('#rsvp_no_count').html rsvp.no



