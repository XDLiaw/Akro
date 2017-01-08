<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
</head>
<body>
	<!-- Banner -->
	<s:include value="./banner.jsp" />

	<!-- Main -->
	<div class="container top50">
		<div class="row">
			<div class="col-sm-12 col-xs-12">
				<s:include value="./largeTitle.jsp" />
			</div>
		</div>	
		<div class="row">
			<!-- 左選單 -->
			<div class="col-sm-3 col-xs-12 bottom20">
				<s:include value="./left_menu.jsp" />
			</div>
			<!-- 右列表 -->
			<div class="col-sm-9 col-xs-12">
				<div class="large_title_03">我要諮詢</div>
				<div class="line_solid"></div>
				<div class="text-center">
					<img src="<s:url value="/images/frontend-v2/member_icon_03.jpg"/>" alt="" width="150" />
				</div>
				<div class="content_01 top10 text-center">
					送出完成，感謝您的填寫<br>
				</div>
				<div class="form-group"></div>
			</div>
		</div>
	</div>
</body>
</html>				