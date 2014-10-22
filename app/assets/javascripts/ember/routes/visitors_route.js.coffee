# For more information see: http://emberjs.com/guides/routing/

Converzilla.VisitorsRoute = Ember.Route.extend({
  model: ->
    @store.findAll('visitor')
})
