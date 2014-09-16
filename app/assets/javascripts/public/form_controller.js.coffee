class @FormController

  form: null
  clientId: null
  host = 'converzilla.kerweb.ru'

  constructor: (vkController, exitController, clientId) ->
    @clientId       = clientId
    @vkController   = vkController
    @exitController = exitController
    @buildForm()


  buildForm: ->
    $.ajax {
      data: {client_id: @clientId},
      url: "http://#{host}/inquires/new",
      success: (data) =>
        document.body.innerHTML += data
        @form =  $ "#inquire_modal form#new_inquire"
        @form.find('button#submit').click @onSubmit
        @exitController.bind_form()
    }



  onSubmit: =>
    inquireData = {
      phone: @form.find('input[name=phone]').val(),
      email: @form.find('input[name=phone]').val()
      vk_user_info: @vkController.userInfo
    }

    $.ajax {
      crossDomain: true,
      data: {inquire: inquireData, client_id: @clientId},
      url: "http://#{host}/inquires",
      method: 'POST'
    }
    false

