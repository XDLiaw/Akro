<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<s:url value="/scripts/coopEx/addFileSetting.js"/>"></script>
<script>
	$(document).ready(function() {
	});
</script>
<style>
table.table-files tr, th, td { border: solid 1px; }
table.table-files td li { margin-bottom: 1px; }
table.table-files input[type=file] { display:none; }
table.table-files tr.hidden-sample-tr { display:none; }
</style>
<meta name="funcPathText" content="新增"/>
</head>
<body>
	<s:form action="createSubmit" method="post" validate="true" enctype="multipart/form-data">
		<ul>
			<li class="half">
				<b>年度</b>
				<s:select name="coopEx.year" list="#{'2014':'2014', '2015':'2015', '2016':'2016', '2017':'2017' }" />
			</li>
			<li class="half">
				<b>類別</b>
				<s:select name="coopEx.type" list="typeList" listKey="code" listValue="name" />
			</li>
			<li class="all">
				<b>標題</b>
				<s:textfield name="coopEx.title" />
			</li>			
			<li class="all">
				<b>案名</b>
				<s:textfield name="coopEx.projName" />
			</li>
			<li class="all">
				<b>研發團隊</b>
				<s:textfield name="coopEx.rdTeam" />
			</li>
			<li class="all">
				<b>輔導團隊</b>
				<s:textfield name="coopEx.assisTeam" />
			</li>			
			<li class="all">
				<b>內容</b>
				<s:textarea name="coopEx.content" rows="10"/>
			</li>				
		</ul>
		
		<!-- 照片 -->
		<table id="table-img" class="table-files">
			<thead>
				<tr>
					<td colspan="2">
						<input type="button" value="+ 增加照片" class="btn-addMoreImg redBtn"/>
					</td>			
				</tr>
				<tr class="hidden-sample-tr">
					<td width="15%">
						<img src="" style="max-width:120px; max-height:120px;" />
					</td>
					<td>
						<ul>
							<li>
								<s:file type="file" class="upload" accept=".jpg, .jpeg, .png, .gif" onchange="fileOnChange(this)"/>
								<input type="button" class="btn-func btn-view btn-fake-browse" value="選擇檔案" onclick="fakeBrowseBtnClick(this)"/>
								<input type="button" class="btn-func btn-del cancelSelectFile" value="刪除" onclick="deletedeleteFileBtnClick(this)"/>
							</li>
							<li>
								<label class="label-fileName">
									<span style="color:#AA3333;">(尚未選取檔案)</span>
								</label>
							</li>
							<li class="all">
								<s:textarea class="fileDesc" placeholder="請輸入檔案說明。(若沒有選擇任何檔案，則在此輸入的說明將不會被記錄)"/>
							</li>
						</ul>
					</td>
				</tr>				
			</thead>
			<tbody>
			</tbody>
		</table>
		
		<!-- 影片 -->
		<table id="table-video" class="table-files">
			<thead>
				<tr>
					<td colspan="2">
						<input type="button" value="+ 增加影片" class="btn-addMoreVideo redBtn"/>
					</td>			
				</tr>
				<tr class="hidden-sample-tr">
					<td width="15%">
						<video 
							controls="controls" preload="none"
							style="max-width:120px; max-height:120px;">
						</video>
					</td>
					<td>
						<ul>
							<li>
								<s:file type="file" class="upload" accept=".mp4" onchange="fileOnChange(this)"/>
								<input type="button" class="btn-func btn-view btn-fake-browse" value="選擇檔案" onclick="fakeBrowseBtnClick(this)"/>
								<input type="button" class="btn-func btn-del cancelSelectFile" value="刪除" onclick="deletedeleteFileBtnClick(this)"/>
							</li>
							<li>
								<label class="label-fileName">
									<span style="color:#AA3333;">(尚未選取檔案)</span>
								</label>
							</li>
							<li class="all">
								<s:textarea class="fileDesc" placeholder="請輸入檔案說明。(若沒有選擇任何檔案，則在此輸入的說明將不會被記錄)"/>
							</li>
						</ul>
					</td>
				</tr>				
			</thead>
			<tbody>
			</tbody>
		</table>
		
		<!-- 附檔 -->
		<table id="table-attach" class="table-files">
			<thead>
				<tr>
					<td>
						<input type="button" value="+ 增加附檔" class="btn-addMoreAttach redBtn"/>
					</td>			
				</tr>
				<tr class="hidden-sample-tr">
					<td>
						<ul>
							<li>
								<s:file type="file" class="upload" onchange="fileOnChange(this)"/>
								<input type="button" class="btn-func btn-view btn-fake-browse" value="選擇檔案" onclick="fakeBrowseBtnClick(this)"/>
								<input type="button" class="btn-func btn-del cancelSelectFile" value="刪除" onclick="deletedeleteFileBtnClick(this)"/>
							</li>
							<li>
								<label class="label-fileName">
									<span style="color:#AA3333;">(尚未選取檔案)</span>
								</label>
							</li>
							<li class="all">
								<s:textarea class="fileDesc" placeholder="請輸入檔案說明。(若沒有選擇任何檔案，則在此輸入的說明將不會被記錄)"/>
							</li>
						</ul>
					</td>
				</tr>				
			</thead>
			<tbody>
			</tbody>
		</table>
		
		<div class="clear"></div>
		<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
			<s:submit cssClass="redBtn" value="送出" />	
		</div>		
	</s:form>	
</body>
</html>