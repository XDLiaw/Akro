<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function() {
		$("a.qnr-link").each(function(index) {
			$(this).html($(this).prop("href"));
		});
	});

</script>
</head>
<body>
	<ul>
		<li class="all">
			<label style="font-size:16px">範例問卷連結</label><br>
			<s:url value="fillInQnr" var="fillInQnrPart0To3UrlTag" escapeAmp="false">
				<s:param name="encryptSchoolId" value="encryptSchoolId" />
			</s:url>					
			<a href="<s:property value="fillInQnrPart0To3UrlTag" />" class="qnr-link"></a>
		</li>	
	</ul>
	
	<div class="clear"></div><br><br>
	
	<ul>	
		<li class="all">
			<label style="font-size:16px">問卷連結報表(全部學校)</label>
			<input type="button" class="btn btn-default grayBtn" value="匯出" 
				onclick="window.location.href='<s:url value="downloadQnrLinksExcel"/>'"/>	
		</li>
		<li class="all">
			<label style="font-size:16px">問卷連結報表(未填學校)</label>
			<input type="button" class="btn btn-default grayBtn" value="匯出" 
				onclick="window.location.href='<s:url value="downloadUnfillQnrLinksExcel"/>'"/>	
		</li>		
		<li class="all">
			<label style="font-size:16px">問卷結果報表</label>
			<input type="button" class="btn btn-default grayBtn" value="匯出" 
				onclick="window.location.href='<s:url value="downloadQnrResultExcel"/>'"/>	
		</li>
	</ul>
	
	
</body>
</html>