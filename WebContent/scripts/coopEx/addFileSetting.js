$(document).ready(function() {
	addMore();
	fileBrowseSetting();
});

function addMore() {	
	$("input[type=button].btn-addMoreImg").click(function(){
		var newTr = $(this).parents("table").find("tr.hidden-sample-tr").clone();
		newTr.removeClass("hidden-sample-tr");
		$(this).parents("table").find("tbody").append(newTr);
		fileBrowseSetting();
		resetNameAttrForImgTable();
	});
	
	$("input[type=button].btn-addMoreVideo").click(function(){
		var newTr = $(this).parents("table").find("tr.hidden-sample-tr").clone();
		newTr.removeClass("hidden-sample-tr");
		$(this).parents("table").find("tbody").append(newTr);
		fileBrowseSetting();
		resetNameAttrForVideoTable();
	});		
	
	$("input[type=button].btn-addMoreAttach").click(function(){
		var newTr = $(this).parents("table").find("tr.hidden-sample-tr").clone();
		newTr.removeClass("hidden-sample-tr");
		$(this).parents("table").find("tbody").append(newTr);
//		fileBrowseSetting();
		resetNameAttrForAttachTable();
	});
}

function fakeBrowseBtnClick(this_) {
	$(this_).parents("tr").find("input[type=file]").trigger("click");
}
function fileOnChange(this_) {
	var fileName = $(this_).get(0).files[0].name;
	$(this_).parents("tr").find(".label-fileName").html(fileName);
	readURL(this_); // display subnail
}
function deletedeleteFileBtnClick(this_) {
	var rowCount = $(this_).parents("tbody").find("tr").length;
	$(this_).parents("tr").remove();
	resetNameAttrForImgTable();
	resetNameAttrForVideoTable();
	resetNameAttrForAttachTable();
}

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
			$(input).parents("tr").find("img").attr('src', e.target.result);
			$(input).parents("tr").find("video").attr('src', e.target.result);
		}

		reader.readAsDataURL(input.files[0]);
	}
}


function resetNameAttrForImgTable() {
	$("#table-img > tbody > tr").each(function( index ){
		var tr = $("#table-img > tbody > tr").eq(index);
		
		tr.find(".id").attr("name", "coopEx.imgs["+index+"].id");
		tr.find(".filePath").attr("name", "coopEx.imgs["+index+"].filePath");
		tr.find(".fileContentType").attr("name", "coopEx.imgs["+index+"].fileContentType");
		tr.find(".fileName").attr("name", "coopEx.imgs["+index+"].fileName");
		tr.find(".fileDesc").attr("name", "coopEx.imgs["+index+"].fileDesc");
		tr.find(".upload").attr("name", "coopEx.imgs["+index+"].upload");
	});
}

function resetNameAttrForVideoTable() {
	$("#table-video > tbody > tr").each(function( index ){
		var tr = $("#table-video > tbody > tr").eq(index);
		
		tr.find(".id").attr("name", "coopEx.videos["+index+"].id");
		tr.find(".filePath").attr("name", "coopEx.videos["+index+"].filePath");
		tr.find(".fileContentType").attr("name", "coopEx.videos["+index+"].fileContentType");
		tr.find(".fileName").attr("name", "coopEx.videos["+index+"].fileName");
		tr.find(".fileDesc").attr("name", "coopEx.videos["+index+"].fileDesc");
		tr.find(".upload").attr("name", "coopEx.videos["+index+"].upload");
	});
}

function resetNameAttrForAttachTable() {
	$("#table-attach > tbody > tr").each(function( index ){
		var tr = $("#table-attach > tbody > tr").eq(index);

		tr.find(".id").attr("name", "coopEx.attachFiles["+index+"].id");
		tr.find(".filePath").attr("name", "coopEx.attachFiles["+index+"].filePath");
		tr.find(".fileContentType").attr("name", "coopEx.attachFiles["+index+"].fileContentType");
		tr.find(".fileName").attr("name", "coopEx.attachFiles["+index+"].fileName");
		tr.find(".fileDesc").attr("name", "coopEx.attachFiles["+index+"].fileDesc");
		tr.find(".upload").attr("name", "coopEx.attachFiles["+index+"].upload");
	});
}