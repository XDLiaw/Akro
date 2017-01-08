<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<h3>檢視</h3>
	<s:hidden name="qnrTableId"/>
	<s:hidden name="qnrTableName"/>

	<div class="container-fluid ">
		<s:iterator value="qnrTemplate.questionList" status="stat">
			<s:if test="%{inputType != 'INPUT_TYPE_HIDDEN'}">			
				<div class="row">
					<div>
						<label><s:property value="question"/></label>
					</div>
					<div class="">
						<s:if test="%{inputType == 'INPUT_TYPE_TEXTFIELD_TEXT'}">
							<s:textfield name="datas['%{colName}']" readonly="true"/>
						</s:if>
						<s:elseif test="%{inputType == 'INPUT_TYPE_TEXTFIELD_NUM'}">
							<s:textfield name="datas['%{colName}']" readonly="true"/>
						</s:elseif>
						<s:elseif test="%{inputType == 'INPUT_TYPE_TEXTFIELD_DATE'}">
							<s:textfield name="datas['%{colName}']" readonly="true"/>
						</s:elseif>
						<s:elseif test="%{inputType == 'INPUT_TYPE_SELECT'}">
							<s:select name="datas['%{colName}']" list="optionList" listKey="code" listValue="name" headerKey="" headerValue="" disabled="true"/> 
						</s:elseif>
						<s:elseif test="%{inputType == 'INPUT_TYPE_SELECT_OPTION'}">
							<s:select name="datas['%{colName}']" list="optionList" listKey="code" listValue="name" headerKey="" headerValue="" disabled="true"/>
						</s:elseif>
						<s:elseif test="%{inputType == 'INPUT_TYPE_CHECKBOX'}">
							<s:checkboxlist name="datas['%{colName}']" list="optionList" listKey="code" listValue="name" disabled="true"/>
						</s:elseif>
						<s:elseif test="%{inputType == 'INPUT_TYPE_CHECKBOX_OPTION'}">
							<s:checkboxlist name="datas['%{colName}']" list="optionList" listKey="code" listValue="name" disabled="true"/>
						</s:elseif>
					</div>			
				</div>
			</s:if>
		</s:iterator>
	</div>
	<div class="container-fluid">
		<s:url value="/questionnaire/init" var="initUrlTag" escapeAmp="false">
			<s:param name="qnrTableId" value="qnrTableId" />
			<s:param name="qnrTableName" value="qnrTableName" />
		</s:url>
		<a class="btn btn-success" href='<s:property value="initUrlTag" />'>確定</a>
	</div>
	
	<script type="text/javascript">


		$(document).ready(function(){

		});
		

	</script>

</body>
</html>