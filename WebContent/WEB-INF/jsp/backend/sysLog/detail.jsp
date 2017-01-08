<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function(){
		$("#btn-back").click(function(){				
			$("#form-backToIndex").submit();
		});
	});
</script>
<meta name="funcPathText" content="編輯管理  > 檢視"/>
</head>
<body>
<!-- 	<h2 class="itemTitle">檢視</h2>	 -->
	<ul>
		<li class="all">
			<b>時間</b>
			<div class="border-text"><s:property value="sysLog.createTime"/></div>
		</li>
		<li class="third">
			<b>使用者帳號</b>
			<div class="border-text">
				<s:property value="sysLog.sysUser.account"/>
			</div>
		</li>
		<li class="third">
			<b>使用者名稱</b>
			<div class="border-text">
				<s:property value="sysLog.sysUser.name"/>
			</div>
		</li>
		<li class="third">
			<b>使用者腳色</b>
			<div class="border-text">
				<s:property value="sysLog.sysUser.sysRole.name"/>
			</div>
		</li>
		<li class="half">
			<b>功能</b>
			<div class="border-text">
				<s:property value="sysLog.optionSysNamespace.name"/>
			</div>
		</li>
		<li class="half">
			<b>動作</b>
			<div class="border-text">
				<s:property value="sysLog.optionSysAction.name"/>
			</div>
		</li>		
		<li class="half">
			<b>Before</b>
			<div class="border-text">
<%-- 				<s:property value="sysLog.before"/> --%>
				<s:iterator value="sysLog.beforeStrings" status="stat">
					<s:property /><br>
				</s:iterator>
			</div>
		</li>			
		<li class="half">
			<b>After</b>
			<div class="border-text">
<%-- 				<s:property value="sysLog.after"/> --%>
				<s:iterator value="sysLog.afterStrings" status="stat">
					<s:property /><br>
				</s:iterator>
			</div>
		</li>	
	</ul>
	<div class="clear"></div>
	<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
		<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>	
	</div>	
	<form action="index" method="post" id="form-backToIndex">
		<s:hidden name="searchCondition.optionSysNamespaceId"/>
		<s:hidden name="searchCondition.optionSysActionId"/>
		<s:hidden name="searchCondition.sysUserId"/>
		<s:hidden name="searchCondition.timeS"/>
		<s:hidden name="searchCondition.timeE"/>
		<s:hidden name="searchCondition.pageIndex"/>
		<s:hidden name="searchCondition.pageSize"/>
	</form>
</body>
</html>