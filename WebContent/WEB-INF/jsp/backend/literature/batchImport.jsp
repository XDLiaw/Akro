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
<style>
.batch-import {
	padding: 15px;
	margin-top: 23px;
	margin-bottom: 23px;
	border: 1px solid transparent;
}
</style>
<meta name="funcPathText" content="批次匯入"/>
</head>
<body>
	<div class="subForm">
		<s:form action="batchImportSubmit" method="post" validate="true" enctype="multipart/form-data" id="form-batchImport">
			<h2 class="itemTitle Down">批次匯入</h2>
			<ul>
				<li class="half">
					<input type="text" id="file_display" class="form-control" readonly="readonly"/>
				</li>
				<li class="quarter">
					<input type="button" value="選擇批次匯入檔案 " class="btn blueBtn" onclick="$('#btn_file').trigger('click')"/>
					<input type="file" id="btn_file" class="btn-file" name="uploadFile" accept=".xlsx" style="display:none;">
				</li>
				<li class="eighth">
					<input type="submit" value="匯入" class="btn btn-info redBtn" />
				</li>
<!-- 				<li class="eighth">						 -->
<!-- 					<input type="button" class="btn btn-default grayBtn" value="下載範例"  -->
<%-- 						onclick="window.location.href='<s:url value="downloadBatchSample"/>'"/>	 --%>
<!-- 				</li> -->
			</ul>
		</s:form>
		<b>!!! 注意 : 會依據匯入資料的ID欄位來辨識資料為新增或更新，或該ID已存在於現有資料庫則更新該筆資料否則新增 !!!</b>
	</div>
	
	<s:if test="batchImportResult != null">
		<div class="batch-import">
			<h2 class="">批次匯入結果</h2>	
			
			<s:if test="batchImportResult.insertList != null ">
				<b>新增 共<s:property value="batchImportResult.insertList.size()"/>筆</b>
				<table>	
					<tr>
						<th>ID</th>
						<th>中文題名</th>
						<th>資料分類</th>
					</tr>
					<s:iterator value="batchImportResult.insertList" status="stat">
						<tr>
							<td><s:property value="oid"/></td>
							<td><s:property value="titleC"/></td>
							<td><s:property value="category"/></td>
						</tr>
					</s:iterator>
				
				</table>
			</s:if>
			<s:if test="batchImportResult.updateList != null ">
				<b>更新 共<s:property value="batchImportResult.updateList.size()"/>筆</b>
				<table>	
					<tr>
						<th>ID</th>
						<th>中文題名</th>
						<th>資料分類</th>
					</tr>
					<s:iterator value="batchImportResult.updateList" status="stat">
						<tr>
							<td><s:property value="oid"/></td>
							<td><s:property value="titleC"/></td>
							<td><s:property value="category"/></td>
						</tr>
					</s:iterator>
				</table>
			</s:if>	
			<s:if test="batchImportResult.errMsgs != null ">
				<b>錯誤訊息列表 (共<s:property value="batchImportResult.errMsgs.size()"/>筆)</b>
				<table>	
					<s:iterator value="batchImportResult.errMsgs" status="stat">
						<tr>
							<td><s:property/></td>
						</tr>
					</s:iterator>
				</table>
			</s:if>				
		</div>
	</s:if>
</body>
</html>