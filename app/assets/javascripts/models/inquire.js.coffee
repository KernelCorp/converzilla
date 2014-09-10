# for more details see: http://emberjs.com/guides/models/defining-models/

Converzilla.Inquire = DS.Model.extend
  email: DS.attr 'string'
  phone: DS.attr 'string'
  name:  DS.attr 'string'
  status: DS.attr 'string'

  statusClass: ( ->
    switch @get('status')
      when 'new' then 'new'
      when 'close' then 'positive'
      when 'in_progress' then 'warning'
      else ''
  ).property('status')

  isOpen: ( ->
    @get('status') == 'new'
  ).property()

  isClose: ( ->
    @get('status') == 'close'
  ).property()

  isInProgress: ( ->
      @get('status') == 'in_progress'
  ).property()


