class @Converzilla

  clientId: null

  constructor: (clientId, options = {exitForm: true, visitors: false}) ->
    @clientId = clientId
    if options['exitForm']
      @exitController = new ExitController()
      @formController = new FormController(@exitController, @clientId)
    if options['visitors']
      @visitorsController = new VisitorsController(@clientId)