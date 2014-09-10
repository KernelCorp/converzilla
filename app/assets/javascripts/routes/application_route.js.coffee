# For more information see: http://emberjs.com/guides/routing/

Converzilla.ApplicationRoute = Ember.Route.extend({
  activate: ->
    dispatcher = new WebSocketRails('localhost:3000/websocket')
    channel = dispatcher.subscribe(window.clientId)
    channel.bind 'new_inquire', (data) =>
      @store.push 'inquire', JSON.parse(data).inquire
})
