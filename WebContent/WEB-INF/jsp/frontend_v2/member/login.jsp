<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$('ul.categoryList li:contains("登入會員")').addClass("active");
		
		
		$("#btn-reset").click(function() {
			$("input[type=text]").val("");
			$("select").prop('selectedIndex', 0);
		});
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
				<div class="large_title_03">登入會員</div>
				<div class="line_solid"></div>
				<div class="text-center">
					<img src="<s:url value="/images/frontend-v2/member_icon_01.jpg"/>" alt="" width="150" />
				</div>
				<div class="content_01 top10 text-center">
					歡迎蒞臨『使用Link-IAC網站會員帳號登入 』網站，請立即進行登入程序， 享用本網站會員專屬服務！<br> 若有疑問，歡迎 聯絡我們，我們將提供您完善的答覆與服務。
				</div>
				<div class="content_01 well top10">
					<s:form action="loginSubmit" method="post" validate="true" class="form-horizontal">
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">帳號</label>
							<div class="col-sm-10">
								<s:textfield name="member.account" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">密碼</label>
							<div class="col-sm-10">
								<s:password name="member.password" class="form-control" maxlength="20"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-primary">確定登入</button>
								<button type="button" class="btn btn-default" id="btn-reset">清除重填</button>
							</div>
						</div>
					</s:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
