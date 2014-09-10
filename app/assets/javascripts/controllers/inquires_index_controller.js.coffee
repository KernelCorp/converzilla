# for more details see: http://emberjs.com/guides/controllers/

Converzilla.InquiresIndexController = Ember.ArrayController.extend({
  actions: {
    changeStatus: (inquire, status)->
      if status in ['in_progress', 'new', 'close']
        inquire.set 'status', status
        inquire.save()
  }
})
