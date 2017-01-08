<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#form-sendMessage").submit(function () {
			if ($("#readPolicyCheck").prop("checked")) {
				return true;
			} else {
				alert("請選擇同意接受「個人資料蒐集、處理及利用之告知暨同意條款」");
				return false;
			}
		});
		
		$("select.orgType").change(function(){
			var name = $(this).find("option:selected").html();
			if (name.includes("其他")) {
				$("input[type='text'].orgType").removeAttr("disabled");
			} else {
				$("input[type='text'].orgType").val("");
				$("input[type='text'].orgType").attr("disabled", "disabled");
			}
		});
		$("select.orgType").trigger('change');
		
		$("select.consult").change(function(){
			var name = $(this).find("option:selected").html();
			if (name.includes("其他")) {
				$("input[type='text'].consult").removeAttr("disabled");
			} else {
				$("input[type='text'].consult").val("");
				$("input[type='text'].consult").attr("disabled", "disabled");
			}
		});
		$("select.consult").trigger('change');
		
		$("select.industry").change(function(){
			var name = $(this).find("option:selected").html();
			if (name.includes("其他")) {
				$("input[type='text'].industry").removeAttr("disabled");
			} else {
				$("input[type='text'].industry").val("");
				$("input[type='text'].industry").attr("disabled", "disabled");
			}
		});
		$("select.industry").trigger('change');
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
					請輸入以下資訊，系統將會立即寄發送通知信給您！<br> 若有疑問，歡迎聯絡我們，我們將提供您完善的答覆與服務。
				</div>

				<div class="content_01 well top10">
					<s:form action="createSubmit" method="post" validate="true" class="form-horizontal" id="form-sendMessage">
						<div class="line_gray1px bottom10 text-center large_title_04">
							<strong>基本資料</strong> 
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;名<span style="color: #F00;">*</span></label>
							<div class="col-sm-10">
								<s:textfield name="consulting.name" maxlength="100" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">單位名稱<span style="color: #F00;">*</span></label>
							<div class="col-sm-10">
								<s:textfield name="consulting.organization" maxlength="500" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">單位類型<span style="color: #F00;">*</span></label>
							<div class="col-sm-10">
								<s:select name="consulting.optionOrganizationType.code" list="optionOrganizationTypeList" listKey="code" listValue="%{code +' ' +name}" class="form-control orgType"/>
								<s:textfield name="consulting.orgTypeOther" disabled="true" maxlength="500" placeholder="請輸入其他單位類型" class="orgType form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">諮詢類型<span style="color: #F00;">*</span></label>
							<div class="col-sm-10">
								<s:select name="consulting.optionConsult.code" list="optionConsultList" listKey="code" listValue="%{code +' ' +name}" class="form-control consult"/>
								<s:textfield name="consulting.consultTypeOther" disabled="true" maxlength="500" placeholder="請輸入其他諮詢類型" class="consult form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">產業/領域別<span style="color: #F00;">*</span></label>
							<div class="col-sm-10">
								<s:select name="consulting.optionIndustry.code" list="optionIndustryList" listKey="code" listValue="%{code +' ' +name}" class="form-control industry" />
								<s:textfield name="consulting.industryOther" disabled="true" maxlength="500" placeholder="請輸入其他產業/領域" class="industry form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">聯絡電話<span style="color: #F00;">*</span></label>
							<div class="col-sm-10">
								<s:textfield name="consulting.phone" maxlength="100" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">E-MAIL<span style="color: #F00;">*</span></label>
							<div class="col-sm-10">
								<s:textfield name="consulting.email" maxlength="100" class="form-control"/>		
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">內容說明<span style="color: #F00;">*</span></label>
							<div class="col-sm-10">
								<s:textarea name="consulting.content" rows="3" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox" name="consulting.approvalCheckBox" id="readPolicyCheck"> 同意【<a href="#">個人資料蒐集、處理及利用之告知暨同意條款</a>】
									</label>
								</div>
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="" class="col-sm-2 control-label">驗證碼<span style="color: #F00;">*</span></label>
							<div class="col-sm-10">
								<s:include value="/WEB-INF/jsp/captcha.jsp" />
							</div>
						</div>
						<div class="line_gray1px bottom10 top30"></div>
						<div class="form-group">
							<div class="col-sm-12 text-center">
								<button type="submit" class="btn btn-primary">確定送出</button>
								<button type="button" class="btn btn-default" onclick="window.location.href='<s:url value="/f2/consulting/create"/>'">清除重填</button>
							</div>
						</div>
					</s:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>		