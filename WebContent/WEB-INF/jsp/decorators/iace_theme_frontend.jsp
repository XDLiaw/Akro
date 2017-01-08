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
	<title>科技部iACE鏈結產學媒合平台</title>
	
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/layout_frontend.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/alert.css"/>" />	
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/jquery.datetimepicker.css"/>" />
	
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/rightContentElement.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/btn.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/jquerysctipttop.css"/>" />
	<link rel="stylesheet" type="text/css" href="<s:url value="/css/pageBtnList.css"/>" />
	
	<style>
		.rightContent { width:1024px; margin: -20px auto 15px auto; }
		.frontend table th { background: #a0c7d5; }
		
		.loginBlock { float:right; margin:80px 0 0 0; text-align:right; }	
		.loginBlock input[type="text"],
		.loginBlock input[type="password"] { width:25%; border:#e6eff5 1px solid; padding: 7px 5px; font-size:0.91em; font-family: "Microsoft JhengHei", Arial;}	
	</style>
	
	<script type="text/javascript" src="<s:url value="/scripts/jquery-1.10.2.min.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/jquery.validate.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/frontend/backtotop.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/frontend/menu.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/calendarBox.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/jquery.datetimepicker.full.js"/>"></script>
	<script type="text/javascript" src="<s:url value="/scripts/GoogleAnalytics.js"/>"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			setInterval(function () {
				$("#div-top-message").hide();
			}, 5000);
		});
	</script>
	
	<decorator:head />
</head>
<body>
	<header>
		<div id="con">
			<div id="LOGO">
				<a href="<s:url value="/home/init"/>">
					<img src="<s:url value="/images/LOGO.png"/>" >
				</a>
			</div>
			<div class="peopleCount">
				<div>瀏覽人數 :</div>
				<div id="tc-b64b054876"></div>
				<script type="text/javascript">
					var _tcq = _tcq || [];
					_tcq.push([ 'widget', 'visits' ]);
					_tcq.push([ 'init', 'b64b054876' ]);
					(function(d, s) {
						var e = d.createElement(s);
						e.type = 'text/javascript';
						e.async = true;
						e.src = ('https:' == document.location.protocol ? 'https': 'http') + '://s.tcimg.com/w/v3/trendcounter.js';
						var f = d.getElementsByTagName(s)[0];
						f.parentNode.insertBefore(e, f);
					})(document, 'script');
				</script>			
			</div>
			<div class="loginBlock">
				<s:if test="#session.sysUser == null">
					<s:form namespace="/login" action="loginSubmit" method="post" validate="true" >
						<input type="text" name="sysUser.account" autocomplete="off" placeholder="帳號"/>
						<input type="password" name="sysUser.password" autocomplete="off" placeholder="密碼"/>
						<input type="submit" value="登入" class="mainBlueBtn" />
					</s:form>
				</s:if>
				<s:else>
					<label><s:property value="%{#session.sysUser.name}"/>&nbsp;&nbsp;</label>
					<input type="button" value="登出" class="mainBlueBtn" 
						onclick="window.location.href='<s:url value="/login/logout"/>'"/>	
				</s:else>
			</div>
			<div class="clear"></div>
			<div id="link">
				<a href="<s:url value="/home/init"/>">首頁</a>│
				<a>關於I-ACE</a>│
				<a>聯絡我們</a>
			</div>
			<div class="clear"></div>
			<s:if test="%{title != null && title != ''}">
				<h1><s:property value="title" /></h1>
			</s:if>
		</div>
	</header>
	<article>
		<div class="">
			<div id="div-top-message" class="rightContent">
				<s:hidden name="#context['struts.actionMapping'].name" id="currentActionName"/>				<s:if test="hasActionMessages()">
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
		<div id="footerZone">
			<div id="LOGO"><img src="<s:url value="/images/LOGO-S.png"/>" ></div>
			<div id="qrcode"><img src="<s:url value="/images/qrCode.jpg"/>" width="73" height="73"></div>
			<div id="con">
				版權所有©2016科技部產學及園區業務司<br>
				Department of Academia-Industry Collaboration and Science Park Affairs, Academy and Science Park Affairs<br>
				本網站設計支援IE、Firefox及Chrome，網頁設計 最佳瀏覽解析度為1024x768以上<br>
			</div>
			<div id="twca">
				<div id="twcaseal" class="ssl-logo MEDIUM">
					<img src="<s:url value="/images/TWCA-SSL-LOGO-MEDIUM.gif"/>">
				</div>
				<script type="text/javascript" charset="utf-8" >
					var twca_cn="iace.org.tw";
				</script>
				<script type="text/javascript" src="//ssllogo.twca.com.tw/twcaseal_v3.js"charset="utf-8"></script> 
			</div>
		</div>
		<div class="clear"></div>
	</footer>
</body>
</html>