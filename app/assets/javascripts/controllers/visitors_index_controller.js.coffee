# for more details see: http://emberjs.com/guides/controllers/

Converzilla.VisitorsIndexController = Ember.ArrayController.extend({
#  sortProperties: ['created_at']
#  sortAscending: false
  actions: {
    remove: (visitor) ->
      visitor.deleteRecord()
      visitor.save()
  }
})

