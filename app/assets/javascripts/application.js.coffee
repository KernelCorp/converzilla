#= require jquery
#= require jquery_ujs
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ember/converzilla.js.coffee
#= require websocket_rails/main



# for more details see: http://emberjs.com/guides/application/
window.Converzilla = Ember.Application.create( {
  rootElement: '#ember-app'
})

