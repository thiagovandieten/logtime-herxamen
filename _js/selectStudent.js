function add_student()
{
	var select = document.getElementById('choose_student');
	var selected = select.options[select.selectedIndex];
	console.log(selected);

}

function remove_student()
{
	var select = document.getElementById('chosen_student');
	var selected = select.options[select.selectedIndex];
	console.log(selected);
}