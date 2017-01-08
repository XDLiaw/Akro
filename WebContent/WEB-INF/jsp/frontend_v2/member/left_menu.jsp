<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<ul class="list-group categoryList">
	<s:if test="#session.member == null">
		<li class="list-group-item" onclick="window.location.href='<s:url value="/f2/member/login"/>'"><i class="fa fa-cube right10" aria-hidden="true"></i>登入會員</li>
		<li class="list-group-item" onclick="window.location.href='<s:url value="/f2/member/registerPolicy"/>'"><i class="fa fa-cube right10" aria-hidden="true"></i>加入會員</li>
		<li class="list-group-item" onclick="window.location.href='<s:url value="/f2/member/forgetPassword"/>'"><i class="fa fa-cube right10" aria-hidden="true"></i>忘記密碼</li>
	</s:if>
	<s:else>
		<li class="list-group-item" onclick="window.location.href='<s:url value="/f2/member/memberCenter"/>'"><i class="fa fa-cube right10" aria-hidden="true"></i>會員中心</li>
	</s:else>
</ul>