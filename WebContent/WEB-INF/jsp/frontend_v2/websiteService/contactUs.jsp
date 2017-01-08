<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$('ul.categoryList li:contains("聯絡電話")').addClass("active");
	});
</script>
<style>
.service-txt-20px-B {
    font-family: "微軟正黑體";
    font-size: 20px;
    line-height: 30px;
    color: #47C0FF;
    font-weight: bold;
}
</style>
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
						<i class="fa fa-calendar-check-o" aria-hidden="true" style="font-size:18px; margin-right:5px;"></i>網站服務
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
				<div class="large_title_03">聯絡電話</div>
				<div class="content_01 top10">
					<p>
						<span class="service-txt-20px-B"><span class="service-txt-16px-b"><span class="txt_8"><span class="txt_10"><span class="news-Title"><span class="service-txt-20px-B">科技部產學及園區業務司</span></span></span></span></span></span>
						<br>
						<img src="<s:url value="/images/frontend-v2/service-icon-add.png"/>" width="15" height="15">
						<span class="16B-blue"> 地址：</span>10622 台北市和平東路二段106號
						<br>
						<img src="<s:url value="/images/frontend-v2/service-icon-tel.png"/>" alt="" width="15" height="15">
						<span class="16B-blue">電話：</span>(02) 2737-7373
						<br>
						<img src="<s:url value="/images/frontend-v2/service-icon-service.png"/>" alt="" width="15" height="15">
						<span class="16B-blue">資訊客服專線：</span>(02)2737-7592
						<br>
						<img src="<s:url value="/images/frontend-v2/service-icon-time.png"/>" alt="" width="15" height="15">
						<span class="16B-blue">上班時間：</span>每週一到週五8:30 至 17:30
					</p>	
					<p><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.269839247782!2d121.53978071500616!3d25.02491508397659!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442aa29379b8db9%3A0xd64e16f1fa2db70b!2zMTA25Y-w5YyX5biC5aSn5a6J5Y2A5ZKM5bmz5p2x6Lev5LqM5q61MTA26Jmf!5e0!3m2!1szh-TW!2stw!4v1447229234632" width="100%" height="450" class="service-map"></iframe></p>			
				</div>
			</div>	
		</div>	
	</div>
</body>
</html>