<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasAuth("/batchSendEmail", "sendEmail")}'>
	<li><a href="<s:url value="/batchSendEmail/sendEmail"/>">批次寄送郵件</a>
	</li>
</s:if>
