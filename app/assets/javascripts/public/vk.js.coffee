class @VKController

  userId: null
  userInfo: null

  fields: 'sex, bdate, city, country, domain, has_mobile, contacts, connections, site, education, universities, schools, can_post, can_see_all_posts, can_see_audio, can_write_private_message, status, last_seen, common_count, relation, relatives, counters, screen_name, maiden_name, timezone, occupation,activities, interests, music, movies, tv, books, games, about, quotes'

  constructor: ->
    VK.init {
      apiId: 4546123
    }



  doWithVkInfo: (block) =>
    VK.Auth.getLoginStatus (response) =>
      if response.session
        @userId = response.session.mid
        VK.api 'users.get', {user_ids: response.session.mid, fields: @fields}, (data) =>
          @userInfo = data.response[0] if (data.response)
          block.call(@, @userInfo)

