$(document).ready(function(){

	$("#signup-form").hide();
	$("#signin-form").hide();
	$("#how-content").hide();

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
	$(".expand-button").click(function(e){
		e.preventDefault();
		$(".down-arrow").toggle();
		$(".up-arrow").toggle();
		componentHandler.upgradeDom();
	});

	$('#how').click(function(){
		console.log('clicked the how');
		$('body').css('background-color','#bfbfbf');
		$("#how-content").show();
		$('body').animate({scrollTop: $('#how-content').offset().top}, "slow");
		return false;
	});
});