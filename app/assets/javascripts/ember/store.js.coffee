# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

Converzilla.Store = DS.Store.extend({

})

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
Converzilla.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  buildURL: (record, suffix) ->
    @_super(record, suffix) + ".json"
})
