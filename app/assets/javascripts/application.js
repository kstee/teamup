// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require underscore
//= require gmaps/google
//= require bootstrap/dropdown
//= require chosen-jquery
//= require bootstrap
//= require_self
//= require notifications.js.coffee
//= require conversations.js

$(document).ready(function(){

	var activity_count = $('.temp_information').data('temp');

	for (i = 1; i < activity_count + 1; i++) {
		if ( $(".cb-" + i ).is(":checked") ) {
			$("#act-" + i).addClass("active");
		}
		else {
			$("#act-" + i).removeClass("active");
		}
	}

	$('.dropdown-toggle').dropdown();
	
	$("html").on("click", ".portfolio-box", function(event) {
	// $(".portfolio-box").on("click", function(event) {
		event.preventDefault();
		var current_id = this.id;

		var cb_class = ".cb-" + current_id;
		
		var checkbox = $('.checkboxes').find(cb_class);

		if ( !checkbox.prop("checked") ){
        	checkbox.prop("checked",true);
        	$(this).css("opacity", "0.5");
    	}
    	else {
        	checkbox.prop("checked",false);
        	$(this).css("opacity", "1.0");
    	}
	})

	$("html").on("click", ".filter-activity-list", function(event) {
		event.preventDefault();
		var current_id = $(this).children().attr('id');

		var cb_class = ".cb-" + current_id;
		
		var checkbox = $('.checkboxes').find(cb_class);

		if ( !checkbox.prop("checked") ){
        	checkbox.prop("checked",true);
        	// $(this).css("opacity", "0.3");
        	$(this).addClass("active");
    	}
    	else {
        	checkbox.prop("checked",false);
        	// $(this).css("opacity", "1.0");
        	$(this).removeClass("active");
    	}

    	$('.loading').css('display', 'initial');
    	$('#filter-search').submit();
	})

	$("html").on("click", ".filter-location-list", function(event) {
		event.preventDefault();

		if ( $(this).hasClass('active') ){
        	$(this).removeClass("active");
    	}
    	else {
        	$(this).addClass("active");
    	}

    	$('.loading').css('display', 'initial');
    	$('#filter-search').submit();
	})


	$('#search-input').bind('input keyup', function(){
	    var $this = $(this);
	    var delay = 500;

	    clearTimeout($this.data('timer'));
	    $this.data('timer', setTimeout(function(){
	        $this.removeData('timer');
			$('.loading').css('display', 'initial');
	    	$('#filter-search').submit();
	    }, delay));
	});

});

//= require turbolinks