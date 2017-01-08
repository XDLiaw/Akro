<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<ul class="list-group categoryList">
	<li class="list-group-item" onclick="window.location.href='<s:url value="/f2/websiteService/websiteMap"/>'">
		<i class="fa fa-cube right10" aria-hidden="true"></i>網站地圖
	</li>
	<li class="list-group-item">
		<i class="fa fa-cube right10" aria-hidden="true"></i>客服信箱
	</li>
	<li class="list-group-item" onclick="window.location.href='<s:url value="/f2/websiteService/contactUs"/>'">
		<i class="fa fa-cube right10" aria-hidden="true"></i>聯絡電話
	</li>
	<li class="list-group-item" onclick="window.location.href='<s:url value="/f2/websiteService/privacy"/>'">
		<i class="fa fa-cube right10" aria-hidden="true"></i>隱私權宣告
	</li>
	<li class="list-group-item" onclick="window.location.href='<s:url value="/f2/websiteService/copyright"/>'">
		<i class="fa fa-cube right10" aria-hidden="true"></i>版權宣告
	</li>
</ul>
	