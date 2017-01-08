<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$('ul.categoryList li:contains("會員中心")').addClass("active");

		$("#btn-reset").click(function() {
			$("input[type=text]").val("");
			$("select").prop('selectedIndex', 0);
		});
	});
	
	function logout() {
		window.location.href='<s:url value="/f2/member/logout"/>';
	}
	
	function editMemberData() {
		window.location.href='<s:url value="/f2/member/selfUpdate" />';
	}
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
						<i class="fa fa-user-circle-o" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>會員中心
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
			<div class="col-sm-9 col-xs-12">
				<div class="text-center">
					<img src="<s:url value="/images/frontend-v2/member_icon_01.jpg"/>" alt="" width="150" />
				</div>
				<div class="content_01 top10 text-center">
					<span class="large_title_04">最佳化服務，歡迎會員多加利用~</span><br> LINK-IAC能藉網際網路之便，提供各界最豐富、精闢的產業資訊與趨勢分析服務，以創造企業附加價值，提升產業競爭力。
				</div>
				<div class="content_01 well top10">
					<div class="row">
						<div class="col-sm-6 col-xs-12 bottom10">
							<button type="button" class="btn btn-default btn-block" style="height: 200px;" onclick="editMemberData()">
								<div>
									<i class="fa fa-pencil fa-5x" style="color: #1eb4da" aria-hidden="true"></i>
								</div>
								<div class="large_title_03">修改會員資料</div>
								<div>
									若您想要修改先前所建立的會員資料，<br> 請連結至本單元，<br> 進入修改相關資料後按送出即更新完成。
								</div>
							</button>
						</div>
						<div class="col-sm-6 col-xs-12">
							<button type="button" class="btn btn-default btn-block" style="height: 200px;" onclick="logout()">
								<div>
									<i class="fa fa-sign-out fa-5x" style="color: #1eb4da" aria-hidden="true"></i>
								</div>
								<div class="large_title_03">會員登出</div>
								<div>歡迎再次使用</div>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
