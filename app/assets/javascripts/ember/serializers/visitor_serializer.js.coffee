Converzilla.VisitorSerializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    visits: {embedded: 'always'}