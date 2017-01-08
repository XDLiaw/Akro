<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn-back").click(function(){
			$("#form-backToIndex").submit();
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
						<i class="fa fa-file-text-o" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>公告訊息
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
				<div class="large_title_03"><s:property value="news.title"/></div>
				<div class="date_01">發佈日期：<s:date name="news.createTime" format="yyyy/M/d"/></div>
				<div class="date_01">資料來源：<s:property value="news.source"/></div>
				<div class="content_01">
					<div class="list-inline text-right" style="margin-bottom: 0;">
						<s:include value="../share-buttons.jsp" />
					</div>
				</div>
				<div class="line_solid"></div>
				<div class="content_04">
					<span class="fa-stack fa-lg">
					<i class="fa fa-square fa-stack-2x"></i>
					<i class="fa fa-pencil-square-o fa-stack-1x fa-inverse"></i>
					</span>內容：
				</div>
				<div class="content_01 top10">
					<s:property value="news.content" escapeHtml="false"/>
				</div>
				<div class="line_solid"></div>
				<div class="content_04">
					<span class="fa-stack fa-lg">
						<i class="fa fa-square fa-stack-2x"></i>
						<i class="fa fa-file-text fa-stack-1x fa-inverse"></i>
					</span>
					附件檔案：
				</div>
				<div class="top10">
					<table class="table table-striped content_01">
						<thead>
							<tr>
								<th>檔案名稱</th>
								<th>檔案大小</th>
								<th>更新日期</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="news.attachs" status="stat">
								<tr>
									<s:url value="downloadAttach.action" var="downloadAttachUrl">
										<s:param name="attachFileId" value="id" />
									</s:url>
									<td>
										<a href="<s:property value="downloadAttachUrl" />">
											<s:property value="uploadFileName"/>
										</a>
									</td>
									<td><s:property value="%{fileContent.length/1024}"/>KB</td>
									<td><s:date name="updateTime" format="yyyy/M/d"/></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
				<div class="top20">
					<button type="button" class="btn btn-default" id="btn-back">
						<i class="fa fa-angle-double-left right5" aria-hidden="true"></i>回列表
					</button>
				</div>
				<s:include value="./form-backToIndex.jsp" />
			</div>
		</div>
	</div>
</body>
</html>