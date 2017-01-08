<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/talentedPeople")}'>
	<li><a href="#">產學人才資料</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/talentedPeople", "init")}'>
				<li><a href="<s:url value="/talentedPeople/init"/>">編輯管理</a></li>
			</s:if>
<%-- 			<li><a href="<s:url value="/talentedPeople/create"/>">新增</a></li> --%>
			<s:if test='%{#session.sysUser.hasAuth("/talentedPeople", "batchImport")}'>
				<li><a href="<s:url value="/talentedPeople/batchImport"/>">批次匯入</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/talentedPeople", "exportEmail")}'>
				<li><a href="<s:url value="/talentedPeople/exportEmail"/>">匯出郵件列表</a></li>
			</s:if>
		</ul>
	</li>
</s:if>