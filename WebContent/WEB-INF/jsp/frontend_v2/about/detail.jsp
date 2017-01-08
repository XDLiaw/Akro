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
				<div>
					<div class="large_title_01">
						<i class="fa fa-calendar-check-o" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>產學合作計畫
					</div>
					<div class="line_blue">&nbsp;</div>
					<div class="line_gray1px bottom20"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- 左選單 -->
			<div class="col-sm-3 col-xs-12 bottom20">
				<s:include value="./left_menu.jsp" />
			</div>
			<!-- 右列表 -->
			<div class="col-sm-9 col-xs-12 bottom20">
				<div class="large_title_03"><s:property value="about.title"/></div>
				<div class="content_01">
					<div class="list-inline text-right" style="margin-bottom: 0;">
						<s:include value="../share-buttons.jsp" />
					</div>
				</div>
				<div class="line_solid"></div>
				<div class="content_01 top10">
					<s:property value="about.content" escapeHtml="false"/>
				</div>
			</div>
		</div>
	</div>
</body>
</html>