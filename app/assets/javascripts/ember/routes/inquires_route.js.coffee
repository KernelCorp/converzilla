# For more information see: http://emberjs.com/guides/routing/

Converzilla.InquiresRoute = Ember.Route.extend({
  model: ->
    @store.findAll('inquire')
})
