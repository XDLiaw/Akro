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
		
		$("textarea.AutoHeight").css("overflow","hidden").bind("keydown keyup", function(){
			$(this).height($(this).prop("scrollHeight")+"px");
		}).keydown();
	});
</script>
<style>
.table-files tr, th, td { border:solid 1px; }
.table-files td li { margin-bottom:1px; }
textarea[disabled] { width:100%; resize:none; border:none; background-color:#ffffff; }
</style>
</head>
<body>
	<div id="conZone">
		<h2 class="storypage"><s:property value="coopEx.title"/></h2>
		<div class="listInfo">
			案名：<s:property value="coopEx.projName"/>
			<br>
			研發團隊：<s:property value="coopEx.rdTeam"/>
			<br>
			輔導團隊：<s:property value="coopEx.assisTeam"/>
		</div>
		<div class="storypageCon">
			<s:textarea name="coopEx.content" disabled="true" class="AutoHeight" />
		</div>
		<div class="storypagePic">
			<ul>
				<s:iterator value="coopEx.imgs" status="stat">
					<li>
						<div class="item01-S">
							<img src="data:image;base64,<s:property value="%{getBase64Thumbnail(500, 500)}"/>">
							<div class="itemTxt-S"><s:property value="fileDesc"/></div>
						</div>
					</li>
				</s:iterator>
				<s:iterator value="coopEx.videos" status="stat">
					<li>
						<div class="item01-S">
							<s:url value="downloadVideo.action" var="downloadVideoUrl">
								<s:param name="videoId" value="id" />
							</s:url>
							<video 
								src="<s:property value="downloadVideoUrl" />" 
								controls="controls" preload="none"
								style="width:295px; height:150px;"
								>
							</video>
							<div class="itemTxt-S"><s:property value="fileDesc"/></div>
						</div>
					</li>
				</s:iterator>
			</ul>
		</div>
	</div>
	<div class="clear"></div>	

	<div class="btnZone">
		<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>		
	</div>
	
	<s:include value="./form-backToIndex.jsp" />
</body>
</html>