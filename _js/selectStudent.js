function addStudent()
{
	var selected = $("#choose_student option:selected").clone();
	$("#chosen_student").append(selected);
	$("#projectleider").append($("#choose_student option:selected"));
	$("#chosen_student option:not(:first)").attr("selected", "selected");

}

function removeStudent()
{
	var selected = $("#chosen_student option:selected");
	$("#choose_student").append(selected);
	console.log(); $("#projectleider option[value='" + $(selected).val() + "']").remove();
}