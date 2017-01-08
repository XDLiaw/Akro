<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
</script>
</head>
<body>
	<input type="button" class="redBtn" value="新增系統腳色" onclick="window.location.href='<s:url value="create.action"/>'" />
	<div class="clear"></div>
	<br>
	<table>
		<tr>
			<th width="2%" nowrap>No.</th>
			<th width="" nowrap>腳色名稱</th>
			<th width="">功能</th>
		</tr>
		<s:iterator value="sysRoleList" status="stat">
			<tr>
				<td>
					<s:property value="#stat.count" />
					<s:hidden name="id" class="id"/>
				</td>						
				<td><s:property value="name" /></td>
				<td>
					<s:if test='%{#session.sysUser.hasAuth(namespace, "update")}'>
						<s:url value="update.action" var="updateUrlTag">
							<s:param name="id" value="id" />
						</s:url>
						<input type="button" class="btn-func btn-edit" value="編輯" 
							onclick="window.location.href='<s:property value="#updateUrlTag" />'" />
					</s:if>
				</td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>