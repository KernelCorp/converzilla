class @Converzilla

  clientId: null
  vkController: null

  constructor: (clientId) ->
    @clientId = clientId
    @vkController   = new VKController()
    @exitController = new ExitController()
    @formController = new FormController(@vkController, @clientId)