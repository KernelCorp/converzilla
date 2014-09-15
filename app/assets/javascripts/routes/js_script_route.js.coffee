# For more information see: http://emberjs.com/guides/routing/

Converzilla.JsScriptRoute = Ember.Route.extend({
  model: ->
    result = $.ajax('/js_script',
      dataType: 'json'
      type:     'GET'
      async:    false,
    ).responseText;
    $.parseJSON(result)['js_script']
})
