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
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-xs-12">
				<div>
					<div class="large_title_01">
						<i class="fa fa-cube" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>產學人才 

					</div>
					<div class="line_blue">&nbsp;</div>
					<div class="line_gray1px bottom20"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12 col-xs-12">
				<div class="pull-left">
					<ul class="list-inline">
						<li style="color: #1fb5da; margin-top: 10px;"><i class="fa fa-book right5" aria-hidden="true"></i>查看：<s:property value="talentedPeople.clickNum" />次</li>
						<!-- <li style="color: #1fb5da;"><i class="fa fa-cloud-download right5" aria-hidden="true"></i>下載：10次</li> -->
					</ul>
				</div>
				<div class="pull-right">
					<div class="list-inline text-right" style="margin-bottom: 0;">
						<s:include value="../share-buttons.jsp" />
					</div>				
					<ul class="list-inline text-right" style="margin-bottom: 0;">
						<li class="nopadding">
							<button type="button" class="btn btn-default">
								<i class="fa fa-minus-square right5" aria-hidden="true"></i>縮小
							</button>
						</li>
						<li class="nopadding">
							<button type="button" class="btn btn-default">
								<i class="fa fa-plus-square right5" aria-hidden="true"></i>放大
							</button>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
				<div class="well well-sm top10">
					<table class="table content_03" style="margin-bottom:0;">
						<tbody>
							<tr>
								<td width="120" class="date_01" style="border-top:0;">姓名(中)</td>
								<td style="border-top:0;"><s:property value="talentedPeople.nameCh" /></td>
								<td width="60" class="date_01" style="border-top:0;">性別</td>
								<td style="border-top:0;"><s:property value="talentedPeople.gender" /></td>
								<td width="20%" style="border-top:0;" rowspan="4">
									<img src="data:image;base64,<s:property value="talentedPeople.base64HeadShot"/>" class="img-responsive img-thumbnail" alt="" style="maring-top:0" />
								</td>
							</tr>
							<tr>
								<td class="date_01">姓名(英)</td>
								<td colspan="3"><s:property value="talentedPeople.nameEn" /></td>
							</tr>
							<tr>
								<td class="date_01">連絡電話</td>
								<td colspan="3">
									<s:property value="%{talentedPeople.isPublicTel ? talentedPeople.tel : '非公開'}"/>
								</td>
							</tr>
							<tr>
								<td class="date_01">e-mail</td>
								<td colspan="3">
									<s:property value="%{talentedPeople.isPublicEmail ? talentedPeople.email : '非公開'}"/>
								</td>
							</tr>
							<tr>
								<td class="date_01">現職單位</td>
								<td colspan="4"><s:property value="talentedPeople.workOrg"/></td>
							</tr>
							<tr>
								<td class="date_01">現職職位</td>
								<td colspan="4"><s:property value="talentedPeople.job" /></td>
							</tr>
							<tr>
								<td class="date_01">網站連結</td>
								<td colspan="4">
									<a href="<s:property value="talentedPeople.url"/>">
										<s:property value="talentedPeople.url"/>
									</a>
								</td>
							</tr>
							<tr>
								<td class="date_01">領域</td>
								<td colspan="4">
									<s:iterator value="talentedPeople.domains" status="stat">
										<s:property value="%{name + '; '}"/>
									</s:iterator>								
								</td>
							</tr>
							<tr>
								<td class="date_01">合作專長</td>
								<td colspan="4"><s:property value="talentedPeople.specialty" /></td>
							</tr>
							<!-- 重要研發成果 -->
							<tr>
								<s:if test="talentedPeople.isPublicRdResult != true">
									<td colspan="5"><span class="date_01" >重要研發成果</span>&nbsp;&nbsp;&nbsp;非公開</td>
								</s:if>
								<s:else>
									<td class="date_01" colspan="5">
										<a data-toggle="collapse" href="#research">重要研發成果</a>&nbsp;<i class="fa fa-angle-down" aria-hidden="true"></i>
										<s:include value="./detail-rdResult.jsp" />
									</td>	
								</s:else>
							</tr>
							<!-- 成果移轉及授權案例 -->
							<tr>
								<s:if test="talentedPeople.isPublicTransferCase != true">
									<td colspan="5"><span class="date_01" >成果移轉及授權案例</span>&nbsp;&nbsp;&nbsp;非公開</td>
								</s:if>
								<s:else>
									<td class="date_01" colspan="5">
										<a data-toggle="collapse" href="#transfer">成果移轉及授權案例</a>&nbsp;<i class="fa fa-angle-down" aria-hidden="true"></i>
										<s:include value="./detail-transferCase.jsp" />
									</td>
								</s:else>
							</tr>
							<!-- 主要產學合作計畫案例 -->
							<tr>
								<s:if test="talentedPeople.isPublicMainProject != true">
									<td colspan="5"><span class="date_01" >主要產學合作計畫案例</span>&nbsp;&nbsp;&nbsp;非公開</td>
								</s:if>
								<s:else>
									<td class="date_01" colspan="5">
										<a data-toggle="collapse" href="#cooperation">主要產學合作計畫案例</a>&nbsp;<i class="fa fa-angle-down" aria-hidden="true"></i>
										<s:include value="./detail-mainProject.jsp" />
									</td>
								</s:else>
							</tr>
							<tr>
								<td class="date_01">產學獲獎事蹟</td>
								<td colspan="4">
									<s:if test="talentedPeople.isPublicRewardHistory">
										<s:property value="talentedPeople.rewardHistory" />
									</s:if>
									<s:else>
										非公開
									</s:else>
								</td>
							</tr>
							<tr>
								<td class="date_01">其他產業相關經驗</td>
								<td colspan="4">
									<s:if test="talentedPeople.isPublicOtherExperience">
										<s:property value="talentedPeople.otherExperience" />
									</s:if>
									<s:else>
										非公開
									</s:else>
								</td>
							</tr>							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>