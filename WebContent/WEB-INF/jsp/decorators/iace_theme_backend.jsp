<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script type="text/javascript" src="<s:url value="/scripts/jquery-1.10.2.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/jquery.validate.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/calendarBox.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/jquery.datetimepicker.full.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/menu.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/vmenuModule.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/GoogleAnalytics.js"/>"></script>
	
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/layout_backend.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/rightContentElement.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/u-vmenu.css"/>" />	
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/alert.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/btn.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/btn.file.browse.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/jquery.datetimepicker.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/jquerysctipttop.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/pageBtnList.css"/>" />

	<s:if test="%{title != null && title != ''}">
		<title><s:property value="title" /></title>
	</s:if>
	<s:else>
		<title><decorator:title default="Welcome!" /></title>
	</s:else>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$(".u-vmenu").vmenuModule({
				Speed : 200,
				autostart : false,
				autohide : true
			});
			
			setInterval(function () {
				/* $("#div-top-message").attr("hidden", "hidden"); */
				$("#div-top-message").hide();
			}, 5000);
		});
	</script>

	<decorator:head />
</head>
<body>
	<header>
		<div class="LOGO">
			<a href="<s:url value="/home/init"/>">
				<img src="<s:url value="/images/LOGO.gif"/>" class="hlogo">
			</a>	
		</div>
		<div class="Link">
			<s:if test="#session.sysUser == null">
				<a href="<s:url value="/login/login"/>" class="login">登入</a>
			</s:if>
			<s:else>
				<label><s:property value="%{#session.sysUser.name}"/>&nbsp;&nbsp;</label>
				<a href="<s:url value="/login/logout"/>" class="login">登出</a>
			</s:else>
		</div>
	</header>
	<article>
		<div class="pageTitle">
			<s:if test="%{title != null && title != ''}">
				<h1 class="funcTitle">
					<s:property value="title" /> > <decorator:getProperty property="meta.funcPathText"/>
				</h1>
			</s:if>
			<h4 class="funcPath">
				
			</h4>
		</div>
		<div class="leftMenu">
			<div class="u-vmenu">
				<s:if test="#session.sysUser != null">
					<ul>
						<li hidden="hidden"><a href="#">問卷調查模板</a>
							<ul>
								<li><a href="<s:url value="/qnrTemplate/init"/>">編輯管理</a></li>
								<li><a href="<s:url value="/qnrTemplate/create"/>">新增</a></li>
							</ul>
						</li>	
<!-- 						<li hidden="hidden"><a href="#">問卷</a> -->
<!-- 							<ul> -->
<%-- 								<s:iterator value="qnrTemplateList" status="stat"> --%>
<!-- 									<li> -->
<%-- 										<s:url value="/questionnaire/init" var="initUrlTag" escapeAmp="false"> --%>
<%-- 											<s:param name="qnrTableId" value="id" /> --%>
<%-- 											<s:param name="qnrTableName" value="tableName" /> --%>
<%-- 										</s:url> --%>
<%-- 										<a href='<s:property value="initUrlTag" />'> --%>
<%-- 											<s:property value="%{'維護 '+name}"/> --%>
<!-- 										</a> -->
<!-- 									</li> -->
<!-- 									<li>	 -->
<%-- 										<s:url value="/questionnaire/create" var="createUrlTag" escapeAmp="false"> --%>
<%-- 											<s:param name="qnrTableId" value="id" /> --%>
<%-- 											<s:param name="qnrTableName" value="tableName" /> --%>
<%-- 										</s:url> --%>
<%-- 										<a href='<s:property value="createUrlTag" />'> --%>
<%-- 											<s:property value="%{'填寫 '+name}"/> --%>
<!-- 										</a>									 -->
<!-- 									</li>	 -->
<%-- 								</s:iterator> --%>
<!-- 							</ul> -->
<!-- 						</li> -->
						<s:include value="./iace_backend_menu/menu-qnrCooperateWay.jsp" />
						<s:include value="./iace_backend_menu/menu-researchPlan.jsp" />
						<s:include value="./iace_backend_menu/menu-patent.jsp" />
						<s:include value="./iace_backend_menu/menu-consulting.jsp" />
						<s:include value="./iace_backend_menu/menu-enterpriseNeed.jsp" />
						<s:include value="./iace_backend_menu/menu-coopEx.jsp" />
						<s:include value="./iace_backend_menu/menu-talentedPeople.jsp" />
						<s:include value="./iace_backend_menu/menu-incubationCenter.jsp" />
						<s:include value="./iace_backend_menu/menu-literature.jsp" />
						<s:include value="./iace_backend_menu/menu-about.jsp" />
						<s:include value="./iace_backend_menu/menu-faq.jsp" />
						<s:include value="./iace_backend_menu/menu-news.jsp" />
						<s:include value="./iace_backend_menu/menu-activity.jsp" />
						<s:include value="./iace_backend_menu/menu-member.jsp" />
						<s:include value="./iace_backend_menu/menu-contactUs.jsp" />
						<s:include value="./iace_backend_menu/menu-batchSendEmail.jsp" />
						<s:include value="./iace_backend_menu/menu-option.jsp" />
						<s:include value="./iace_backend_menu/menu-sys.jsp" />
					</ul>
				</s:if>
			</div>

		</div>
		<div class="rightContent">
			<s:hidden name="#context['struts.actionMapping'].name" id="currentActionName"/>
			<div id="div-top-message">
				<s:if test="hasActionMessages()">
					<s:actionmessage />
				</s:if>
				<s:if test="hasActionErrors()">
					<s:actionerror />
				</s:if>
			</div>
			<decorator:body />
		</div>
		<div class="clear"></div>
	</article>
	<footer>
		<div class="con">
			<div class="subLink">
				<img src="<s:url value="/images/footerLOGO.gif"/>" >
			</div>
			<div class="contact">
				科技部鏈結產學合作計畫辦公室 / 服務專線：02-27377373 / 聯絡地址：台北市和平東路二段106號<br>
				網站維護：財團法人國家實驗研究院科技政策研究與資訊中心<br> 
				請用Google Chrome 或 IE 9.0 以上版本瀏覽最佳觀看解析度1200x800
			</div>
			<div  id="twcaseal" class="ssl-logo MEDIUM">
				<img src="<s:url value="/images/TWCA-SSL-LOGO-MEDIUM.gif"/>" >
			</div>
			<script type="text/javascript" charset="utf-8" >
				var twca_cn="iace.org.tw";
			</script>
			<script type="text/javascript" src="//ssllogo.twca.com.tw/twcaseal_v3.js"charset="utf-8"></script> 
		</div>
	</footer>
</body>
</html>