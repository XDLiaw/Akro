<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function(){
		$("select.orgType").change(function(){
			var name = $(this).find("option:selected").html();
			if (name.includes("其他")) {
				$("input[type='text'].orgType").removeAttr("disabled");
			} else {
				$("input[type='text'].orgType").val("");
				$("input[type='text'].orgType").attr("disabled", "disabled");
			}
		});
		$("select.orgType").trigger('change');
		
		$("select.consult").change(function(){
			var name = $(this).find("option:selected").html();
			if (name.includes("其他")) {
				$("input[type='text'].consult").removeAttr("disabled");
			} else {
				$("input[type='text'].consult").val("");
				$("input[type='text'].consult").attr("disabled", "disabled");
			}
		});
		$("select.consult").trigger('change');
		
		$("select.industry").change(function(){
			var name = $(this).find("option:selected").html();
			if (name.includes("其他")) {
				$("input[type='text'].industry").removeAttr("disabled");
			} else {
				$("input[type='text'].industry").val("");
				$("input[type='text'].industry").attr("disabled", "disabled");
			}
		});
		$("select.industry").trigger('change');
	});
</script>
<meta name="funcPathText" content="新增"/>
</head>
<body>
<!-- 	<h2 class="itemTitle">新增</h2> -->
<div class="rightContent frontend">
	<s:form action="createSubmit" method="post" validate="true">
		<ul>						
			<li class="half">
				<b>姓名</b>
				<s:textfield name="consulting.name" maxlength="100"/>
			</li>
			<li class="half">
				<b>單位名稱</b>
				<s:textfield name="consulting.organization" maxlength="500" />
			</li>
			<li class="half">
				<b>單位類型</b>
				<s:select name="consulting.optionOrganizationType.code" list="optionOrganizationTypeList" listKey="code" listValue="%{code +' ' +name}" class="orgType"/>
			</li>
			<li class="half">
				<b>單位類型(其他)</b>
				<s:textfield name="consulting.orgTypeOther" disabled="true" class="orgType" maxlength="500"/>
			</li>
			<li class="half">
				<b>諮詢類型</b>
				<s:select name="consulting.optionConsult.code" list="optionConsultList" listKey="code" listValue="%{code +' ' +name}" class="consult"/>
			</li>
			<li class="half">
				<b>諮詢類型(其他)</b>
				<s:textfield name="consulting.consultTypeOther" disabled="true" class="consult" maxlength="500"/>
			</li>
			<li class="half">
				<b>產業/領域別</b>
				<s:select name="consulting.optionIndustry.code" list="optionIndustryList" listKey="code" listValue="%{code +' ' +name}" class="industry" />
			</li>
			<li class="half">
				<b>產業/領域別(其他)</b>
				<s:textfield name="consulting.industryOther" disabled="true" class="industry" maxlength="500"/>
			</li>
			<li class="quarter">
				<b>聯絡電話</b>
				<s:textfield name="consulting.phone" maxlength="100"/>	
			</li>
			<li class="half">
				<b>E-MAIL</b>
				<s:textfield name="consulting.email" maxlength="100" />		
			</li>
			<li class="quarter">
				<b>諮詢日期</b>
				<s:textfield name="consulting.consultDate" cssClass="calendarBox" maxlength="10">			
					<s:param name="value">
						<s:date name="consulting.consultDate" format="yyyy/MM/dd" /> 
					</s:param>
				</s:textfield>				
			</li>
			<li class="all">
				<b>內容說明</b>
				<s:textarea name="consulting.content" />
			</li>		
			<li class="all">
				<s:checkbox label="同意【個人資料蒐集、處理及利用之告知暨同意條款】" name="consulting.approvalCheckBox"/>
			</li>
		</ul>
		<div class="clear"></div>
		<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
			<s:submit cssClass="redBtn" value="送出" />
		</div>		
	</s:form>
</div>	
</body>
</html>