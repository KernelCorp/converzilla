Handlebars.registerHelper 'ifIAmClient', (options) ->
  return options.fn(this) if window.current_user == 'Client'
  return options.inverse(this)
Handlebars.registerHelper 'ifIAmOperator', (options) ->
  return options.fn(this) if window.current_user == 'Operator'
  return options.inverse(this)
