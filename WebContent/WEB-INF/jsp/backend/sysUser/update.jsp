<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			$("#form-update").append($(this).clone());
		});
	}
</script>
</head>
<body>
	<h2 class="itemTitle">編輯</h2>
	<s:form action="updateSubmit" method="post" validate="true" id="form-update">
		<s:hidden name="id"/>
		<s:hidden name="sysUser.id"/>
		<s:hidden name="sysUser.isValid"/>
		<s:hidden name="sysUser.createTime"/>
		<s:hidden name="sysUser.createUser"/>
		<s:hidden name="sysUser.updateTime"/>
		<s:hidden name="sysUser.updateUser"/>
		<s:hidden name="sysUser.ver"/>	
		<ul>
			<li class="half">
				<b>帳號</b>
				<s:textfield name="sysUser.account" readonly="true"/>
			</li>
			<li class="half">
				<b>密碼</b>
				<s:password name="sysUser.password" autocomplete="off" showPassword="true"/>
			</li>
			<li class="half">
				<b>使用者姓名</b>
				<s:textfield name="sysUser.name" autocomplete="off"/>
			</li>
			<li class="half">
				<b>角色</b>
				<s:select name="sysUser.sysRole.id" list="sysRoleList" listKey="id" listValue="name"/>
			</li>
		</ul>
		
		<div class="clear"></div>
		
		<s:submit cssClass="btn btn-default redBtn" value="儲存" />
		<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>
	</s:form>
	
	<s:include value="./form-backToIndex.jsp" />
</body>
</html>