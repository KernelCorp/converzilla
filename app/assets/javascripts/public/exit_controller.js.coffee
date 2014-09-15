class @ExitController
  constructor: ->
    document.body.addEventListener "mousemove", @check_exit_normal_br
    return

  bind_form: =>
    $('#inquire_modal .close').click @hide_modal
    $('#inquire_modal #new_inquire').bind 'ajax:success', @on_success

  destructor: ->
    document.body.removeEventListener "mousemove", @check_exit_normal_br
    return

  control_movement:  true
  already_shown:  false
  document_height:  window.clientHeight
  document_width:  window.clientWidth
  start_timestamp: 0
  finish_timestamp: 0
  screen_height: screen.height
  top_zone_y: parseInt((0.1*@::screen_height), 10)
  middle_zone_y: parseInt((0.3*@::screen_height), 10)
  top_zone: false
  middle_zone: false
  sensitivity:  150
  visibility:  0
  Date.now = Date.now || ->
    return new Date
  local_time: Date.now()
  time_zone: (new Date().getTimezoneOffset())
  opentime: @::local_time - 14400000
  closetime: @::local_time + 14400000
  iswork:  1


  on_success: =>
    @hide_modal()
    $('#request_made').val('true')
    @destructor()
    delete @

  check_exit_normal_br: (e)=>
    unless @control_movement
      return
    if e.clientY > @middle_zone_y

      @top_zone = false
      @middle_zone = false

      @start_timestamp = Date.now()

    else if  (e.clientY <= @middle_zone_y) && (e.screenY > @top_zone_y) && !@top_zone && !@middle_zone

      @top_zone = false
      @middle_zone = true

    else if  (e.clientY <= @top_zone_y) && !@top_zone && @middle_zone && (0 != @start_timestamp)

      @top_zone = true;
      @middle_zone = true;

      @finish_timestamp = Date.now()
      if ( ((@finish_timestamp - @start_timestamp) < @sensitivity) && (!@already_shown) )
        if ( (@finish_timestamp > @opentime) && (@finish_timestamp < @closetime) && (1 == @iswork) )
          @show_modal()


    return

  show_modal: ->
    $('#inquire_shadow').show()
    $('#inquire_modal').show()
    $('#inquire_shadow').click(@hide_modal)
    return

  hide_modal: =>
    $('#inquire_shadow').hide()
    $('#inquire_modal').hide()
    @destroy()
    return

  destroy: =>
    document.body.removeEventListener "mousemove", @check_exit_normal_br
    return