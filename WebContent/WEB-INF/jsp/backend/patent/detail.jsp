<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function(){
		$("#btn-back").click(function(){				
			$("#form-backToIndex").submit();
		});
	});
</script>
<meta name="funcPathText" content="編輯管理  > 檢視"/>
</head>
<body>
<!-- 	<h2 class="itemTitle">檢視</h2>	 -->
	<ul>
		<li class="all">
			<b>專利名稱</b>
			<div><s:property value="patent.name"/></div>
		</li>
		<li class="all">
			<b>專利權人</b>
			<div><s:property value="patent.assignee"/></div>
		</li>	
		<li class="all">
			<b>發明人</b>
			<div><s:property value="patent.invertor"/></div>
		</li>
		<li class="quarter">
			<b>國際分類號</b>
			<div><s:property value="patent.ipc"/></div>
		</li>			
		<li class="quarter">
			<b>申請國別</b>
			<div><s:property value="%{patent.country.code + ' ' +patent.country.name}"/></div>
		</li>
		<li class="quarter">
			<b>申請號</b>
			<div><s:property value="patent.appliactionNo"/></div>
		</li>
		<li class="quarter">
			<b>申請日</b>
			<div><s:property value="patent.applicationDate"/></div>
		</li>
		<li class="quarter">
			<b>公開號</b>
			<div><s:property value="patent.openNo"/></div>
		</li>						
		<li class="quarter">
			<b>公開日</b>
			<div><s:property value="patent.openDate"/></div>
		</li>						
		<li class="quarter">
			<b>公告號</b>
			<div><s:property value="patent.publicationNo"/></div>
		</li>						
		<li class="quarter">
			<b>公告日</b>
			<div><s:property value="patent.publicationDate"/></div>
		</li>
		<li class="quarter">
			<b>專利類別</b>
			<div><s:property value="patent.category"/></div>
		</li>
		<li class="quarter">
			<b>專利狀態</b>
			<div><s:property value="patent.patentStatus"/></div>
		</li>			
		<li class="half">
			<b>專利家族</b>
			<div><s:property value="patent.familyNo"/></div>
		</li>
		<li class="all">
			<b>專利技術摘要</b>
			<div><s:property value="patent.techAbstract"/></div>
		</li>
		<li class="all">
			<b>重要圖式</b>
			<div>
				<a href="<s:url value="%{patent.patentPictureLink}"/>" target="_blank">
					<img id="patent_img" src="data:image;base64,<s:property value="patent.base64PatentPicture"/>" style="max-width:400px; max-height:400px;">
				</a>
			</div>
		</li>
		<li class="half">
			<b>專利技術領域</b>
			<div><s:property value="patent.techField.name"/></div>
		</li>
		<li class="half">
			<b>應用範圍/產業</b>
			<div><s:property value="patent.usage"/></div>
		</li>									
		<li class="all">
			<b>技術發展階段</b>
			<div><s:property value="%{patent.trl.code + ' ' +patent.trl.name}"/></div>
		</li>									
		<li class="all">
			<b>技術發展階段說明</b>
			<div><s:property value="patent.trlDesc"/></div>
		</li>
	</ul>
	<div class="clear"></div>
	<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
		<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>	
	</div>	
	<form action="index" method="post" id="form-backToIndex">
		<s:hidden name="searchCondition.name"/>
		<s:hidden name="searchCondition.appliactionNo"/>
		<s:hidden name="searchCondition.countryCode"/>
		<s:hidden name="searchCondition.techFieldId"/>
		<s:hidden name="searchCondition.pageIndex"/>
		<s:hidden name="searchCondition.pageSize"/>
	</form>
</body>
</html>