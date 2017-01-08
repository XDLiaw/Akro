<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="rightContent frontend">	
    <h2 class="itemTitle">維護個人資料</h2>
    <s:form namespace="/f/talentedPeople" action="loginSubmit" method="post" validate="true" >
		<ul>
			<li class="half">
				<b>帳號</b>
				<s:textfield name="sysUser.account" autocomplete="off"/>
			</li>
			<li class="half">
				<b>密碼</b>
				<s:password name="sysUser.password" autocomplete="off"/>
			</li>			
		</ul>
    
    	<div class="clear"></div>
    
    	<s:submit cssClass="btn btn-default redBtn" value="登入" />	
    </s:form>
</div>    
</body>
</html>