<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function(){
		addSearchConditionHiddenToForm();
		$("#btn-back").click(function(){				
			$("#form-backToIndex").submit();
		});
	});
</script>
<script>
	function addSearchConditionHiddenToForm() {
		$("#form-backToIndex input[type=hidden]").each(function(index){
			$("#form-delete").append($(this).clone());
		});
	}
</script>
<meta name="funcPathText" content="編輯管理  > 刪除"/>
</head>
<body>
	<s:form action="deleteSubmit" method="post" validate="true" id="form-delete">
		<s:hidden name="id" />
		<ul>
			<li class="half">
				<b>帳號*</b>
				<div class="border-text">
					<s:property value="member.account"/>
				</div>
			</li>
			<li class="half">
				<b>密碼*</b>
				<div class="border-text">
					<s:property value="member.password"/>
				</div>
			</li>
			<li class="half">
				<b>姓名*</b>
				<div class="border-text">
					<s:property value="member.name"/>
				</div>
			</li>
			<li class="half">
				<b>Email*</b>
				<div class="border-text">
					<s:property value="member.email"/>
				</div>
			</li>
			<li class="half">
				<b>公司/團體/學校</b>
				<div class="border-text">
					<s:property value="member.org"/>
				</div>
			</li>
			<li class="half">
				<b>部門/系所</b>
				<div class="border-text">
					<s:property value="member.dept"/>
				</div>
			</li>
			<li class="half">
				<b>行業別 </b>
				<s:select name="member.industry" list="industryList" listKey="code" listValue="name" headerKey="" headerValue="--請選擇--" disabled="true"/>
			</li>
			<li class="half">
				<b>產業別</b>
				<div class="border-text">
					<s:iterator value="member.optIndustryList" status="stat">
						<s:property value="%{name + '; '}"/>
					</s:iterator>
				</div>	
			</li>
			<li class="half">
				<b>職務別</b>
				<s:select name="member.jobType" list="jobTypeList" listKey="code" listValue="name" headerKey="" headerValue="--請選擇--" disabled="true"/>
			</li>
			<li class="half">
				<b>職稱</b>
				<div class="border-text">
					<s:property value="member.jobTitle"/>
				</div>
			</li>
			<li class="eighth">
				<b>郵遞區號</b>
				<div class="border-text">
					<s:property value="member.postalCode"/>
				</div>
			</li>
			<li class="sevenEighth">
				<b>地址</b>
				<div class="border-text">
					<s:property value="member.address"/>
				</div>
			</li>
			<li class="half">
				<b>電話</b>
				<div class="border-text">
					<s:property value="member.tel"/>
				</div>
			</li>			
			<li class="half">
				<b>手機</b>
				<div class="border-text">
					<s:property value="member.mobile"/>
				</div>
			</li>			
			<li class="half">
				<b>技術需求領域</b>
				<s:select name="member.optDomain.id" list="optDomainList" listKey="id" listValue="name" headerKey="" headerValue="--請選擇--" disabled="true"/>
			</li>
			<li class="half">
				<b>技術需求項目</b>
				<div class="border-text">
					<s:property value="member.neededTec"/>
				</div>
			</li>
			<li class="quarter">
				<b>使用狀態</b>
				<s:radio name="member.useStatus" list="#{'true':'開啟', 'false':'關閉'}" class="horizontalList" value="true" disabled="true"/>
			</li>			
		</ul>
		
		<div class="clear"></div>
		<div class="bottom-btn-block">
			<s:submit cssClass="btn btn-info redBtn" value="確定" />
			<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>
		</div>
	</s:form>
				
	<s:include value="./form-backToIndex.jsp" />
</body>
</html>