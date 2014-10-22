# for more details see: http://emberjs.com/guides/models/defining-models/

Converzilla.Visit = DS.Model.extend Converzilla.FormattedTimestampMixin,
  created_at: DS.attr 'date'
  visitor:    DS.belongsTo 'visitor'