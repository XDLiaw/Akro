<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<s:if test='%{#session.sysUser.hasNamespaceStartWith("/option")}'>
	<li><a href="#">代碼管理</a>
		<ul>
	        <li><a href="<s:url value="/option/companyLocation/index"/>">公司地域別</a></li>
	        <li><a href="<s:url value="/option/consult/index"/>">諮詢類型</a></li>
	        <li><a href="<s:url value="/option/cooperateMode/index"/>">合作模式</a></li>
	    	<li><a href="<s:url value="/option/country/index"/>">專利國別</a></li>
	        <li><a href="<s:url value="/option/grbDomain/index"/>">GRB領域別</a></li>
	        <li><a href="<s:url value="/option/hadTecSrc/index"/>">企業已有技術來源</a></li>
			<li><a href="<s:url value="/option/hrst/index"/>">HRST專長 </a></li>
	        <li><a href="<s:url value="/option/industry/index"/>">產業/領域別</a></li>	
	        <li><a href="<s:url value="/option/domain/index"/>">領域</a></li>				        
	        <li><a href="<s:url value="/option/organizationClass/index"/>">單位類別</a></li>
	        <li><a href="<s:url value="/option/organizationType/index"/>">單位類型</a></li>
	        <li><a href="<s:url value="/option/trl/index"/>">發展階段</a></li>
	        <li><a href="<s:url value="/option/subject/index"/>">科技部學門</a></li>
	        <li><a href="<s:url value="/option/school/index"/>">學校</a></li>
	        <s:if test="#session.sysUser.sysRole.name == '系統開發人員'">
		        <li><a href="<s:url value="/option/sysNamespace/index"/>">系統Namespace</a></li>
		        <li><a href="<s:url value="/option/sysAction/index"/>">系統Action</a></li>
			</s:if>
		</ul>
	</li>
</s:if>