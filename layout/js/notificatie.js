// Iets met uren invullen?
$('.uren-mob-invullen').click(function(){
	$('.ac-small-mob').toggleClass('target-mob');
});

$(document).ready(function()
{
	$("#notificationLink").click(function()
	{
		$("#notificationContainer").fadeToggle(300);
		$("#notification_count").fadeOut("slow");
		return false;
	});

//Document Click
	$(document).click(function()
	{
		$("#notificationContainer").hide();
	});
//Popup Click
	$("#notificationContainer").click(function()
	{
		return false
	});

});