class @VKController

  userId: null
  userInfo: null

  constructor: ->
    VK.init {
      apiId: 4546123
    }

    VK.Auth.getLoginStatus (response) =>
      if response.session
        @userId = response.session.mid
        VK.api 'users.get', {user_ids: response.session.mid}, (data) =>
          @userInfo = data.response[0] if (data.response)



