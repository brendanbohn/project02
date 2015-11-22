$(document).ready(function(){

	$("#signup-form").hide();
	$("#signin-form").hide();

	$(".close").click(function(e) {
		e.preventDefault();
		$("#signup-form").hide();
		$("#signin-form").hide();
		$('#landing-content').removeClass('dim');
	});

	$("#signup-button").click(function(e){
		e.preventDefault();
		$('#landing-content').addClass('dim');
		$("#signup-form").show();
	});
	$("#signin-button").click(function(e){
		e.preventDefault();
		$("#signin-form").show();
		$('#landing-content').addClass('dim');
	});
	
});