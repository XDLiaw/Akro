<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta name="funcPathText" content="新增"/>
</head>
<body>
	<s:form action="createSubmit" method="post" validate="true" >		
		<ul>
			<li class="quarter">
				<b>代碼</b>
				<s:textfield name="option.code" placeholder="請輸入文數字" maxlength="10"/>
			</li>
			<li class="quarter">
				<b>排序優先度 (將依數字小到大排序)</b>
				<s:textfield name="option.priority" placeholder="請輸入數字" maxlength="19"/>
			</li>
			<li class="all">
				<b>名稱</b>
				<s:textfield name="option.name" placeholder="請輸入文數字" maxlength="500"/>
			</li>
		</ul>
		<div class="clear"></div>
		
		<s:submit cssClass="btn btn-default redBtn" value="送出" />	
		<input type="button" class="grayBtn" value="回上一頁" onclick="window.location.href='<s:url value="index"/>'" />
	</s:form>
</body>
</html>