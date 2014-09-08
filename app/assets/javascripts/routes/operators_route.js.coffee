# For more information see: http://emberjs.com/guides/routing/

Converzilla.OperatorsRoute = Ember.Route.extend({
  model: ->
    @store.findAll('operator')
})
