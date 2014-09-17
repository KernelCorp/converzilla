class @VisitorsController

  host: 'localhost:3000'

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
