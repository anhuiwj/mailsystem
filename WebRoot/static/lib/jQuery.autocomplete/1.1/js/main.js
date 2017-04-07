var prosals = '${emails}';
$(document).ready(function(){
	$('#search-form').autocomplete({
		hints: proposals,
		width: 300,
		height: 30,
		onSubmit: function(text){
			$('#message').html('Selected: <b>' + text + '</b>');			
		}
	});
});
