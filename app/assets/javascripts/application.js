// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.

//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

jQuery.ajaxSetup({
	'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).foundation();

$(document).ready(function() {



$('#hidden-content').hide();
$('#hidden-content-reveal').click(function() {
$('#hidden-content').slideToggle(400);
	return false;
});


$('a.delete_post').bind('ajax:success', function() {      
    $(this).closest("#postbox").fadeOut();  
});

$('a.changescore').bind('ajax:success', function(evt, data, status, xhr) {  
    $(this).closest("#postbox").find("#score h2").html(data.score).fadeIn(); 
});


$('.full-content-reveal').click(function() {
$(this).closest('#postbox').find("#full-content").slideToggle(100);
	return false;
});

});









