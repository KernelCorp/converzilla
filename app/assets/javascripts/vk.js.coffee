#= require jquery

class @VkController

  fields: 'sex, bdate, city, country, domain, has_mobile, contacts, connections, site, education, universities, schools, can_post, can_see_all_posts, can_see_audio, can_write_private_message, status, last_seen, common_count, relation, relatives, counters, screen_name, maiden_name, timezone, occupation,activities, interests, music, movies, tv, books, games, about, quotes'
  host: 'http://converzilla.kerweb.ru'

  constructor: (clientId) ->
    @clientId = clientId
    if @getCookie(@clientId) == undefined
      VK.init {apiId: 4546123}
      VK.Widgets.Like "vk_like", {type: "mini", height: 18}
      VK.Observer.subscribe "widgets.like.liked", @likeHandler
    else
      parent.postMessage 'like', '*'



  likeHandler: =>
    parent.postMessage 'like', '*'
    VK.api 'likes.getList', {type: 'sitepage', owner_id: 4546123, page_url: location.href, count: 1}, (data) =>
      VK.api 'users.get', {user_ids: data.response.users[0]}, (data) =>
        userInfo = data.response[0] if (data.response)
        $.ajax {
          data: {visitor: {vk_user_info: userInfo}, client_id: @clientId},
          url: "#{@host}/visitors",
          method: 'POST'
          success: (data) ->
            document.cookie = "#{@clientId}=#{data.visitor.id}"
        }

  getCookie: (name) ->
    matches = document.cookie.match(new RegExp("(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, "\\$1") + "=([^;]*)"))
    (if matches then decodeURIComponent(matches[1]) else `undefined`)