# for more details see: http://emberjs.com/guides/models/defining-models/

Converzilla.Visitor = DS.Model.extend
  vk_last_name:  DS.attr 'string'
  vk_first_name: DS.attr 'string'
  vk_sex:        DS.attr 'string'
  vk_uid:        DS.attr 'string'
  vk_url:        DS.attr 'string'
  visits_count:  DS.attr 'number'
  visits:        DS.hasMany 'visits', {embedded: 'always'}
