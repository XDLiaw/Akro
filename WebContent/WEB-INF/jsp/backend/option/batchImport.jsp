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
				<li class="all">
					<b>說明1: 代碼欄將視為文字處理，並且長度不可超過10</b>
				</li>
				<li class="all">
					<b>說明2: 若代碼已存在，則將以匯入之代碼名稱和排序覆蓋先前的</b>
				</li>
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
				<li class="eighth">						
					<input type="button" class="btn btn-default grayBtn" value="下載範例" 
						onclick="window.location.href='<s:url value="downloadBatchSample"/>'"/>	
				</li>
			</ul>
		</s:form>
	</div>
	
	<s:if test="batchImportResult != null">
		<div class="batch-import">
			<h2 class="">批次匯入結果</h2>	
			
			<table>
				<s:if test="batchImportResult.newOptions != null ">
					<tr><th>新增代碼列表   (共<s:property value="batchImportResult.newOptions.size()"/>筆)</th></tr>
					<s:iterator value="batchImportResult.newOptions" status="stat">
						<tr>
							<td><s:property value="%{code+':'+name+' ('+priority+')'}"/></td>
						</tr>
					</s:iterator>
				</s:if>
			</table>
			<table>
				<tr><th>更新代碼列表 (共<s:property value="batchImportResult.updateOptions.size()"/>筆)</th></tr>
				<s:if test="batchImportResult.updateOptions != null ">
					<s:iterator value="batchImportResult.updateOptions" status="stat">
						<tr>
							<td><s:property value="%{code+':'+name+' ('+priority+')'}"/></td>
						</tr>
					</s:iterator>
				</s:if>
			</table>
			<table>
				<tr><th>錯誤訊息列表 (共<s:property value="batchImportResult.errMsgs.size()"/>筆)</th></tr>
				<s:if test="batchImportResult.errMsgs != null ">
					<s:iterator value="batchImportResult.errMsgs" status="stat">
						<tr>
							<td><s:property/></td>
						</tr>
					</s:iterator>
				</s:if>
			</table>
		</div>
	</s:if>
</body>
</html>