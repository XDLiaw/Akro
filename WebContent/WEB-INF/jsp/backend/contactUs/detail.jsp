<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function() {
		$("#btn-back").click(function(){				
			$("#form-backToIndex").submit();
		});	
	});
</script>
<meta name="funcPathText" content="編輯管理 > 檢視"/>
</head>
<body>
	<ul>
		<li class="quarter">
			<b>聯絡人姓名*</b>
			<div class="border-text">
				<s:property value="contactUs.name"/>
			</div>			
		</li>
		<li class="quarter">
			<b></b>
			<s:radio name="contactUs.gender" list="#{'true':'先生', 'false':'小姐'}" class="horizontalList" disabled="true"/>
		</li>
		<li class="half">
			<b>公司名稱</b>
			<div class="border-text">
				<s:property value="contactUs.companyName"/>
			</div>			
		</li>
		<li class="clear all"></li>		
		<li class="half">
			<b>聯絡電話*</b>
			<div class="border-text">
				<s:property value="contactUs.phone"/>
			</div>			
		</li>			
		<li class="half">
			<b>Email*</b>
			<div class="border-text">
				<s:property value="contactUs.email"/>
			</div>			
		</li>
		<li class="clear all"></li>
		<li class="all">
			<b>意見內容</b>
			<div class="border-text">
				<s:property value="contactUs.message"/>
			</div>			
		</li>
	</ul>
		
	<div class="clear"></div>
	<div class="bottom-btn-block">
		<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>
	</div>
				
	<s:include value="./form-backToIndex.jsp" />
</body>
</html>