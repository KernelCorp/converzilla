# for more details see: http://emberjs.com/guides/models/defining-models/

Converzilla.Inquire = DS.Model.extend
  email: DS.attr 'string'
  phone: DS.attr 'string'
  name: DS.attr 'string'
  status: DS.attr 'string'

  isClose: () ->
    alert 'adadad'
#    return true if status == 'close'

  isInProgress: () ->
    return true if status == 'in_progress'


