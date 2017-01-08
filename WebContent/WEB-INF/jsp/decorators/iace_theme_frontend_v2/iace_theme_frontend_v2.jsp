<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>運用法人鏈結產學合作計畫</title>

<script type="text/javascript" src="<s:url value="/scripts/jquery-1.11.2.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/scripts/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<s:url value="/scripts/GoogleAnalytics.js"/>"></script>

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="<s:url value="/css/default.css"/>" />
<link rel="stylesheet" type="text/css" href="<s:url value="/font/font-awesome-4.7.0/css/font-awesome.min.css"/>">
<link rel="stylesheet" type="text/css" href="<s:url value="/css/bootstrap-3.3.4.css"/>" />
<script type="text/javascript" src="<s:url value="/scripts/bootstrap-3.3.4.js"/>"></script>

<link rel="stylesheet" type="text/css" href="<s:url value="/css/alert.css"/>" />

<!-- 日曆盒 -->
<link rel="stylesheet" type="text/css" href="<s:url value="/css/jquery.datetimepicker.css"/>" />
<script type="text/javascript" src="<s:url value="/scripts/calendarBox.js"/>"></script>
<script type="text/javascript" src="<s:url value="/scripts/jquery.datetimepicker.full.js"/>"></script>



<script type="text/javascript">
	$(document).ready(function() {
		
	});
</script>

<decorator:head />
</head>
<!-- ======================================================================= -->
<body>
<header>
	<s:include value="./pc_menu.jsp" />
	<s:include value="./mobile_menu.jsp" />
</header>
<article>
	<div id="div-top-message" class="rightContent">	
		<s:if test="actionMessages!=null && actionMessages.size > 0">
			<script>
				var actionMessages = '';
				<s:iterator value="actionMessages" >
					// Iterate the messages, and build the JS String
					actionMessages += '<s:property />' + '\n';
				</s:iterator>   
				
				$(document).ready(function() {
					alert (actionMessages);
				});
			</script>
		</s:if>
		<s:if test="actionErrors!=null && actionErrors.size > 0">
			<script>
				var actionErrors = '';
				<s:iterator value="actionErrors" >
					// Iterate the messages, and build the JS String
					actionErrors += '<s:property />' + '\n';
				</s:iterator>
				
				$(document).ready(function() {
					alert(actionErrors);
				});
			</script>
		</s:if>
	</div>
	<!-- body -->
	<decorator:body />
</article>
<footer>
	<s:include value="./footer-links.jsp" />
	<s:include value="./footer-allmenu.jsp" />
	<s:include value="./footer-webinfo.jsp" />
</footer>
</body>
</html>