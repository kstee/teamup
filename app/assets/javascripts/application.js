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
//= require turbolinks
//= require bootstrap
//= require bootstrap-timepicker
//= require_tree .
//= require_self

$(document).ready(function(){

	$('.dropdown-toggle').dropdown();
	
	$(".portfolio-box").on("click", function(event) {
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


	// $(".img-responsive").hover(function(){
	//     $(this).fadeTo("fast",0.3);
	// }, function(){
	//     $(this).fadeTo("fast",1.0);
 //  	});


        // $(".portfolio-box").hover(function(){
        // 	// alert('hi');
        //     $(this).addClass("hover");
        // }, function(){
        // // handle the mouseleave functionality
        //     $(this).removeClass("hover");
        // });

		// OPACITY OF BUTTON SET TO 0%
	// $(".roll").css("opacity","0");
 
	// 	// ON MOUSE OVER
	// $(".roll").hover(function () {
	// 	// alert('hovered');
	// 	// SET OPACITY TO 70%
	// 	$(this).stop().animate({
	// 		opacity: .7
	// 	}, "slow");
	// }, function () {
	// 	// SET OPACITY BACK TO 50%
	// 	$(this).stop().animate({
	// 	opacity: 0
	// 	}, "slow");
	// });
});