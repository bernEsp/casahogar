# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  redrawDotNav()
	
	#Scroll event handler
  $(window).bind 'scroll', (e) ->
    parallaxScroll()
    redrawDotNav()

    
	#Next/prev and primary nav btn click handlers
  $('a.paralax').on 'click', () -> 
    target = $(this).data('destination')
    $('html, body').animate({ scrollTop: $("[data-type='#{target}']").offset().top}, 1000, () ->
	    parallaxScroll() #Callback is required for iOS
    )
    false

     
  # Show/hide dot lav labels on hover 
  $('nav#primary a').hover () ->
      $(this).prev('h1').show()
    ,() -> 
	    $(this).prev('h1').hide() # Scroll the background layers


parallaxScroll = () ->
	scrolled = $(window).scrollTop()
	$('#parallax-bg1').css('top',(0-(scrolled*.25))+'px')
	$('#parallax-bg2').css('top',(0-(scrolled*.5))+'px')
	$('#parallax-bg3').css('top',(0-(scrolled*.75))+'px')


#Set navigation dots to an active state as the user scrolls
redrawDotNav =  () ->
	section1Top =  0
	#The top of each section is offset by half the distance to the previous section.
	section2Top =  $("*[data-type='historia']").offset().top - (($("*[data-type='mision']").offset().top - $("*[data-type='historia']").offset().top) / 2)
	section3Top =  $("*[data-type='mision']").offset().top - (($("*[data-type='who']").offset().top - $("*[data-type='mision']").offset().top) / 2)
	section4Top =  $("*[data-type='who']").offset().top - (($("*[data-type='who']").offset().top - $("*[data-type='gallery']").offset().top) / 2)
	section5Top =  $("*[data-type='gallery']").offset().top - (($(document).height() - $("*[data-type='gallery']").offset().top) / 2)
	$('nav.primary a').removeClass('active')
	if ($(document).scrollTop() >= section1Top && $(document).scrollTop() < section2Top)
		$('nav.primary a.casa-hogar').addClass('active')
	else if ($(document).scrollTop() >= section2Top && $(document).scrollTop() < section3Top)
		$('nav.primary a.historia').addClass('active')
	else if ($(document).scrollTop() >= section3Top && $(document).scrollTop() < section4Top)
		$('nav.primary a.mision').addClass('active')
	else if ($(document).scrollTop() >= section4Top && $(document).scrollTop() < section5Top)
		$('nav.primary a.who').addClass('active')
	else if ($(document).scrollTop() >= section5Top)
		$('nav.primary a.gallery').addClass('active')
	


