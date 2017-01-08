<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/qnrCooperateWay")}'>
	<li><a href=#>產學合作問卷</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/qnrCooperateWay", "index")}'>
				<li><a href="<s:url value="/qnrCooperateWay/index"/>">問卷管理</a></li>
			</s:if>	
		</ul>
	</li>
</s:if>