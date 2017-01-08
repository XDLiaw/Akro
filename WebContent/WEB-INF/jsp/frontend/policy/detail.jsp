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
			<b>語文</b>
			<div class="border-text">
				<s:property value="literature.language"/>&nbsp;
			</div>
		</li>		
		<li class="half">
			<b>出版年</b>
			<div class="border-text">
				<s:property value="literature.publishYear"/>&nbsp;
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