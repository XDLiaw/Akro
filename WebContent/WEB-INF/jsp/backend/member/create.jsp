<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function() {
	});
</script>
<style>
</style>
<meta name="funcPathText" content="新增"/>
</head>
<body>
	<s:form action="createSubmit" method="post" validate="true" enctype="multipart/form-data">
		<ul>
			<li class="half">
				<b>帳號*</b>
				<s:textfield name="member.account" maxlength="50"/>
			</li>
			<li class="half">
				<b>密碼*</b>
				<s:password name="member.password" maxlength="20" showPassword="true"/>
			</li>
			<li class="half">
				<b>姓名*</b>
				<s:textfield name="member.name" maxlength="50"/>
			</li>
			<li class="half">
				<b>Email*</b>
				<s:textfield name="member.email" maxlength="200"/>
			</li>
			<li class="half">
				<b>公司/團體/學校</b>
				<s:textfield name="member.org" maxlength="50"/>
			</li>
			<li class="half">
				<b>部門/系所</b>
				<s:textfield name="member.dept" maxlength="50"/>
			</li>
			<li class="all">
				<b>行業別 </b>
				<s:select name="member.industry" list="industryList" listKey="code" listValue="name" headerKey="" headerValue="--請選擇--"></s:select>
			</li>
			<li class="all">
				<b>產業別</b>
				<div class="horizontalList">
					<s:iterator value="optIndustryList" status="stat">
						<div class="checkbox">
							<input type="checkbox"
								name="member.optIndustryIdList" 
								id="<s:property value="%{'chkbox_'+id}" />"
								value="<s:property value="%{id}" />" />
							<label for="<s:property value="%{'chkbox_'+id}" />">
								<s:property value="name"/>
							</label>								
						</div>
					</s:iterator>
				</div>
			</li>
			<li class="half">
				<b>職務別</b>
				<s:select name="member.jobType" list="jobTypeList" listKey="code" listValue="name" headerKey="" headerValue="--請選擇--"></s:select>
			</li>
			<li class="half">
				<b>職稱</b>
				<s:textfield name="member.jobTitle" maxlength="50"/>
			</li>
			<li class="eighth">
				<b>郵遞區號</b>
				<s:textfield name="member.postalCode" maxlength="20"/>
			</li>
			<li class="sevenEighth">
				<b>地址</b>
				<s:textfield name="member.address" maxlength="500"/>
			</li>
			<li class="half">
				<b>電話</b>
				<s:textfield name="member.tel" maxlength="30"/>
			</li>			
			<li class="half">
				<b>手機</b>
				<s:textfield name="member.mobile" maxlength="30"/>
			</li>			
			<li class="half">
				<b>技術需求領域</b>
				<s:select name="member.optDomain.id" list="optDomainList" listKey="id" listValue="name" headerKey="" headerValue="--請選擇--"></s:select>
			</li>
			<li class="half">
				<b>技術需求項目</b>
				<s:textfield name="member.neededTec" maxlength="30"/>
			</li>
			<li class="quarter">
				<b>使用狀態</b>
				<s:radio name="member.useStatus" list="#{'true':'開啟', 'false':'關閉'}" class="horizontalList" value="true"/>
			</li>			
		</ul>
		
		<div class="clear"></div>
		<div class="bottom-btn-block">
			<s:submit cssClass="redBtn" value="送出" />	
		</div>		
	</s:form>	
</body>
</html>