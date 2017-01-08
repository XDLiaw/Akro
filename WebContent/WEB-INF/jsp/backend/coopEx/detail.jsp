<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function() {
		$("#btn-back").click(function(){				
			$("#form-backToIndex").submit();
		});
	});
</script>
<style>
.table-files tr, th, td { border: solid 1px; }
.table-files td li { margin-bottom: 1px; }
</style>
<meta name="funcPathText" content="編輯管理 > 檢視"/>
</head>
<body>
	<ul>
		<li class="half">
			<b>年度</b>
			<div class="border-text">
				<s:property value="coopEx.year"/>
			</div>
		</li>
		<li class="half">
			<b>類別</b>
			<div class="border-text">
				<s:property value="coopEx.type"/>
			</div>			
		</li>
		<li class="all">
			<b>標題</b>
			<div class="border-text">
				<s:property value="coopEx.title"/>
			</div>			
		</li>			
		<li class="all">
			<b>案名</b>
			<div class="border-text">
				<s:property value="coopEx.projName"/>
			</div>			
		</li>		
		<li class="all">
			<b>研發團隊</b>
			<div class="border-text">
				<s:property value="coopEx.rdTeam"/>
			</div>			
		</li>
		<li class="all">
			<b>輔導團隊</b>
			<div class="border-text">
				<s:property value="coopEx.assisTeam"/>
			</div>
		</li>
		<li class="all">
			<b>內容</b>
			<s:textarea name="coopEx.content" rows="10" disabled="true"/>
		</li>
	</ul>
	<br>
	
	<!-- 照片 -->
	<table class="table-files">
		<thead>
			<tr>
				<td colspan="2">照片清單</td>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="coopEx.imgs" status="stat">
			<tr>
				<td width="15%">
					<img src="data:image;base64,<s:property value="%{getBase64Thumbnail(240, 240)}"/>" style="max-width:120px; max-height:120px;" />
				</td>
				<td>
					<ul>
						<li>
							<s:url value="downloadImage.action" var="downloadImageUrl">
								<s:param name="imgId" value="id" />
							</s:url>
							<a href="<s:property value="downloadImageUrl" />" >
								<s:property value="fileName"/>
							</a>
						</li>
						<li class="all">
							<s:textarea name="fileDesc" placeholder="無檔案說明" disabled="true"/>
						</li>
					</ul>
				</td>
			</tr>
			</s:iterator>
		</tbody>
	</table>
	
	<!-- 影片 -->
	<table class="table-files">
		<thead>
			<tr>
				<td colspan="2">影片清單</td>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="coopEx.videos" status="stat">
			<tr>
				<td width="15%">
					<s:url value="downloadVideo.action" var="downloadVideoUrl">
						<s:param name="videoId" value="id" />
					</s:url>					
					<video 
						src="<s:property value="downloadVideoUrl" />" 
						controls="controls" preload="none"
						style="max-width:120px; max-height:120px;">
					</video>
				</td>
				<td>
					<ul>
						<li>
							<s:property value="fileName"/>
						</li>
						<li class="all">
							<s:textarea name="fileDesc" placeholder="無檔案說明" disabled="true"/>
						</li>
					</ul>
				</td>
			</tr>				
			</s:iterator>
		</tbody>
	</table>		
	
	<!-- 附檔 -->
	<table class="table-files">
		<thead>
			<tr>
				<td>附檔清單</td>			
			</tr>
		</thead>
		<tbody>
			<s:iterator value="coopEx.attachFiles" status="stat">
			<tr>
				<td>
					<ul>
						<li>
							<s:url value="downloadAttach.action" var="downloadAttachUrl">
								<s:param name="attachFileId" value="id" />
							</s:url>
							<a href="<s:property value="downloadAttachUrl" />" >
								<s:property value="fileName"/>
							</a>
						</li>
						<li class="all">
							<s:textarea name="fileDesc" placeholder="無檔案說明" disabled="true"/>
						</li>
					</ul>
				</td>
			</tr>				
			</s:iterator>
		</tbody>
	</table>
	
	<div class="clear"></div>
	<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
		<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>		
	</div>
	
	<s:include value="./form-backToIndex.jsp" />
</body>
</html>