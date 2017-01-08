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
						<i class="fa fa-cube" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>研發成果

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
						<li style="color: #1fb5da; margin-top: 10px;"><i class="fa fa-book right5" aria-hidden="true"></i>查看：<s:property value="researchPlan.clickNum"/>次</li>
<!-- 						<li style="color: #1fb5da;"><i class="fa fa-cloud-download right5" aria-hidden="true"></i>下載：10次</li> -->
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
					<table class="table content_03" style="margin-bottom: 0;">
						<thead>
							<tr>
								<th colspan="2" class="large_title_03">研究計畫資料</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="10%" class="date_01">計畫名稱</td>
								<td><s:property value="researchPlan.name" /></td>
							</tr>
							<tr>
								<td class="date_01">計畫編號</td>
								<td><s:property value="researchPlan.planNo" /></td>
							</tr>
							<tr>
								<td class="date_01">年度</td>
								<td><s:property value="researchPlan.year" /></td>
							</tr>
							<tr>
								<td class="date_01">主持人</td>
								<td><s:property value="researchPlan.manager" /></td>
							</tr>
							<tr>
								<td class="date_01">研究領域</td>
								<td>
									<s:if test="researchPlan.grbDomains != null">
										<s:iterator value="researchPlan.grbDomains" status="stat">
											<s:property value="name"/>&nbsp;&nbsp;&nbsp;
										</s:iterator>
									</s:if>
								</td>
							</tr>
							<tr>
								<td class="date_01">產業化潛力</td>
								<td><s:property value="%{researchPlan.trl.showString}" /></td>
							</tr>
							<tr>
								<td class="date_01">計畫關鍵詞</td>
								<td><s:property value="researchPlan.keyword" /></td>
							</tr>
							<tr>
								<td class="date_01">成果報告</td>
								<td>
									<a href="<s:url value="%{'http://grbsearch.stpi.narl.org.tw/search/planDetail2?id=	'+researchPlan.grb05Id}"/>" target="_blank">連結</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="well well-sm top10">
					<table class="table content_03" style="margin-bottom: 0;">
						<thead>
							<tr>
								<th colspan="2" class="large_title_03">研發成果列表</th>
							</tr>
						</thead>
						<tbody>
							<s:if test="researchPlan.technologies != null">
								<s:iterator value="researchPlan.technologies" status="stat">
									<tr>
										<td width="15%"><s:property value="#stat.count" /></td>
										<td></td>
									</tr>									
									<tr>
										<td class="date_01">技術名稱</td>
										<td><s:property value="name"/></td>
									</tr>
									<tr>
										<td class="date_01">技術簡述</td>
										<td><s:property value="descriptoin"/></td>
									</tr>
<!-- 									<tr> -->
<!-- 										<td class="date_01">技術發展階段</td> -->
<!-- 										<td> -->
<%-- 											<s:iterator value="optionTrlList" status="stat"> --%>
<%-- 												<p><s:property value="name"/>;</p> --%>
<%-- 											</s:iterator> --%>
<!-- 										</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td class="date_01">技術發展階段說明</td> -->
<%-- 										<td><s:property value="trlDesc"/></td> --%>
<!-- 									</tr> -->
								</s:iterator>
							</s:if>		
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>