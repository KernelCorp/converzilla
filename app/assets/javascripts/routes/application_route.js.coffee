# For more information see: http://emberjs.com/guides/routing/

Converzilla.ApplicationRoute = Ember.Route.extend({
  activate: ->
    dispatcher = new WebSocketRails('localhost:3000/websocket')
    channel = dispatcher.subscribe(window.clientId)
    channel.bind 'new_inquire', (data) =>
      inquire_data =  JSON.parse(data).inquire
      inquire_data.created_at = Date(inquire_data.created_at)
      @store.push 'inquire', inquire_data
})
