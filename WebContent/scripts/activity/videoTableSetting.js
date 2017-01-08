$(document).ready(function() {
	$("#activityVideoForm").hide();
	$("#activityVideoForm .btn-addConfirm").hide();
	$("#activityVideoForm .btn-editConfirm").hide();
	
	addMoreVideo();
	addVideoConfirm();
	editVideoConfirm();
	bindEditVideoRowBtn();
	bindDeleteVideoRowBtn();
	cancleActivityVideoFrom();
});
function addMoreVideo() {
	$("#btn-addMoreVideo").click(function(){
		$("#form-create").hide();
		$("#form-update").hide();
		resetSubForm($("#activityVideoForm"));
		$("#activityVideoForm").show();
		$("#activityVideoForm .btn-addConfirm").show();
		$("#activityVideoForm .btn-editConfirm").hide();
		$('html,body').animate({scrollTop:$('#activityVideoForm').offset().top},500);
	});
}

function addVideoConfirm() {
	$("#activityVideoForm .btn-addConfirm").click(function() {
		var newTr = $("#table-video").find("tr.hidden-sample-tr").clone();
		setValueBackToVideoRow(newTr);
		newTr.removeClass("hidden-sample-tr");
		$("#table-video").find("tbody").append(newTr);
		bindEditVideoRowBtn();
		bindDeleteVideoRowBtn();
		resetNameAttrForVideoTable();
		$('#activityVideoForm .btn-cancel').trigger("click");
	});
}

function editVideoConfirm() {
	$("#activityVideoForm .btn-editConfirm").click(function(){
		var index = $("#activityVideoForm .videoRowIndex").val();
		var editTr = $("#table-video tbody tr").eq(index);
		setValueBackToVideoRow(editTr);
		resetNameAttrForVideoTable();
		$('#activityVideoForm .btn-cancel').trigger("click");
	});
}

function bindEditVideoRowBtn() {
	$("#table-video input[type=button].btn-edit").click(function() {
		$("#form-create").hide();
		$("#form-update").hide();
		$("#activityVideoForm").show();
		$("#activityVideoForm .btn-addConfirm").hide();
		$("#activityVideoForm .btn-editConfirm").show();
		$('html,body').animate({scrollTop:$('#activityVideoForm').offset().top},300);
		
		var tr = $(this).parents("tr");
		setValueToActivityVideoForm(tr);
	});		
}

function bindDeleteVideoRowBtn() {
	$("#table-video input[type=button].btn-del").click(function(){
		$(this).parents("tr").remove();
		resetNameAttrForVideoTable();
	});
}

function cancleActivityVideoFrom() {
	$('#activityVideoForm .btn-cancel').click(function() {
		resetSubForm($("#activityVideoForm"));
		$("#activityVideoForm").hide();
		$("#activityVideoForm .btn-addConfirm").hide();
		$("#activityVideoForm .btn-editConfirm").hide();
		$("#form-create").show();
		$("#form-update").show();
		$('html,body').animate({scrollTop:$('#btn-addMoreVideo').offset().top},300);
	});
}

function setValueToActivityVideoForm(tr) {
	var rowIndex = $("#table-video tbody tr").index(tr);
	$('#activityVideoForm .videoRowIndex').val(rowIndex);
	$('#activityVideoForm .title').val(tr.find(".title").val());
	$('#activityVideoForm .videoUrl').val(tr.find(".videoUrl").val());
	$('#activityVideoForm .videoDesc').val(tr.find(".videoDesc").val());
	$('#activityVideoForm .clickNum').val(tr.find(".clickNum").val());
	$('#activityVideoForm .sort').val(tr.find(".sort").val());
	$('#activityVideoForm .displayStatus').val(tr.find(".displayStatus").val());
}

function setValueBackToVideoRow(tr) {
	tr.find(".title").val($("#activityVideoForm .title").val());
	tr.find("td.td-title").html($("#activityVideoForm .title").val());
	tr.find(".videoUrl").val($("#activityVideoForm .videoUrl").val());
	tr.find("td.td-videoUrl").html($("#activityVideoForm .videoUrl").val());
	tr.find(".videoDesc").val($("#activityVideoForm .videoDesc").val());
	tr.find(".clickNum").val($("#activityVideoForm .clickNum").val());
	tr.find("td.td-clickNum").html($("#activityVideoForm .clickNum").val());
	tr.find(".sort").val($("#activityVideoForm .sort").val());
	tr.find(".displayStatus").val($("#activityVideoForm .displayStatus").val());
}

function resetNameAttrForVideoTable() {
	$("#table-video > tbody > tr").each(function(index){
		var tr = $("#table-video > tbody > tr").eq(index);
		tr.find(".td-No").html(index+1);
		tr.find(".id").attr("name", "activity.videoList["+index+"].id");
		tr.find(".isValid").attr("name", "activity.videoList["+index+"].isValid");
		tr.find(".createTime").attr("name", "activity.videoList["+index+"].createTime");
		tr.find(".createUser").attr("name", "activity.videoList["+index+"].createUser");
		tr.find(".updateTime").attr("name", "activity.videoList["+index+"].updateTime");
		tr.find(".updateUser").attr("name", "activity.videoList["+index+"].updateUser");
		tr.find(".ver").attr("name", "activity.videoList["+index+"].ver");
		tr.find(".sort").attr("name", "activity.videoList["+index+"].sort");
		tr.find(".displayStatus").attr("name", "activity.videoList["+index+"].displayStatus");
		tr.find(".clickNum").attr("name", "activity.videoList["+index+"].clickNum");
		tr.find(".title").attr("name", "activity.videoList["+index+"].title");
		tr.find(".videoUrl").attr("name", "activity.videoList["+index+"].videoUrl");
		tr.find(".videoDesc").attr("name", "activity.videoList["+index+"].videoDesc");
	});
}

function resetSubForm(form) {
	form.find("input[type=text]").val("");
	form.find("input[type=number]").val("0");
	form.find("textarea").val("");
	form.find("select").prop('selectedIndex', 0);
}