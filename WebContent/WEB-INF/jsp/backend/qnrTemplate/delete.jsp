<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<h3>刪除</h3>
	<s:form action="deleteSubmit" method="post" validate="true">
		<s:hidden name="id" />
		<div class="container-fluid ">
			<div class="col-md-12">
				<s:textfield label="問卷名稱" name="qnrTable.name" readonly="true"/>
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
					</tr>
				</thead>
				<tbody>
					<s:if test="qnrTable.questionList != null">
						<s:iterator value="qnrTable.questionList" status="stat">
							<s:if test="%{inputType != 'INPUT_TYPE_HIDDEN'}">
								<tr>
									<td class="col-md-5">
										<s:textfield  class="question" name="question" readonly="true"/>
									</td>
									<td>
										<div class="col-md-6">
											<s:select class="inputType" name="inputType" list="qnrInputTypes" listKey="code" listValue="%{name}" disabled="true"/>							
										</div>
										<div class="col-md-6 mayNeedHide hidden">
											<s:select class="fromOption" name="fromOption" list="optionTables" listKey="code" listValue="%{name}" disabled="true"/>							
										</div>
										<div class="col-md-6 mayNeedHide hidden">
											<s:textfield class="optionListString" name="optionListString" placeholder="輸入選項，選項間請用分號(;)隔開" readonly="true"/>
										</div>
										<div class="col-md-6 mayNeedHide hidden">
											<s:textfield class="length" name="length" placeholder="字元數上限(中文算2個字元)" readonly="true"/>
										</div>
										<div class="col-md-3 mayNeedHide hidden">
											<s:textfield class="precision" name="precision" placeholder="總位數" readonly="true"/>
										</div>
										<div class="col-md-3 mayNeedHide hidden">
											<s:textfield class="scale" name="scale" placeholder="最大小數位數" readonly="true"/>							
										</div>							
									</td>
									<td class="col-md-1">
										<s:checkbox label="" class="searchCondition" name="%{'searchCondition'}" fieldValue="true" disabled="true"/>	
									</td>										
								</tr>
							</s:if>
						</s:iterator>
					</s:if>	
				</tbody>
			</table>		
		</div>
	
		<div class="container-fluid">
			<s:submit cssClass="btn btn-primary" value="確定" />
			<a class="btn btn-success" href="<s:url value="/qnrTemplate/init"/>">回索引頁</a>		
		</div>
	</s:form>
		
	<script type="text/javascript">
		function inputTypeChange() {
			var rowIndex = parseInt($(this).closest('tr').index());
			var inputType = $(this).val();
			
			var selecterFromOption = $(this).closest('td').find("select.fromOption");
			if (inputType == "INPUT_TYPE_SELECT_OPTION" || inputType == "INPUT_TYPE_CHECKBOX_OPTION") {					
				selecterFromOption.closest("div.mayNeedHide").removeClass("hidden");
			} else {
				selecterFromOption.prop('selectedIndex', 0);
				selecterFromOption.closest("div.mayNeedHide").addClass("hidden");
			}
			
			var textfieldOptionList = $(this).closest('td').find("input[type='text'].optionListString");
			if (inputType == "INPUT_TYPE_SELECT" || inputType == "INPUT_TYPE_CHECKBOX") {					
				textfieldOptionList.closest("div.mayNeedHide").removeClass("hidden");
			} else {
				textfieldOptionList.val("");
				textfieldOptionList.closest("div.mayNeedHide").addClass("hidden");
			}
			
			var textfieldStringLength = $(this).closest('td').find("input[type='text'].length");
			if (inputType == "INPUT_TYPE_TEXTFIELD_TEXT") {					
				textfieldStringLength.closest("div.mayNeedHide").removeClass("hidden");
			} else {
				textfieldStringLength.val("");
				textfieldStringLength.closest("div.mayNeedHide").addClass("hidden");
			}				
	
			var textfieldPrecisionLength = $(this).closest('td').find("input[type='text'].precision");
			var textfieldScaleLength = $(this).closest('td').find("input[type='text'].scale");
			if (inputType == "INPUT_TYPE_TEXTFIELD_NUM") {					
				textfieldPrecisionLength.closest("div.mayNeedHide").removeClass("hidden");
				textfieldScaleLength.closest("div.mayNeedHide").removeClass("hidden");
			} else {
				textfieldPrecisionLength.val("");
				textfieldPrecisionLength.closest("div.mayNeedHide").addClass("hidden");
				textfieldScaleLength.val("");
				textfieldScaleLength.closest("div.mayNeedHide").addClass("hidden");
			}
		}

		$(document).ready(function(){			
			$("select.inputType").change(inputTypeChange);
			$("select.inputType").trigger("change");
		});
		
	</script>
</body>
</html>