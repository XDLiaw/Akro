<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$('ul.categoryList li:contains("加入會員")').addClass("active");
	});
	
	function validateForm() {
		return passwordConfirm();
	}
	
	function passwordConfirm() {
		var password = $("input[name='member.password']").val();
		var passwordConfirm = $("#passwordConfirm").val();
		if (password != passwordConfirm) {
			$("input[name='member.password']").val("");
			$("#passwordConfirm").val("");
			$('html,body').animate({scrollTop:$("input[name='member.password']").offset().top - 100},300);
			$("input[name='member.password']").focus();
			alert("密碼與確認密碼不一致，請重新填寫");
			return false;
		}
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
				<div class="large_title_03">註冊Link-IAC</div>
				<div class="line_solid"></div>
				<div class="text-center">
					<img src="<s:url value="/images/frontend-v2/member_icon_02.jpg"/>" alt="" width="150" />
				</div>
				<div class="content_01 top10 text-center">
					歡迎來到「運用法人鏈結產學合作計畫」網站感謝您的加入，在成為我們會員之前，請正確填寫以下資料(<span style="color: #F00;"> * </span>為必填)
				</div>
				<div class="content_01 well top10">
					<s:form action="registerSubmit" method="post" validate="true" class="form-horizontal" onsubmit="return validateForm()">
						<!-- 帳號密碼 -->
						<div class="line_gray1px bottom10 text-center large_title_04">
							<strong>帳號密碼</strong>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">會員帳號<span style="color: #F00;">*</span></label>
							<div class="col-sm-9">
								<s:textfield name="member.account" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">設定密碼<span style="color: #F00;">*</span></label>
							<div class="col-sm-9">
								<s:password name="member.password" maxlength="20" class="form-control" placeholder="6~20個半形字元，只接受英文字母與數字，大小寫有別" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">確認密碼<span style="color: #F00;">*</span></label>
							<div class="col-sm-9">
								<s:password maxlength="20" class="form-control" id="passwordConfirm" placeholder="請再輸入一次您所設定之密碼" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">E-MAIL<span style="color: #F00;">*</span></label>
							<div class="col-sm-9">
								<s:textfield name="member.email" class="form-control" />
							</div>
						</div>
						<!-- 個人資訊(1) -->
						<div class="line_gray1px bottom10 text-center large_title_04 top30">
							<strong>個人資訊(1)</strong>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">姓&nbsp;&nbsp;&nbsp;名<span style="color: #F00;">*</span></label>
							<div class="col-sm-9">
								<s:textfield name="member.name" maxlength="50" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">公司/團體/學校/名稱<span style="color: #F00;">*</span></label>
							<div class="col-sm-9">
								<s:textfield name="member.org" maxlength="50" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">部門/系所</label>
							<div class="col-sm-9">
								<s:textfield name="member.dept" maxlength="50" class="form-control" />
							</div>
						</div>
						<!-- 單位資訊 -->
						<div class="line_gray1px bottom10 text-center large_title_04 top30">
							<strong>單位資訊</strong>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">行 業 別<span style="color: #F00;">*</span></label>
							<div class="col-sm-9">
								<s:select name="member.industry" list="industryList" listKey="code" listValue="name" headerKey="" headerValue="--請選擇--" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">產業別(可複選)<span style="color: #F00;">*</span></label>
							<div class="col-sm-9">
								<div class="row">
									<s:iterator value="optIndustryList" status="stat">
										<div class="checkbox col-lg-3 col-md-4 col-sm-6 col-xs-6">
											<label class="checkbox-inline"> 
												<input type="checkbox" name="member.optIndustryIdList" value="<s:property value="%{id}" />" <s:property value="%{member.optIndustryIdList.contains(id) ? 'checked' : ''}"/> /> 
												<s:property value="name" />
											</label>
										</div>
									</s:iterator>
								</div>
							</div>
						</div>
						<!-- 個人資訊(2) -->
						<div class="line_gray1px bottom10 text-center large_title_04 top30">
							<strong>個人資訊(2)</strong>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">職  務  別<span style="color: #F00;">*</span></label>
							<div class="col-sm-9">
								<s:select name="member.jobType" list="jobTypeList" listKey="code" listValue="name" headerKey="" headerValue="--請選擇--" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">職稱</label>
							<div class="col-sm-9">
								<s:textfield name="member.jobTitle" maxlength="50" class="form-control" />
							</div>
						</div>
						<!-- 通訊資料 -->
						<div class="line_gray1px bottom10 text-center large_title_04 top30">
							<strong>通訊資料</strong> 
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">通訊地址<span style="color:#F00;">*</span></label>
							<div class="col-sm-9">
								<s:textfield name="member.address" maxlength="500" class="form-control" placeholder="地址"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">郵遞區號</label>
							<div class="col-sm-9">
								<s:textfield name="member.postalCode" maxlength="20" class="form-control" placeholder="郵遞區號"/>
							</div>
						</div>						
						<div class="form-group">
							<label class="col-sm-3 control-label">聯絡電話<span style="color:#F00;">*</span></label>
							<div class="col-sm-9">
								<s:textfield name="member.tel" maxlength="30" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">行動電話</label>
							<div class="col-sm-9">
								<s:textfield name="member.mobile" maxlength="30" class="form-control"/>
							</div>
						</div>
						<!-- 技術需求 -->
						<div class="line_gray1px bottom10 text-center large_title_04 top30">
							<strong>技術需求</strong>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">技術需求領域</label>
							<div class="col-sm-9">
								<s:select name="member.optDomain.id" list="optDomainList" listKey="id" listValue="name" headerKey="" headerValue="--請選擇--" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">技術需求項目</label>
							<div class="col-sm-9">
								<s:textfield name="member.neededTec" maxlength="30" class="form-control"/>
							</div>
						</div>
						<!-- 驗證 -->
						<div class="line_gray1px bottom10 text-center large_title_04 top30">
							<strong>驗證</strong> 
						</div>
						<div class="form-group form-inline">
							<label for="" class="col-sm-3 control-label">驗證碼<span style="color:#F00;">*</span></label>
							<div class="col-sm-9">
								<s:include value="/WEB-INF/jsp/captcha.jsp" />
							</div>
						</div>
						
						<div class="line_gray1px bottom10 top30"></div>
						<div class="form-group">
							<div class="col-sm-12 text-center">
								<button type="submit" class="btn btn-primary">確定送出</button>
								<button type="reset" class="btn btn-default">清除重填</button>
							</div>
						</div>
					</s:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
