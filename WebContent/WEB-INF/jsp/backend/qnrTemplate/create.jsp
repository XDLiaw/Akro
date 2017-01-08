<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<h3>新增</h3>
	<s:form action="createSubmit" method="post" validate="true">
		<div class="container-fluid ">
			<div class="col-md-12">
				<s:textfield label="問卷名稱" name="qnrTable.name" />
			</div>			
		</div>
		<div class="container-fluid">
			<div class="col-md-2">
				<h4>問題清單</h4>
			</div>		
		</div>	
		<div class="">
			<table id="questionListTable" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th>問題</th>
						<th>資料型態</th>
						<th>為查尋條件</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="qnrTable.questionList" status="stat">
						<s:if test="%{inputType != 'INPUT_TYPE_HIDDEN'}">
							<tr>
								<s:hidden class="nullable" name="%{'qnrTable.questionList['+#stat.index+'].nullable'}" value="true"/>
								<s:hidden class="dataType" name="%{'qnrTable.questionList['+#stat.index+'].dataType'}" />
								<td class="col-md-5">
									<s:textfield  class="question" name="%{'qnrTable.questionList['+#stat.index+'].question'}"/>
								</td>
								<td>
									<div class="col-md-6">
										<s:select class="inputType" name="%{'qnrTable.questionList['+#stat.index+'].inputType'}" list="qnrInputTypes" listKey="code" listValue="%{name}" />							
									</div>
									<div class="col-md-6 mayNeedHide hidden">
										<s:select class="fromOption" name="%{'qnrTable.questionList['+#stat.index+'].fromOption'}" list="optionTables" listKey="code" listValue="%{name}" disabled="true"/>							
									</div>
									<div class="col-md-6 mayNeedHide hidden">
										<s:textfield class="optionListString" name="%{'qnrTable.questionList['+#stat.index+'].optionListString'}" placeholder="輸入選項，選項間請用分號(;)隔開" disabled="true"/>
									</div>
									<div class="col-md-6 mayNeedHide hidden">
										<s:textfield class="length" name="%{'qnrTable.questionList['+#stat.index+'].length'}" placeholder="字元數上限(中文算2個字元)" disabled="true"/>
									</div>
									<div class="col-md-3 mayNeedHide hidden">
										<s:textfield class="precision" name="%{'qnrTable.questionList['+#stat.index+'].precision'}" placeholder="總位數" disabled="true"/>
									</div>
									<div class="col-md-3 mayNeedHide hidden">
										<s:textfield class="scale" name="%{'qnrTable.questionList['+#stat.index+'].scale'}" placeholder="最大小數位數" disabled="true"/>							
									</div>							
								</td>
								<td class="col-md-1">
									<s:checkbox label="" class="searchCondition" name="%{'qnrTable.questionList['+#stat.index+'].searchCondition'}" fieldValue="true"/>	
								</td>								
								<td class="col-md-1">
									<input type="button" class="btn-delete-question btn btn-danger" value="刪除" />
								</td>
							</tr>									
						</s:if>
					</s:iterator>		
				</tbody>
			</table>		
		</div>

		<div class="container-fluid">
			<input type="button" id="btn-add-question" class="btn btn-default" value="增加問題"/>	
			<s:submit class="btn btn-primary" value="儲存" onclick="submitClick()"/>
			<a class="btn btn-success" href="<s:url value="/qnrTemplate/init"/>">回索引頁</a>	
		</div>
	</s:form>
	
	<script type="text/javascript">
		function submitClick() {
			$(".length").each(function( index ) {
				if ($(".length").eq(index).val() == "") {
					$(".length").eq(index).val(0);
				}
			});
			$(".scale").each(function( index ) {
				if ($(".scale").eq(index).val() == "") {
					$(".scale").eq(index).val(0);
				}
			});
		}
	
		function inputTypeChange() {
			var rowIndex = parseInt($(this).closest('tr').index());
			var inputType = $(this).val();
// 			alert(rowIndex+": "+inputType);
			
			var selecterFromOption = $(this).closest('td').find("select.fromOption");
			if (inputType == "INPUT_TYPE_SELECT_OPTION" || inputType == "INPUT_TYPE_CHECKBOX_OPTION") {					
				selecterFromOption.removeAttr("disabled");
				selecterFromOption.closest("div.mayNeedHide").removeClass("hidden");
			} else {
				selecterFromOption.prop('selectedIndex', 0);
				selecterFromOption.attr("disabled", "disabled");
				selecterFromOption.closest("div.mayNeedHide").addClass("hidden");
			}
			
			var textfieldOptionList = $(this).closest('td').find("input[type='text'].optionListString");
			if (inputType == "INPUT_TYPE_SELECT" || inputType == "INPUT_TYPE_CHECKBOX") {					
				textfieldOptionList.removeAttr("disabled");
				textfieldOptionList.closest("div.mayNeedHide").removeClass("hidden");
			} else {
				textfieldOptionList.val("");
				textfieldOptionList.attr("disabled", "disabled");
				textfieldOptionList.closest("div.mayNeedHide").addClass("hidden");
			}
			
			var textfieldStringLength = $(this).closest('td').find("input[type='text'].length");
			if (inputType == "INPUT_TYPE_TEXTFIELD_TEXT") {					
				textfieldStringLength.removeAttr("disabled");
				textfieldStringLength.closest("div.mayNeedHide").removeClass("hidden");
			} else {
				textfieldStringLength.val("");
				textfieldStringLength.attr("disabled", "disabled");
				textfieldStringLength.closest("div.mayNeedHide").addClass("hidden");
			}				
	
			var textfieldPrecisionLength = $(this).closest('td').find("input[type='text'].precision");
			var textfieldScaleLength = $(this).closest('td').find("input[type='text'].scale");
			if (inputType == "INPUT_TYPE_TEXTFIELD_NUM") {					
				textfieldPrecisionLength.removeAttr("disabled");
				textfieldPrecisionLength.closest("div.mayNeedHide").removeClass("hidden");
				textfieldScaleLength.removeAttr("disabled");
				textfieldScaleLength.closest("div.mayNeedHide").removeClass("hidden");
			} else {
				textfieldPrecisionLength.val("");
				textfieldPrecisionLength.attr("disabled", "disabled");
				textfieldPrecisionLength.closest("div.mayNeedHide").addClass("hidden");
				textfieldScaleLength.val("");
				textfieldScaleLength.attr("disabled", "disabled");
				textfieldScaleLength.closest("div.mayNeedHide").addClass("hidden");
			}
		}
		
		function addQuestionClick() {
			var lastTableRow = $("table#questionListTable > tbody > tr:last");
//				lastTableRow.css({ backgroundColor: "red"});
			lastTableRow.clone().appendTo("table#questionListTable > tbody");
			
			var newIndex = parseInt($("table#questionListTable > tbody > tr:last").index());
			resetNameForRow(newIndex);
		}
		
		function deleteQuestionClick() {
			var rowCount = $("table#questionListTable > tbody > tr").length;
			if (rowCount == 1) {
				alert("無法刪除, 一份問卷至少要有一個問題!");
			} else {
				$(this).closest('tr').remove();				
			}			
			$("table#questionListTable > tbody > tr").each(function( index ){
				resetNameForRow(index);
			});
		}
		
		function resetNameForRow(index) {
			var tableRow = $("table#questionListTable > tbody > tr");			
			tableRow.eq(index).find(".nullable").attr("name", "qnrTable.questionList["+index+"].nullable");
			tableRow.eq(index).find(".dataType").attr("name", "qnrTable.questionList["+index+"].dataType");
			tableRow.eq(index).find(".question").attr("name", "qnrTable.questionList["+index+"].question");
			tableRow.eq(index).find(".inputType").attr("name", "qnrTable.questionList["+index+"].inputType");
			tableRow.eq(index).find(".fromOption").attr("name", "qnrTable.questionList["+index+"].fromOption");
			tableRow.eq(index).find(".optionListString").attr("name", "qnrTable.questionList["+index+"].optionListString");
			tableRow.eq(index).find(".length").attr("name", "qnrTable.questionList["+index+"].length");
			tableRow.eq(index).find(".precision").attr("name", "qnrTable.questionList["+index+"].precision");
			tableRow.eq(index).find(".scale").attr("name", "qnrTable.questionList["+index+"].scale");
			tableRow.eq(index).find(".searchCondition").attr("name", "qnrTable.questionList["+index+"].searchCondition");
		}

		$(document).ready(function(){
			$("#btn-add-question").click(function() {
				addQuestionClick();
				$("table#questionListTable > tbody > tr:last").find("select.inputType").change(inputTypeChange);
				$("table#questionListTable > tbody > tr:last").find("select.inputType").trigger("change");
				$("input[type='button'].btn-delete-question").click(deleteQuestionClick);
			});
			
			$("select.inputType").change(inputTypeChange);
			$("select.inputType").trigger("change");
			$("input[type='button'].btn-delete-question").click(deleteQuestionClick);
		});
		

	</script>

</body>
</html>