<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/literature")}'>
	<li><a href="#">文獻與法規政策</a>
		<ul>
			<s:if test='%{#session.sysUser.hasAuth("/literature", "batchImport")}'>
				<li><a href="<s:url value="/literature/batchImport"/>">批次匯入</a></li>
			</s:if>
		</ul>
	</li>
</s:if>