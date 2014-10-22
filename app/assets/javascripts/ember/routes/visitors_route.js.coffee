# For more information see: http://emberjs.com/guides/routing/

Converzilla.VisitorsIndexRoute = Ember.Route.extend({
  model: ->
    @store.findAll('visitor')
})

Converzilla.VisitorsShowRoute = Ember.Route.extend({
  model: (params)->
    @store.find('visitor', params.id)
})
