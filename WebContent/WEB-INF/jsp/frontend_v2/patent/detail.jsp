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
						<i class="fa fa-cube" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>專利資料

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
						<li style="color: #1fb5da; margin-top: 10px;"><i class="fa fa-book right5" aria-hidden="true"></i>查看：<s:property value="patent.clickNum" />次</li>
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
								<td width="120" class="date_01" style="border-top:0;">專利名稱</td>
								<td style="border-top: 0;" colspan="3"><s:property value="patent.name"/></td>
							</tr>
							<tr>
								<td class="date_01">專利權人</td>
								<td colspan="3"><s:property value="patent.assignee"/></td>
							</tr>
							<tr>
								<td class="date_01">發明人</td>
								<td colspan="3"><s:property value="patent.invertor"/></td>
							</tr>
							<tr>
								<td class="date_01">國際分類號</td>
								<td><s:property value="patent.ipc"/></td>
								<td class="date_01" width="120">申請國別</td>
								<td><s:property value="%{patent.country.code + ' ' +patent.country.name}"/></td>
							</tr>
							<tr>
								<td class="date_01">申請號</td>
								<td><s:property value="patent.appliactionNo"/></td>
								<td class="date_01">申請日</td>
								<td><s:date name="patent.applicationDate" format="yyyy/MM/dd"/></td>
							</tr>
							<tr>
								<td class="date_01">公開號</td>
								<td><s:property value="patent.openNo"/></td>
								<td class="date_01">公開日</td>
								<td><s:date name="patent.openDate" format="yyyy/MM/dd"/></td>
							</tr>
							<tr>
								<td class="date_01">公告號</td>
								<td><s:property value="patent.publicationNo"/></td>
								<td class="date_01">公告日</td>
								<td><s:date name="patent.publicationDate" format="yyyy/MM/dd"/></td>
							</tr>
							<tr>
								<td class="date_01">專利類別</td>
								<td><s:property value="patent.category"/></td>
								<td class="date_01">狀態</td>
								<td><s:property value="patent.patentStatus"/></td>
							</tr>
							<tr>
								<td class="date_01">專利技術領域</td>
								<td colspan="3"><s:property value="patent.techField.name"/></td>
							</tr>
							<tr>
								<td class="date_01">專利家族</td>
								<td colspan="3"><s:property value="patent.familyNo"/></td>
							</tr>
							<tr>
								<td class="date_01">應用範圍/產業</td>
								<td colspan="3"><s:property value="patent.usage"/></td>
							</tr>
							<tr>
								<td class="date_01">專利技術摘要</td>
								<td colspan="3"><s:property value="patent.techAbstract"/></td>
							</tr>
							<tr>								
								<td class="date_01">重要圖式</td>
								<td colspan="3">
									<a href="<s:url value="%{patent.patentPictureLink}"/>" target="_blank">
										<img id="patent_img" src="data:image;base64,<s:property value="patent.base64PatentPicture"/>" style="max-width:400px; max-height:400px;">
									</a>								
								</td>
							</tr>
							<tr>
								<td class="date_01">技術發展階段</td>
								<td colspan="3"><s:property value="%{patent.trl.code + ' ' +patent.trl.name}"/></td>
							</tr>
							<tr>
								<td class="date_01">技術發展階段說明</td>
								<td colspan="3"><s:property value="patent.trlDesc"/></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>