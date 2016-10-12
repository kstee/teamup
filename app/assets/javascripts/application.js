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
//= require turbolinks
//= require bootstrap
//= require_tree .
//= require_self

$(document).ready(function(){

	$('.dropdown-toggle').dropdown();
	
	$("html").on("click", ".portfolio-box", function(event) {
	// $(".portfolio-box").on("click", function(event) {
		event.preventDefault();
		var current_id = this.id;

		var cb_class = ".cb-" + current_id;
		
		var checkbox = $('.checkboxes').find(cb_class);

		if ( !checkbox.prop("checked") ){
        	checkbox.prop("checked",true);
        	$(this).css("opacity", "0.3");
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
	})
});