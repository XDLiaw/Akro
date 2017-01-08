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
	<h2 class="itemTitle Down">客服信箱</h2>
	<p>如果有任何問題，歡迎您留下訊息，我們將儘速回答您的問題， 並竭誠歡迎您的建言，謝謝！ (以下標有 * 的欄位請務必填寫，以便我們能針對您的意見適時給予答覆！)</p>
	<br>

	<s:form action="createSubmit" method="post" validate="true">
		<ul>
			<li class="quarter">
				<b>聯絡人姓名*</b>
				<s:textfield name="contactUs.name" maxlength="50"/>
			</li>
			<li class="quarter">
				<b></b>
				<s:radio name="contactUs.gender" list="#{'true':'先生', 'false':'小姐'}" class="horizontalList" value="true"/>
			</li>
			<li class="half">
				<b>公司名稱</b>
				<s:textfield name="contactUs.companyName" maxlength="200"/>
			</li>
			<li class="clear all"></li>		
			<li class="half">
				<b>聯絡電話*</b>
				<s:textfield name="contactUs.phone" maxlength="30"/>
			</li>			
			<li class="half">
				<b>Email*</b>
				<s:textfield name="contactUs.email" maxlength="200"/>
			</li>
			<li class="clear all"></li>
			<li class="all">
				<b>意見內容</b>
				<s:textarea name="contactUs.message"/>
			</li>
		</ul>
		
		<div class="clear"></div>
		<div class="bottom-btn-block">
			<s:submit cssClass="redBtn" value="送出" />	
		</div>		
	</s:form>	
</body>
</html>