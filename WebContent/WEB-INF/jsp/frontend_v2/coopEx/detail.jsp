<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn-back").click(function() {
			$("#form-backToIndex").submit();
		});
	});
</script>
<style>
.videos video { width:100%; height:auto; }
</style>
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
						<i class="fa fa-calendar-check-o" aria-hidden="true" style="font-size:18px; margin-right:5px;"></i>產學合作案例
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
				<div class="large_title_03"><s:property value="coopEx.title"/></div>
				<div class="date_01">發佈日期：<s:date name="coopEx.createTime" format="yyyy/M/d" /></div>
				<div class="content_01">
					<div class="list-inline text-right" style="margin-bottom: 0;">
						<s:include value="../share-buttons.jsp" />
					</div>
				</div>
				<div class="line_solid"></div>			
				<div class="top20">
					<table class="table table-striped content_01">
						<tbody>
							<tr class="info">
								<td width="15%">案　　名</td>
								<td><s:property value="coopEx.projName"/></td>
							</tr>
							<tr>
								<td>研發團隊</td>
								<td><s:property value="coopEx.rdTeam"/></td>
							</tr>
							<tr class="info">
								<td>輔導團隊</td>
								<td><s:property value="coopEx.assisTeam"/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="content_04">
					<span class="fa-stack fa-lg">
					<i class="fa fa-square fa-stack-2x"></i>
					<i class="fa fa-pencil-square-o fa-stack-1x fa-inverse"></i>
					</span>內容：
				</div>
				<div class="content_01 top10">
					<s:property value="coopEx.content" escapeHtml="false"/>
				</div>
				<div class="line_solid"></div>
				<div class="content_04">
					<span class="fa-stack fa-lg"> 
						<i class="fa fa-square fa-stack-2x"></i> 
						<i class="fa fa-camera-retro fa-stack-1x fa-inverse"></i>
					</span>
					照片：
				</div>
				<div class="row">
					<s:iterator value="coopEx.imgs" status="stat">
						<div class="col-sm-4 col-xs-12" style="margin-top:15px;" title="<s:property value="fileDesc"/>">
							<s:url value="downloadImage.action" var="downloadAttachUrl">
								<s:param name="imgId" value="id" />
							</s:url>
							<a href="<s:property value="downloadAttachUrl" />">
								<div class="center-cropped2 img_radius">
									<img src="data:image;base64,<s:property value="%{getBase64Thumbnail(400,300)}"/>" class="img-responsive"/>
								</div>
							</a>
							<div class="text-center" style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
								<s:property value="fileDesc"/>
							</div>
						</div>	
					</s:iterator>
				</div>
				<div class="line_solid"></div>
				<div class="content_04">
					<span class="fa-stack fa-lg"> 
						<i class="fa fa-square fa-stack-2x"></i> 
						<i class="fa fa-camera-retro fa-stack-1x fa-inverse"></i>
					</span>
					影片：
				</div>
				<div class="row videos">
					<s:iterator value="coopEx.videos" status="stat">
						<div class="col-sm-4 col-xs-12" style="margin-top:15px">
							<s:url value="downloadVideo.action" var="downloadVideoUrl">
								<s:param name="videoId" value="id" />
							</s:url>
							<video 
								src="<s:property value="downloadVideoUrl" />" 
								controls="controls" preload="metadata">
							</video>
							<div class="text-center"><s:property value="fileDesc"/></div>
						</div>	
					</s:iterator>
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
							<s:iterator value="coopEx.attachFiles" status="stat">
								<tr>
									<s:url value="downloadAttach.action" var="downloadAttachUrl">
										<s:param name="attachFileId" value="id" />
									</s:url>
									<td>
										<a href="<s:property value="downloadAttachUrl" />">
											<s:property value="fileName"/>
										</a>
									</td>
									<td><s:property value="%{contentLength/1024}"/>KB</td>
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
			</div><!-- 右列表 END-->
		</div>
	</div>	
</body>
</html>	