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
						<i class="fa fa-cube" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>文獻

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
						<li style="color: #1fb5da; margin-top: 10px;"><i class="fa fa-book right5" aria-hidden="true"></i>查看：<s:property value="literature.clickNum" />次</li>
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
								<td width="120" class="date_01" style="border-top: 0;">中文題名</td>
								<td style="border-top: 0;" colspan="5"><s:property value="literature.titleC"/></td>
							</tr>
							<tr>
								<td class="date_01">外文題名</td>
								<td colspan="5"><s:property value="literature.titleF"/></td>
							</tr>
							<tr>
								<td class="date_01">連結網址</td>
								<td colspan="5">									
									<a href="<s:property value="literature.linkUrl"/>" target="_blank">
										<s:property value="literature.linkUrl"/>
									</a>
								</td>
							</tr>							
							<tr>
								<td class="date_01">作者(中文)</td>
								<td><s:property value="literature.authorC"/></td>
								<td class="date_01">作者(外文)</td>
								<td colspan=""><s:property value="literature.authorF"/></td>
								<td class="date_01">作者服務機構</td>
								<td colspan=""><s:property value="literature.org"/></td>
							</tr>
							<tr>
								<td class="date_01">中文關鍵詞</td>
								<td colspan="5"><s:property value="literature.keywordC"/></td>
							</tr>
							<tr>
								<td class="date_01">外文關鍵詞</td>
								<td colspan="5"><s:property value="literature.keywordF"/></td>
							</tr>
							<tr>
								<td class="date_01">原始中文摘要</td>
								<td colspan="5"><s:property value="literature.summary"/></td>
							</tr>
							<tr>
								<td class="date_01">原始外文摘要</td>
								<td colspan="5"><s:property value="literature.summaryF"/></td>
							</tr>
							<tr>
								<td class="date_01">語文</td>
								<td><s:property value="literature.language"/></td>
								<td class="date_01">卷期頁碼(頁數)</td>
								<td><s:property value="literature.pagination"/></td>
								<td class="date_01">出版年</td>
								<td><s:property value="literature.publishYear"/></td>
							</tr>
							<tr>
								<td class="date_01">指導教授</td>
								<td><s:property value="literature.advisor"/></td>
								<td class="date_01">論文出版年</td>
								<td><s:property value="literature.publicationDate"/></td>
								<td class="date_01">學位</td>
								<td><s:property value="literature.degree"/></td>
							</tr>
							<tr>
								<td class="date_01">畢業學校中文校名</td>
								<td colspan="5"><s:property value="literature.graduateSchoolC"/></td>
							</tr>
							<tr>
								<td class="date_01">系所</td>
								<td colspan="5"><s:property value="literature.department"/></td>
							</tr>
							<tr>
								<td class="date_01">期刊名稱</td>
								<td colspan="5"><s:property value="literature.journalName"/></td>
							</tr>
							<tr>
								<td class="date_01">資料來源</td>
								<td colspan="5"><s:property value="literature.source"/></td>
							</tr>
							<tr>
								<td class="date_01">資料分類</td>
								<td colspan="5"><s:property value="literature.codeIndustryId"/></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>