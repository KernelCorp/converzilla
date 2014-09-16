// ALL.JS
//--------------------------------------------------------------------------------------------------------------------------------
//This is main JS file that contains custom JS scipts and initialization used in this template*/
// -------------------------------------------------------------------------------------------------------------------------------
// Template Name: ALL.
// Author: Magellan.
// Version 1.0 - Initial Release
// Website: http://moonart.net.ua/Magellan/ 
// Copyright: (C) 2014 
// -------------------------------------------------------------------------------------------------------------------------------
$(function() {
	
	//center_image//////////////////////////////////////////////////////////////////////////////////////////
	function center_image(){
		$('.center_img').each(function(){
			obj = $(this);
			var bg_ratio = obj.attr('data-width-img')/obj.attr('data-height-img');
			var wrapper_ratio = obj.parent().width()/obj.parent().height();
			if($(this).hasClass('center_h')){
				var center_hor = (bg_ratio*obj.parent().height() - obj.parent().width())*(-0.5);
				obj.css({'left':center_hor, 'top':'0px', 'height':'100%', 'width':'auto'});
			}else{
				if(bg_ratio<wrapper_ratio){
					var center = (obj.parent().width()/bg_ratio - obj.parent().height())*(-0.5);
					obj.css({'left':'0px', 'top':center, 'width':'100%', 'height':'auto'});
				}else{
					var center_hor = (bg_ratio*obj.parent().height() - obj.parent().width())*(-0.5);
					obj.css({'left':center_hor, 'top':'0px', 'height':'100%', 'width':'auto'});
				}
			}
		});
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////////////////

	function rax(){
		
		$('.slider-move').height($(window).height());
		$('.slider-move .slider-thumbs').width($(window).width());
		$('.slider-move').height($(window).height());
		$('.footer-map').height($('.footer').height());

		$('.testimonial-slider .slider-wraper').height($('.testimonial-wrap-in').height());


		//slider margin
		pustui_kusok = $('.swiper-thumb').width()-($('.swiper-thumb .slider-thumbs').width()*3);
		marn_pad = pustui_kusok/3;
		marn_pad = marn_pad*0.5;
		$('.swiper-thumb .slider-thumbs').css({'margin-left':marn_pad,'margin-right':marn_pad});

 
		center_image();	
		
		//submenu
		
		if ($(window).width() > 600){
			$('.submenu').css('top', $('header').outerHeight()+5);

			
			$('.nav-item').hover(
				   function(){ $(this).find('.submenu').fadeIn('hover') },
				   function(){ $(this).find('.submenu').fadeOut('hover') }
			)
			
			
			$('.submenu').css('margin-left', ($('.submenu').width() / 2 - $('.submenu').width()) + ($('.submenu').parent().width() / 2 ) );
		}
	};
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////////////////
	$(window).load(function(){
						
		rax();				
		$('.main-container').addClass('act');
		$('#loader').hide();
        
		if($('#myStat').length==1){
			$('#myStat').circliful();
        	$('#myStat2').circliful();
        	$('#myStat3').circliful();
		} 
		
		$('.team-circle-wrap').addClass('animated fadeInUpBig');
		setTimeout(function(){
			$('.cont-services-icon .wrap-icon-animation').addClass('act');
		},500);
		
	});
	if($('.time-line').length == 1){
	$(window).scroll(function(){
		
		if($(window).scrollTop() >= $('.time-line').offset().top-$('.time-line').height()){
				$('.good-line div').each(function(){
						objel = $(this);
						var pb_width = objel.attr('data-width-pb');
						objel.css({'width':pb_width});
					});
				 
				 function counter_custom(start, finish, obj, i){
					funcAr[i] = setInterval(function(){
						var curVal = parseInt(obj.text());							 
						if((curVal + 20) <= finish){
							obj.text(curVal+20);
						}			
						else {
							obj.text(finish);
							clearInterval(funcAr[i]);				
						}
					},1);
							
				}
				 
				 funcAr = [];
				 $('.timer').each(function(){
					i = $('.timer').index(this);
					obj_timer =  $(this);
					var start_index = 1;
					var stop_index = parseInt(obj_timer.attr('data-to'));
					counter_custom(start_index, stop_index, obj_timer, i);
				  });

				 
				 
				 function interval_index (){
					 setInterval(function(){
						if(start_index[i] == stop_index[i]){
						}else{
							start_index[i] = start_index[i] + 20;				
							obj_timer.text(start_index[i]);
						}					
					},1);
				 }	
		}
		
		
	});
	}
	
	if($('.price-col').length >= 1){
	$(window).scroll(function(){
							  
		if($(window).scrollTop() >= $('.price-block').eq(0).offset().top-($('.price-block').height())){
			$('.price-col').addClass('act');
		}
		
	});
	}
	
	if($('.animate-left-wrap').length >= 1){
	$(window).scroll(function(){
							  
		if($(window).scrollTop() >= $('.animate-left-wrap').eq(0).offset().top-($('.animate-left-wrap').height())){
			$('.animate-left-wrap .animate-left').addClass('act');
		}
		
	});
	}

	if($('.animate-top-wrap').length >= 1){
	$(window).scroll(function(){
							  
		if($(window).scrollTop() >= $('.animate-top-wrap').eq(0).offset().top-($('.animate-top-wrap').height()+200)){
			$('.animate-top-wrap .animate-top').addClass('act');
		}
		
	});
	}
	
	if($('.cont-services-icon').length >= 1){
	$(window).scroll(function(){
							  
		if($(window).scrollTop() >= $('.cont-services-icon').eq(0).offset().top-$(window).height()+$('.cont-services-icon').height()){
			$('.cont-services-icon .wrap-icon-animation').addClass('act');
		}
		
	});
	}
	
	if($('.animate-left-right-wrap').length >= 1){
	$(window).scroll(function(){
							  
		if($(window).scrollTop() >= $('.animate-left-right-wrap').eq(0).offset().top-($('.animate-left-right-wrap').eq(0).height()*0.5)){
			$('.animate-left-right-wrap').eq(0).find('.animate-left').addClass('act');
			$('.animate-left-right-wrap').eq(0).find('.animate-right').addClass('act');
		}
		
		if($(window).scrollTop() >= $('.animate-left-right-wrap').eq(1).offset().top-($('.animate-left-right-wrap').eq(1).height()*0.5)){
			$('.animate-left-right-wrap').eq(1).find('.animate-left').addClass('act');
			$('.animate-left-right-wrap').eq(1).find('.animate-right').addClass('act');
		}
		
		if($(window).scrollTop() >= $('.animate-left-right-wrap').eq(2).offset().top-($('.animate-left-right-wrap').eq(2).height()*0.5)){
			$('.animate-left-right-wrap').eq(2).find('.animate-left').addClass('act');
			$('.animate-left-right-wrap').eq(2).find('.animate-right').addClass('act');
		}
		
	});
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////////////////
	$(window).resize(function(){
		rax();
	});
	////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//baner-slider///////////////////////////////////////////////////////////////////////////////////////////
	var top_baner;

	top_baner=$('.home-slider').swiper({
		loop:true,
		grabCursor: true,
		slidesPerView: 1,
		autoplay:7000,
        autoplayDisableOnInteraction: true,
		onSlideChangeStart : function() {
			$('.slider-point').removeClass('act');
			$('.slider-point').eq(top_baner.activeLoopIndex).addClass('act');
		}
	});
	
	$('.slider-point').click(function(){
		eqIndex = $('.slider-point').index(this);
		$('.slider-point').removeClass('act');
		$(this).addClass('act');
		top_baner.swipeTo(eqIndex);
		top_baner.stopAutoplay();
		return false;
	});
	
	swiper_multi=$('.swiper-multi').swiper({
		loop:true,
		grabCursor: true,
		autoplay:5000,
		paginationClickable: true,
		pagination: '.pagination'
	});
	
	swiper_thumb=$('.swiper-thumb').swiper({
		loop:true,
		grabCursor: true,
		slidesPerView: 3,
		autoplay:5000,
		paginationClickable: true,
		pagination: '.pagination-two'
	});
	
	$('.slider-thumb-arrow-left').click(function(){
		swiper_thumb.swipePrev();
		return false;
	});
	
	$('.slider-thumb-arrow-right').click(function(){
		swiper_thumb.swipeNext();
		return false;
	});	
	
	testimonial_baner=$('.testimonial').swiper({
		loop:false,
		grabCursor: true,
		slidesPerView: 1,
		autoplay:7000,
        autoplayDisableOnInteraction: true,
		onSlideChangeStart : function() {
			$('.testimonial-arrow-left').addClass('act');
			$('.testimonial-arrow-right').addClass('act');
			if(testimonial_baner.activeLoopIndex==0){
				$('.testimonial-arrow-left').removeClass('act');	
			}
			if(testimonial_baner.activeLoopIndex==$('.swiper-slide').length-1){
				$('.testimonial-arrow-right').removeClass('act');	
			}
		}
	});
	
	$('.testimonial-arrow-left').click(function(){
		testimonial_baner.swipePrev();
		$('.testimonial-arrow-left').addClass('act');
		$('.testimonial-arrow-right').addClass('act');
		if(testimonial_baner.activeLoopIndex==0){
			$('.testimonial-arrow-left').removeClass('act');	
		}
		return false;
	});
	
	$('.testimonial-arrow-right').click(function(){
		testimonial_baner.swipeNext();
		$('.testimonial-arrow-left').addClass('act');
		$('.testimonial-arrow-right').addClass('act');
		if(testimonial_baner.activeLoopIndex==$('.swiper-slide').length-1){
			$('.testimonial-arrow-right').removeClass('act');	
		}
		return false;
	});
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////


	$('#filter .nav-item a').click(function(){
		var text_index = $(this).text();
		
		$('#filter-thumbs div').each(function(){
			if($(this).attr('data-filter')==text_index){
				$(this).show();
			}else{
				$(this).hide();
			}
	});			
		
		$(this).parent('.nav-item').toggleClass('current-menu-item').siblings().removeClass('current-menu-item');
		
		return false;
	});
	
	$('#all').click(function(){
		$('#filter-thumbs div').show();
		return false;
	});
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	$('.mob_meny').click(function(){
		if($(this).hasClass('act')){
			$(this).removeClass('act');	
			$('nav').removeClass('act');
		}else{
			$(this).addClass('act');
			$('nav').addClass('act');
		}
		return false;
	});
	
	////////home slider parallax////////////////////////////////////////////////////////////////////////////////////////////////
	
	if( navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/webOS/i) || navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPod/i)){
		
	}else{
		skrollr.init({
			smoothScrolling: true,	
			easing: 'swing',
			forceHeight: false
	    });
	}

	////////tabs vertical////////////////////////////////////////////////////////////////////////////////////////////////////////
	var data_text;
    var h2s=$('.collapsed-block>div').click(function () {
		$('.collapsed-block > div').removeClass('act');
		$('.collapsed-block > div').next().slideUp(500);
		$('.collapsed-block > div').next().removeClass('col-open');
		$('.collapsed-block>div').each(function(){
			$(this).text($(this).attr('data-text'));	
		});
		if($(this).hasClass('act')){
			$(this).removeClass('act');
			$(this).next().removeClass('col-open');
			$(this).next().slideUp(500);
			$(this).text(data_text)
		}else{
			$(this).addClass('act');
			$(this).next().slideDown(500)
			$(this).next().addClass('col-open');
			data_text = $(this).text();
			$(this).text($(this).attr('data-title'));
		}
        return false;
    });
	
	////////tabs gorizontal////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	$(function() {

		$('ul.tabs').on('click', 'li:not(.current)', function() {
			$(this).addClass('current').siblings().removeClass('current')
				.parents('.section-tab').find('div.box').eq($(this).index()).fadeIn(150).siblings('div.box').hide();
		})

	});

	

});
