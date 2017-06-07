$(document).ready(function(){
	
	$("#signup_link,#login_link").click(function(){
		window.location.href = $(this).data('link');
	});
	
});