# for more details see: http://emberjs.com/guides/models/defining-models/

Converzilla.Inquire = DS.Model.extend
  email: DS.attr 'string'
  phone: DS.attr 'string'
  name:  DS.attr 'string'
  status: DS.attr 'string'

  isOpen: ( ->
    @get('status') == 'new'
  ).property()

  isClose: ( ->
    @get('status') == 'close'
  ).property()

  isInProgress: ( ->
      @get('status') == 'in_progress'
  ).property()


