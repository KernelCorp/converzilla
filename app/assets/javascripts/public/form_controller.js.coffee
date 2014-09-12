class @FormController

  form: null
  clientId: null
  host = 'localhost:3000'

  constructor: (vkController, clientId) ->
    @clientId = clientId
    @vkController = vkController
    @buildForm()


  buildForm: ->
    $.ajax {
      data: {client_id: @clientId},
      url: "http://#{host}/inquires/new",
      success: (data) =>
        document.body.innerHTML += data
        @form =  $ "#callback_modal form#new_inquire"
        @form.find('button#submit').click @onSubmit
    }



  onSubmit: =>
    inquireData = {
      phone: @form.find('input[name=phone]').val(),
      email: @form.find('input[name=phone]').val()
      vk_info: @vkController.userInfo
    }

    $.ajax {
      dataType: 'jsonp',
      jsonp: 'jsonp_callback',
      data: {inquire: inquireData, client_id: @clientId},
      url: "http://#{host}/inquires",
      method: 'POST'
    }
    false

