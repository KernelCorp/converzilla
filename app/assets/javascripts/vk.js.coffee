class @VkController

  fields: 'sex, bdate, city, country, domain, has_mobile, contacts, connections, site, education, universities, schools, can_post, can_see_all_posts, can_see_audio, can_write_private_message, status, last_seen, common_count, relation, relatives, counters, screen_name, maiden_name, timezone, occupation,activities, interests, music, movies, tv, books, games, about, quotes'
  host: 'http://converzilla.kerweb.ru'

  constructor: (clientId) ->
    @clientId = clientId
    VK.init {apiId: 4546123}
    VK.Widgets.Like "vk_like", {type: "mini", height: 18}
    VK.Observer.subscribe "widgets.like.liked", @likeHandler


  likeHandler: =>
    console.log 'like handler'
    console.log parent
    parent.postMessage 'like', '*'
    VK.api 'likes.getList', {type: 'sitepage', owner_id: 4546123, page_url: location.href, count: 1}, (data) =>
      console.log 'likes.getList'
      console.log data
      console.log data.response.users[0]
      VK.api 'users.get', {user_ids: data.response[0].items[0], fields: @fields}, (data) =>
        console.log 'users.get'
        userInfo = data.response[0] if (data.response)
        $.ajax {
          data: {visitor: {vk_user_info: userInfo}, client_id: @clientId},
          url: "http://#{@host}/visitors",
          method: 'POST'
        }


