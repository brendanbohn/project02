$(document).ready(function(){

	$("#signup-form").hide();
	$("#signin-form").hide();

	$("#signup-button").click(function(e){
		e.preventDefault();
		console.log("clicked su button");
		$('#landing-content').addClass('blur');
		$("#signup-form").show();
	});
	$("#signin-button").click(function(e){
		e.preventDefault();
		console.log("clicked si button");
		$("#signin-form").show();
	});
});