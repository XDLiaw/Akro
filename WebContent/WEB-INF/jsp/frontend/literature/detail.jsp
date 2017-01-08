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
textarea[readonly] { width:100%; resize:none; border:none; background-color:#ffffff; color:#000000;}
</style>
</head>
<body>
<div class="rightContent frontend">
	<ul>
		<li class="all">
			<b>中文題名</b>
			<div class="border-text">
				<s:property value="literature.titleC"/>&nbsp;
			</div>
		</li>
		<li class="all">
			<b>外文題名</b>
			<div class="border-text">
				<s:property value="literature.titleF"/>&nbsp;
			</div>
		</li>
		<li class="half">
			<b>作者(中文)</b>
			<div class="border-text">
				<s:property value="literature.authorC"/>&nbsp;
			</div>
		</li>
		<li class="half">
			<b>作者(外文)</b>
			<div class="border-text">
				<s:property value="literature.authorF"/>&nbsp;
			</div>
		</li>
		<li class="all">
			<b>作者服務機構</b>
			<div class="border-text">
				<s:property value="literature.org"/>&nbsp;
			</div>
		</li>		
		<li class="all">
			<b>中文關鍵詞</b>
			<div class="border-text">
				<s:property value="literature.keywordC"/>&nbsp;
			</div>
		</li>		
		<li class="all">
			<b>外文關鍵詞</b>
			<div class="border-text">
				<s:property value="literature.keywordF"/>&nbsp;
			</div>
		</li>
		<li class="all">
			<b>原始中文摘要</b>
			<div class="">
				<s:textarea name="literature.summary" readonly="true" class="AutoHeight" />
			</div>
		</li>
		<li class="all">
			<b>原始外文摘要</b>
			<div class="">
				<s:textarea name="literature.summaryF" readonly="true" class="AutoHeight" />
			</div>
		</li>
		<li class="all">
			<b>連結網址</b>
			<div class="border-text">
				<a href="<s:property value="literature.linkUrl"/>" target="_blank">
					<s:property value="literature.linkUrl"/>
				</a>
			</div>
		</li>
		<li class="eighth">
			<b>語文</b>
			<div class="border-text">
				<s:property value="literature.language"/>&nbsp;
			</div>
		</li>		
		<li class="quarter">
			<b>卷期頁碼(頁數)</b>
			<div class="border-text">
				<s:property value="literature.pagination"/>&nbsp;
			</div>
		</li>
		<li class="eighth">
			<b>出版年</b>
			<div class="border-text">
				<s:property value="literature.publishYear"/>&nbsp;
			</div>
		</li>
		<li class="eighth">
			<b>指導教授</b>
			<div class="border-text">
				<s:property value="literature.advisor"/>&nbsp;
			</div>
		</li>
		<li class="eighth">
			<b>論文出版年</b>
			<div class="border-text">
				<s:property value="literature.publicationDate"/>&nbsp;
			</div>
		</li>
		<li class="quarter">
			<b>學位</b>
			<div class="border-text">
				<s:property value="literature.degree"/>&nbsp;
			</div>
		</li>
		<li class="quarter">
			<b>系所</b>
			<div class="border-text">
				<s:property value="literature.department"/>&nbsp;
			</div>
		</li>
		<li class="quarter">
			<b>畢業學校中文校名</b>
			<div class="border-text">
				<s:property value="literature.graduateSchoolC"/>&nbsp;
			</div>
		</li>
		<li class="half">
			<b>期刊名稱</b>
			<div class="border-text">
				<s:property value="literature.journalName"/>&nbsp;
			</div>
		</li>
		<li class="all">
			<b>資料來源</b>
			<div class="border-text">
				<s:property value="literature.source"/>&nbsp;
			</div>
		</li>
	</ul>
	
	<div class="clear"></div>
	<div class="bottom-btn-block">
		<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>
	</div>
				
	<form action="index" method="post" id="form-backToIndex">
		<s:hidden name="searchCondition.category"/>
		<s:hidden name="searchCondition.searchText"/>
		<s:hidden name="searchCondition.language"/>
		<s:hidden name="searchCondition.publishYear"/>
		<s:hidden name="searchCondition.pageIndex"/>
		<s:hidden name="searchCondition.pageSize"/>
	</form>
</div>	
</body>
</html>