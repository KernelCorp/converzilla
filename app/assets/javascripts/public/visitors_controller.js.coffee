class @VisitorsController

  host: 'converzilla.kerweb.ru'

  constructor: (clientId, vkController)->
    @vkController = vkController
    @clientId = clientId

    @vkController.doWithVkInfo (userInfo) =>
      unless userInfo == null
        $.ajax {
          data: {visitor: {vk_user_info: userInfo}, client_id: @clientId},
          url: "http://#{@host}/visitors",
          method: 'POST'
        }
