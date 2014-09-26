class @Converzilla

  clientId: null
  vkController: null

  constructor: (clientId, options = {exitForm: true, visitors: false}) ->
    @clientId = clientId
    @vkController   = null #new VKController()
    if options['exitForm']
      @exitController = new ExitController()
      @formController = new FormController(@vkController, @exitController, @clientId)
    if options['visitors']
      @visitorsController = new VisitorsController(@clientId, @vkController)