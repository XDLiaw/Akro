$(document).ready(function() {
	rdResultSetting();
	transferCaseSetting();
	mainProjectSetting();
	
	resetRdResultNameAttr();
	resetTransferCaseNameAttr();
	resetMainProjectNameAttr();
});

//==============================================================================
function rdResultSetting() {
	bindEditRdResultRowBtn();
	bindDeleteRdResultRowBtn();
	$("#rdResultForm").hide();
	$("#rdResultForm .btn-addConfirm").hide();
	$("#rdResultForm .btn-editConfirm").hide();	
	
	$("input[type=button]#add-rdResult").click(function(){
		$("#form-update").hide();
		resetSubForm($("#rdResultForm"));
		$("#rdResultForm").show();
		$("#rdResultForm .btn-addConfirm").show();
		$("#rdResultForm .btn-editConfirm").hide();
		$('html,body').animate({scrollTop:$('#rdResultForm').offset().top},500);
	});
	
	$("#rdResultForm .btn-addConfirm").click(function() {
		var newTr = $("#table-rdResult").find("tr.hidden-sample-tr").clone();
		setValueToRdResultRow(newTr);
		newTr.removeClass("hidden-sample-tr");
		$("#table-rdResult").find("tbody").append(newTr);
		bindEditRdResultRowBtn();
		bindDeleteRdResultRowBtn();
		resetRdResultNameAttr();
		$('#rdResultForm .btn-cancel').trigger("click");
	});
	
	$("#rdResultForm .btn-editConfirm").click(function(){
		var index = $("#rdResultForm .rdResultRowIndex").val();
		var editTr = $("#table-rdResult tbody tr").eq(index);
		setValueToRdResultRow(editTr);
		resetRdResultNameAttr();
		$('#rdResultForm .btn-cancel').trigger("click");
	});
	
	$('#rdResultForm .btn-cancel').click(function() {
		resetSubForm($("#rdResultForm"));
		$("#rdResultForm").hide();
		$("#rdResultForm .btn-addConfirm").hide();
		$("#rdResultForm .btn-editConfirm").hide();
		$("#form-update").show();
		$('html,body').animate({scrollTop:$('#add-rdResult').offset().top},300);
	});
}
function transferCaseSetting() {
	bindEditTransferCaseRowBtn();
	bindDeleteTransferCaseRowBtn();
	$("#transferCaseForm").hide();
	$("#transferCaseForm .btn-addConfirm").hide();
	$("#transferCaseForm .btn-editConfirm").hide();	
	
	$("input[type=button]#add-transferCases").click(function(){
		$("#form-update").hide();
		resetSubForm($("#transferCaseForm"));
		$("#transferCaseForm").find(".yearStart").val("2010");
		$("#transferCaseForm").find(".yearEnd").val("2010");
		$("#transferCaseForm").show();
		$("#transferCaseForm .btn-addConfirm").show();
		$("#transferCaseForm .btn-editConfirm").hide();
		$('html,body').animate({scrollTop:$('#transferCaseForm').offset().top},500);
	});
	
	$("#transferCaseForm .btn-addConfirm").click(function() {
		var newTr = $("#table-transferCase").find("tr.hidden-sample-tr").clone();
		setValueToTransferCaseRow(newTr);
		newTr.removeClass("hidden-sample-tr");
		$("#table-transferCase").find("tbody").append(newTr);
		bindEditTransferCaseRowBtn();
		bindDeleteTransferCaseRowBtn();
		resetTransferCaseNameAttr();
		$('#transferCaseForm .btn-cancel').trigger("click");
	});
	
	$("#transferCaseForm .btn-editConfirm").click(function(){
		var index = $("#transferCaseForm .transferCaseRowIndex").val();
		var editTr = $("#table-transferCase tbody tr").eq(index);
		setValueToTransferCaseRow(editTr);
		resetTransferCaseNameAttr();
		$('#transferCaseForm .btn-cancel').trigger("click");
	});
	
	$('#transferCaseForm .btn-cancel').click(function() {
		resetSubForm($("#transferCaseForm"));
		$("#transferCaseForm").hide();
		$("#transferCaseForm .btn-addConfirm").hide();
		$("#transferCaseForm .btn-editConfirm").hide();
		$("#form-update").show();
		$('html,body').animate({scrollTop:$('#add-transferCases').offset().top},300);
	});	
}
function mainProjectSetting() {
	bindEditMainProjectRowBtn();
	bindDeleteMainProjectRowBtn();
	$("#mainProjectForm").hide();
	$("#mainProjectForm .btn-addConfirm").hide();
	$("#mainProjectForm .btn-editConfirm").hide();	
	
	$("input[type=button]#add-mainProject").click(function(){
		$("#form-update").hide();
		resetSubForm($("#mainProjectForm"));
		$("#mainProjectForm").find(".yearStart").val("2010");
		$("#mainProjectForm").find(".yearEnd").val("2010");
		$("#mainProjectForm").show();
		$("#mainProjectForm .btn-addConfirm").show();
		$("#mainProjectForm .btn-editConfirm").hide();
		$('html,body').animate({scrollTop:$('#mainProjectForm').offset().top},500);
	});
	
	$("#mainProjectForm .btn-addConfirm").click(function() {
		var newTr = $("#table-mainProject").find("tr.hidden-sample-tr").clone();
		setValueToMainProjectRow(newTr);
		newTr.removeClass("hidden-sample-tr");
		$("#table-mainProject").find("tbody").append(newTr);
		bindEditMainProjectRowBtn();
		bindDeleteMainProjectRowBtn();
		resetMainProjectNameAttr();
		$('#mainProjectForm .btn-cancel').trigger("click");
	});
	
	$("#mainProjectForm .btn-editConfirm").click(function(){
		var index = $("#mainProjectForm .mainProjectRowIndex").val();
		var editTr = $("#table-mainProject tbody tr").eq(index);
		setValueToMainProjectRow(editTr);
		resetMainProjectNameAttr();
		$('#mainProjectForm .btn-cancel').trigger("click");
	});
	
	$('#mainProjectForm .btn-cancel').click(function() {
		resetSubForm($("#mainProjectForm"));
		$("#mainProjectForm").hide();
		$("#mainProjectForm .btn-addConfirm").hide();
		$("#mainProjectForm .btn-editConfirm").hide();
		$("#form-update").show();
		$('html,body').animate({scrollTop:$('#add-mainProject').offset().top},300);
	});	
}
//==============================================================================
//==============================================================================
function bindEditRdResultRowBtn() {
	$("#table-rdResult input[type=button].btn-edit").click(function() {
		$("#form-update").hide();
		$("#rdResultForm").show();
		$("#rdResultForm .btn-addConfirm").hide();
		$("#rdResultForm .btn-editConfirm").show();
		$('html,body').animate({scrollTop:$('#rdResultForm').offset().top},300);
		
		var tr = $(this).parents("tr");
		setValueToRdResultForm(tr);
	});		
}
function bindEditTransferCaseRowBtn() {
	$("#table-transferCase input[type=button].btn-edit").click(function() {
		$("#form-update").hide();
		$("#transferCaseForm").show();
		$("#transferCaseForm .btn-addConfirm").hide();
		$("#transferCaseForm .btn-editConfirm").show();
		$('html,body').animate({scrollTop:$('#transferCaseForm').offset().top},300);
		
		var tr = $(this).parents("tr");
		setValueToTransferCaseForm(tr);
	});	
}
function bindEditMainProjectRowBtn() {
	$("#table-mainProject input[type=button].btn-edit").click(function() {
		$("#form-update").hide();
		$("#mainProjectForm").show();
		$("#mainProjectForm .btn-addConfirm").hide();
		$("#mainProjectForm .btn-editConfirm").show();
		$('html,body').animate({scrollTop:$('#mainProjectForm').offset().top},300);
		
		var tr = $(this).parents("tr");
		setValueToMainProjectForm(tr);
	});
}
function bindDeleteRdResultRowBtn() {
	$("#table-rdResult input[type=button].btn-del").click(function(){
		$(this).parents("tr").remove();
		resetRdResultNameAttr();
	});
}
function bindDeleteTransferCaseRowBtn() {
	$("#table-transferCase input[type=button].btn-del").click(function(){
		$(this).parents("tr").remove();
		resetTransferCaseNameAttr();
	});	
}
function bindDeleteMainProjectRowBtn() {
	$("#table-mainProject input[type=button].btn-del").click(function(){
		$(this).parents("tr").remove();
		resetMainProjectNameAttr();
	});
}
//==============================================================================
//==============================================================================
function setValueToRdResultForm(tr) {
	var rowIndex = $("#table-rdResult tbody tr").index(tr);
	$("#rdResultForm .rdResultRowIndex").val(rowIndex);
	$("#rdResultForm .name").val(tr.find(".name").val());
	$("#rdResultForm .type").val(tr.find(".type").val());
	$("#rdResultForm .inventer").val(tr.find(".inventer").val());
	$("#rdResultForm .owner").val(tr.find(".owner").val());
	$("#rdResultForm .applicationNo").val(tr.find(".applicationNo").val());
	$("#rdResultForm .patentNo").val(tr.find(".patentNo").val());
	$("#rdResultForm .country").val(tr.find(".country").val());
	$("#rdResultForm .patentPeriodStart").val(tr.find(".patentPeriodStart").val());
	$("#rdResultForm .patentPeriodEnd").val(tr.find(".patentPeriodEnd").val());
	$("#rdResultForm .patentAbstract").val(tr.find(".patentAbstract").val());
	$("#rdResultForm .usage").val(tr.find(".usage").val());
	$("#rdResultForm .updateDate").val(tr.find(".updateDate").val());
	$("#rdResultForm .priority").val(tr.find(".priority").val());
}
function setValueToRdResultRow(tr) {
	tr.find(".name").val($("#rdResultForm .name").val());
	tr.find("td.td-name").html($("#rdResultForm .name").val());
	tr.find(".type").val($("#rdResultForm .type").val());
	tr.find("td.td-type").html($("#rdResultForm .type").val());	
	tr.find(".inventer").val($("#rdResultForm .inventer").val());
	tr.find(".owner").val($("#rdResultForm .owner").val());
	tr.find(".patentNo").val($("#rdResultForm .patentNo").val());
	tr.find(".country").val($("#rdResultForm .country").val());
	tr.find(".patentPeriodStart").val($("#rdResultForm .patentPeriodStart").val());
	tr.find(".patentPeriodEnd").val($("#rdResultForm .patentPeriodEnd").val());
	tr.find(".patentAbstract").val($("#rdResultForm .patentAbstract").val());
	tr.find(".usage").val($("#rdResultForm .usage").val());
	tr.find(".updateDate").val(getCurrentDate());
	tr.find("td.td-updateDate").html(getCurrentDate());	
	tr.find(".priority").val($("#rdResultForm .priority").val());
}
function setValueToTransferCaseForm(tr) {
	var rowIndex = $("#table-transferCase tbody tr").index(tr);
	$("#transferCaseForm .transferCaseRowIndex").val(rowIndex);
	$("#transferCaseForm .applyField").val(tr.find(".applyField").val());
	$("#transferCaseForm .targetOrg").val(tr.find(".targetOrg").val());
	$("#transferCaseForm .yearStart").val(tr.find(".yearStart").val());
	$("#transferCaseForm .monthStart").val(tr.find(".monthStart").val());
	$("#transferCaseForm .yearEnd").val(tr.find(".yearEnd").val());
	$("#transferCaseForm .monthEnd").val(tr.find(".monthEnd").val());
	$("#transferCaseForm .updateDate").val(tr.find(".updateDate").val());
	$("#transferCaseForm .priority").val(tr.find(".priority").val());
}
function setValueToTransferCaseRow(tr) {
	tr.find(".applyField").val($("#transferCaseForm .applyField").val());
	tr.find("td.td-applyField").html($("#transferCaseForm .applyField").val());
	tr.find(".targetOrg").val($("#transferCaseForm .targetOrg").val());
	tr.find("td.td-targetOrg").html($("#transferCaseForm .targetOrg").val());
	
	var yearStart = $("#transferCaseForm .yearStart").val();
	var monthStart = $("#transferCaseForm .monthStart").val();
	var yearEnd = $("#transferCaseForm .yearEnd").val();
	var monthEnd = $("#transferCaseForm .monthEnd").val();
	tr.find(".yearStart").val(yearStart);
	tr.find(".monthStart").val(monthStart);
	tr.find(".yearEnd").val(yearEnd);
	tr.find(".monthEnd").val(monthEnd);
	var time = yearStart + "年" + monthStart + "月";
	if (yearEnd != null && yearEnd != "" && monthEnd != null && monthEnd != "") {
		time += " ~ " + yearEnd + "年" + monthEnd + "月";
	}
	tr.find("td.td-time").html(time);
	
	tr.find(".updateDate").val(getCurrentDate());
	tr.find("td.td-updateDate").html(getCurrentDate());	
	tr.find(".priority").val($("#transferCaseForm .priority").val());
}
function setValueToMainProjectForm(tr) {
	var rowIndex = $("#table-mainProject tbody tr").index(tr);
	$("#mainProjectForm .mainProjectRowIndex").val(rowIndex);
	$("#mainProjectForm .name").val(tr.find(".name").val());
	$("#mainProjectForm .coopComName").val(tr.find(".coopComName").val());
	$("#mainProjectForm .yearStart").val(tr.find(".yearStart").val());
	$("#mainProjectForm .monthStart").val(tr.find(".monthStart").val());
	$("#mainProjectForm .yearEnd").val(tr.find(".yearEnd").val());
	$("#mainProjectForm .monthEnd").val(tr.find(".monthEnd").val());
	$("#mainProjectForm .updateDate").val(tr.find(".updateDate").val());
	$("#mainProjectForm .priority").val(tr.find(".priority").val());
}
function setValueToMainProjectRow(tr) {
	tr.find(".name").val($("#mainProjectForm .name").val());
	tr.find("td.td-name").html($("#mainProjectForm .name").val());
	tr.find(".coopComName").val($("#mainProjectForm .coopComName").val());
	tr.find("td.td-coopComName").html($("#mainProjectForm .coopComName").val());
	
	var yearStart = $("#mainProjectForm .yearStart").val();
	var monthStart = $("#mainProjectForm .monthStart").val();
	var yearEnd = $("#mainProjectForm .yearEnd").val();
	var monthEnd = $("#mainProjectForm .monthEnd").val();
	tr.find(".yearStart").val(yearStart);
	tr.find(".monthStart").val(monthStart);
	tr.find(".yearEnd").val(yearEnd);
	tr.find(".monthEnd").val(monthEnd);
	var time = yearStart + "年" + monthStart + "月";
	if (yearEnd != null && yearEnd != "" && monthEnd != null && monthEnd != "") {
		time += " ~ " + yearEnd + "年" + monthEnd + "月";
	}
	tr.find("td.td-time").html(time);

	tr.find(".updateDate").val(getCurrentDate());
	tr.find("td.td-updateDate").html(getCurrentDate());	
	tr.find(".priority").val($("#mainProjectForm .priority").val());
}
//==============================================================================
//==============================================================================
function resetRdResultNameAttr() {
	$("#table-rdResult > tbody > tr").each(function( index ){
		var tr = $("#table-rdResult > tbody > tr").eq(index);
		tr.find(".td-No").html(index+1);
		tr.find(".id").attr("name", "talentedPeople.rdResults["+index+"].id");
		tr.find(".isValid").attr("name", "talentedPeople.rdResults["+index+"].isValid");
		tr.find(".createTime").attr("name", "talentedPeople.rdResults["+index+"].createTime");
		tr.find(".createUser").attr("name", "talentedPeople.rdResults["+index+"].createUser");
		tr.find(".updateTime").attr("name", "talentedPeople.rdResults["+index+"].updateTime");
		tr.find(".updateUser").attr("name", "talentedPeople.rdResults["+index+"].updateUser");
		tr.find(".ver").attr("name", "talentedPeople.rdResults["+index+"].ver");
		tr.find(".name").attr("name", "talentedPeople.rdResults["+index+"].name");
		tr.find(".type").attr("name", "talentedPeople.rdResults["+index+"].type");
		tr.find(".inventer").attr("name", "talentedPeople.rdResults["+index+"].inventer");
		tr.find(".owner").attr("name", "talentedPeople.rdResults["+index+"].owner");
		tr.find(".patentNo").attr("name", "talentedPeople.rdResults["+index+"].patentNo");
		tr.find(".country").attr("name", "talentedPeople.rdResults["+index+"].optionCountry.id");
		tr.find(".patentPeriodStart").attr("name", "talentedPeople.rdResults["+index+"].patentPeriodStart");
		tr.find(".patentPeriodEnd").attr("name", "talentedPeople.rdResults["+index+"].patentPeriodEnd");
		tr.find(".patentAbstract").attr("name", "talentedPeople.rdResults["+index+"].patentAbstract");
		tr.find(".usage").attr("name", "talentedPeople.rdResults["+index+"].usage");
		tr.find(".updateDate").attr("name", "talentedPeople.rdResults["+index+"].updateDate");
		tr.find(".priority").attr("name", "talentedPeople.rdResults["+index+"].priority");
	});
}
function resetTransferCaseNameAttr() {
	$("#table-transferCase > tbody > tr").each(function( index ){
		var tr = $("#table-transferCase > tbody > tr").eq(index);
		tr.find(".td-No").html(index+1);
		tr.find(".id").attr("name", "talentedPeople.transferCases["+index+"].id");
		tr.find(".isValid").attr("name", "talentedPeople.transferCases["+index+"].isValid");
		tr.find(".createTime").attr("name", "talentedPeople.transferCases["+index+"].createTime");
		tr.find(".createUser").attr("name", "talentedPeople.transferCases["+index+"].createUser");
		tr.find(".updateTime").attr("name", "talentedPeople.transferCases["+index+"].updateTime");
		tr.find(".updateUser").attr("name", "talentedPeople.transferCases["+index+"].updateUser");
		tr.find(".ver").attr("name", "talentedPeople.transferCases["+index+"].ver");
		tr.find(".applyField").attr("name", "talentedPeople.transferCases["+index+"].applyField");
		tr.find(".targetOrg").attr("name", "talentedPeople.transferCases["+index+"].targetOrg");
		tr.find(".yearStart").attr("name", "talentedPeople.transferCases["+index+"].yearStart");
		tr.find(".monthStart").attr("name", "talentedPeople.transferCases["+index+"].monthStart");
		tr.find(".yearEnd").attr("name", "talentedPeople.transferCases["+index+"].yearEnd");
		tr.find(".monthEnd").attr("name", "talentedPeople.transferCases["+index+"].monthEnd");
		tr.find(".updateDate").attr("name", "talentedPeople.transferCases["+index+"].updateDate");
		tr.find(".priority").attr("name", "talentedPeople.transferCases["+index+"].priority");
	});
}
function resetMainProjectNameAttr() {
	$("#table-mainProject > tbody > tr").each(function( index ){
		var tr = $("#table-mainProject > tbody > tr").eq(index);
		tr.find(".td-No").html(index+1);
		tr.find(".id").attr("name", "talentedPeople.mainProjects["+index+"].id");
		tr.find(".isValid").attr("name", "talentedPeople.mainProjects["+index+"].isValid");
		tr.find(".createTime").attr("name", "talentedPeople.mainProjects["+index+"].createTime");
		tr.find(".createUser").attr("name", "talentedPeople.mainProjects["+index+"].createUser");
		tr.find(".updateTime").attr("name", "talentedPeople.mainProjects["+index+"].updateTime");
		tr.find(".updateUser").attr("name", "talentedPeople.mainProjects["+index+"].updateUser");
		tr.find(".ver").attr("name", "talentedPeople.mainProjects["+index+"].ver");
		tr.find(".name").attr("name", "talentedPeople.mainProjects["+index+"].name");
		tr.find(".coopComName").attr("name", "talentedPeople.mainProjects["+index+"].coopComName");
		tr.find(".yearStart").attr("name", "talentedPeople.mainProjects["+index+"].yearStart");
		tr.find(".monthStart").attr("name", "talentedPeople.mainProjects["+index+"].monthStart");
		tr.find(".yearEnd").attr("name", "talentedPeople.mainProjects["+index+"].yearEnd");
		tr.find(".monthEnd").attr("name", "talentedPeople.mainProjects["+index+"].monthEnd");
		tr.find(".updateDate").attr("name", "talentedPeople.mainProjects["+index+"].updateDate");
		tr.find(".priority").attr("name", "talentedPeople.mainProjects["+index+"].priority");
	});
}
//==============================================================================
function resetSubForm(form) {
	form.find("input[type=text]").val("");
	form.find("textarea").val("");
	form.find("select").prop('selectedIndex', 0);
}
function getCurrentDate() {
	var date = new Date();
	return date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
}

