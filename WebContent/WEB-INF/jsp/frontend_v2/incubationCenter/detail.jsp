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
						<i class="fa fa-cube" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>育成中心

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
						<li style="color: #1fb5da; margin-top: 10px;"><i class="fa fa-book right5" aria-hidden="true"></i>查看：<s:property value="incubationCenter.clickNum" />次</li>
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
					<table class="table content_03" style="margin-bottom: 0;">
						<tbody>
							<tr>
								<td width="120" class="date_01" style="border-top: 0;">學校名稱</td>
								<td style="border-top: 0;" colspan="3"><s:property value="incubationCenter.schoolNameCh"/></td>
							</tr>
							<tr>
								<td class="date_01">單位名稱</td>
								<td colspan="3"><s:property value="incubationCenter.orgNameCh"/></td>
							</tr>
							<tr>
								<td class="date_01">屬性</td>
								<td colspan="3"><s:property value="incubationCenter.attribute"/></td>
							</tr>
							<tr>
								<td class="date_01">單位負責人</td>
								<td><s:property value="incubationCenter.bossName"/></td>
								<td class="date_01" width="60">職稱</td>
								<td><s:property value="incubationCenter.bossTitle"/></td>
							</tr>
							<tr>
								<td class="date_01">電話</td>
								<td colspan="3"><s:property value="incubationCenter.tel"/></td>
							</tr>
							<tr>
								<td class="date_01">電子信箱</td>
								<td colspan="3"><s:property value="incubationCenter.email"/></td>
							</tr>
							<tr>
								<td class="date_01">單位地址</td>
								<td colspan="3"><s:property value="incubationCenter.address"/></td>
							</tr>
							<tr>
								<td class="date_01">網址</td>
								<td colspan="3">
									<a href="<s:property value="incubationCenter.url"/>" target="_blank">
										<s:property value="incubationCenter.url"/>
									</a>
								</td>
							</tr>
							<tr>
								<td class="date_01">單位歷史</td>
								<td colspan="3"><s:property value="incubationCenter.orgHistory"/></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>