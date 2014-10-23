# for more details see: http://emberjs.com/guides/models/defining-models/

Converzilla.Visit = DS.Model.extend Converzilla.FormattedTimestampMixin,
  created_at: DS.attr 'date'
  ip_address: DS.attr 'string'
  location:   DS.attr 'string'

  visitor:    DS.belongsTo 'visitor'
