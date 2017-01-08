$(document).ready(function() {
	addMoreAttach();
});

function addMoreAttach() {	
	$("input[type=button].btn-addMoreAttach").click(function(){
		var newTr = $(this).parents("table").find("tr.hidden-sample-tr").clone();
		newTr.removeClass("hidden-sample-tr");
		$(this).parents("table").find("tbody").append(newTr);
		resetNameAttrForAttachTable();
	});
}

function fakeBrowseBtnOnclick(this_) {
	$(this_).parents("tr").find("input[type=file]").trigger("click");
}
function deleteFileBtnOnclick(this_) {
	var rowCount = $(this_).parents("tbody").find("tr").length;
	$(this_).parents("tr").remove();
	resetNameAttrForAttachTable();
}
function fileOnchange(this_) {
	var fileName = $(this_).get(0).files[0].name;
	$(this_).parents("tr").find(".label-fileName").html(fileName);
	readURL(this_);
}
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.readAsDataURL(input.files[0]);
	}
}
function resetNameAttrForAttachTable() {
	$("#table-attach > tbody > tr").each(function( index ){
		var tr = $("#table-attach > tbody > tr").eq(index);
		tr.find(".id").attr("name", "activity.attachList["+index+"].id");
		tr.find(".upload").attr("name", "activity.attachList["+index+"].upload");
		tr.find(".fileType").attr("name", "activity.attachList["+index+"].fileType");
		tr.find(".fileTitle").attr("name", "activity.attachList["+index+"].fileTitle");
	});
}