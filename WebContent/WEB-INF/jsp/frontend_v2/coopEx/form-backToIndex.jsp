<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<form action="index" method="post" id="form-backToIndex">
	<s:hidden name="searchCondition.searchText" />
	<s:hidden name="searchCondition.year" />
	<s:hidden name="searchCondition.type" />
	<s:hidden name="searchCondition.rdTeam" />
	<s:hidden name="searchCondition.assisTeam" />
	<s:hidden name="searchCondition.pageIndex" />
	<s:hidden name="searchCondition.pageSize" />
</form>