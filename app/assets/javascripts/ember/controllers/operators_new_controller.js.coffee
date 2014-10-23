# for more details see: http://emberjs.com/guides/controllers/

Converzilla.OperatorsNewController = Ember.Controller.extend({
  actions: {
    create: ->
      operator = @store.createRecord 'operator', {email: @get('email'), password: @get('password')}
      operator.save()
      @transitionToRoute 'operators'
  }
})

