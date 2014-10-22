# for more details see: http://emberjs.com/guides/models/defining-models/

Converzilla.Inquire = DS.Model.extend
  email: DS.attr 'string'
  phone: DS.attr 'string'
  name:  DS.attr 'string'
  sort:  DS.attr 'number'
  created_at: DS.attr 'date'
  updated_at: DS.attr 'date'
  status: DS.attr 'string'

  statusClass: ( ->
    switch @get('status')
      when 'new' then 'new'
      when 'close' then 'positive'
      when 'in_progress' then 'warning'
      else ''
  ).property('is_active')

  isOpen: ( ->
    @get('status') == 'new'
  ).property('status')

  isClose: ( ->
    @get('status') == 'close'
  ).property('status')

  isInProgress: ( ->
      @get('status') == 'in_progress'
  ).property('status')


