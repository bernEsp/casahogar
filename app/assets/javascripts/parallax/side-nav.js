$(function(){
	var   $nav = $( 'nav.parallax-primary ul' )
	  , aRules = [];

	$( 'section' ).each( function(){
		var  $this = $( this )
		  , sTitle = $this.attr( 'data-nav' ) || $this.find( 'h2:first' ).text()
		  ,    sId = $this.attr( 'id' ).split( '-' ).pop()
		  ;

		aRules.push( 'body.section-' + sId + ' #nav li.' + sId + ' a');
		$nav.append( '<li class="' + sId + '"><h4><span>' + sTitle + '</span></h4><a href="#' + sId + '">' + sId + '</a></li>' )
	} );

	$( '<style>' + aRules.join( ', ' ) + '{ background : url( images/nav-dot.png ) 0 100% no-repeat; }</style>' ).appendTo( $( 'head' ) );

	$nav
		.on( 'click', 'a', function(){
			scrollToSection( $( this ).attr( 'href' ).substr( 1 ) );
		} )
		.on( 'mouseenter', 'li', function(){
			$( this ).find( 'h4' ).stop().show().animate({ opacity:1, duration: 100, right: 30 }, { queue: false });
		} )
		.on( 'mouseleave', 'li', function(){
			var self = this;
			$( this ).find( 'h4' ).stop().animate({ opacity:0, duration: 100, right: 15 }, { queue: false, complete : function(){ $( this ).hide(); } });
		});

	$( 'body' ).on( 'click', 'a', function( ev ){
		var href = this.getAttribute( 'href' ) || '';

		if( href.indexOf( '#' ) === 0 ){
			ev.preventDefault();
			scrollToSection( href.substr( 1 ) );
		}
	} );
});
