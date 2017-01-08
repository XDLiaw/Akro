<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<form action="index" method="post" id="form-backToIndex">
	<s:hidden name="searchCondition.name"/>
	<s:hidden name="searchCondition.gender"/>
	<s:hidden name="searchCondition.expYearS"/>
	<s:hidden name="searchCondition.expYearE"/>
	<s:hidden name="searchCondition.workOrg"/>
	<s:hidden name="searchCondition.job"/>
	<s:hidden name="searchCondition.specialty"/>
	<s:iterator value="searchCondition.grbDomainIdList" status="stat">
		<input type="hidden" name="searchCondition.grbDomainIdList" value="<s:property/>"/>
	</s:iterator>
	<s:hidden name="searchCondition.pageIndex"/>
	<s:hidden name="searchCondition.pageSize"/>
</form>