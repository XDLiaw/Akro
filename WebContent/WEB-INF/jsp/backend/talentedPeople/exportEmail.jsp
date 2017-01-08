<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$("input[type=file]#btn_file").change(function() {
			$("input[type=text]#file_display").val($(this).val());
		});
	});
</script>
<meta name="funcPathText" content="Email列表下載"/>
</head>
<body>
	<ul>	
		<li class="all">
			<label style="font-size:16px">全部產學人才Email</label>
			<input type="button" class="btn btn-default grayBtn" value="下載" 
				onclick="window.location.href='<s:url value="exportAllEmail"/>'"/>
		</li>
		<li class="all">
			<label style="font-size:16px">尚未同意個資收集法的產學人才Email</label>
			<input type="button" class="btn btn-default grayBtn" value="下載" 
				onclick="window.location.href='<s:url value="exportNotAgreePDPLYetEmail"/>'"/>
		</li>
		<li class="all">
			<label style="font-size:16px">個資收集法同意/不同意情況列表</label>
			<input type="button" class="btn btn-default grayBtn" value="下載" 
				onclick="window.location.href='<s:url value="exportPDPLList"/>'"/>
		</li>		
	</ul>	

</body>
</html>