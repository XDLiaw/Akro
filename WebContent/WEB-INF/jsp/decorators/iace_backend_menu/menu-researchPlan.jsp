<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/researchPlan")}'>
	<li><a href="#">研發成果</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/researchPlan", "init")}'>
				<li><a href="<s:url value="/researchPlan/init"/>">編輯管理</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/researchPlan", "create")}'>
				<li><a href="<s:url value="/researchPlan/create"/>">新增計畫</a></li>
			</s:if>
			<s:if test='%{#session.sysUser.hasAuth("/researchPlan", "batchImport")}'>
				<li><a href="<s:url value="/researchPlan/batchImport"/>">批次匯入</a></li>
			</s:if>	
		</ul>
	</li>
</s:if>