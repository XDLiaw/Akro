<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta name="funcPathText" content="編輯管理  > 編輯"/>

<script type="text/javascript" src="<s:url value="/scripts/tinymce/tinymce.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/scripts/tinymce/jquery.tinymce.min.js"/>"></script>
<script>
    //網頁編輯器設定
    tinymce.init({
        selector: 'textArea[name="activity.content"]',
        plugins: [
          'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
          'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
          'save table contextmenu directionality emoticons template paste textcolor'
        ],
        content_css: 'css/content.css',
        menubar: 'file edit view format tools table',
        toolbar: [
            'code | undo redo | cut copy paste | bold italic underline strikethrough | styleselect formatselect fontselect fontsizeselect  ',
            'bullist numlist outdent indent | alignleft aligncenter alignright alignjustify | link searchreplace table | forecolor backcolor'
        ],
        height: 400,
    });
</script>
<script type="text/javascript" src="<s:url value="/scripts/activity/attachTableSetting.js"/>"></script>
<script type="text/javascript" src="<s:url value="/scripts/activity/videoTableSetting.js"/>"></script>
<script>
$(document).ready(function() {
	addSearchConditionHiddenToForm();
	$("#btn-back").click(function(){				
		$("#form-backToIndex").submit();
	});
});
</script>
<script>
	function addSearchConditionHiddenToForm() {
		$("#form-backToIndex input[type=hidden]").each(function(index){
			$("#form-update").append($(this).clone());
		});
	}
</script>
<style>
table.table-files input[type=file] { display:none; }
tr.hidden-sample-tr { display:none; }
</style>
</head>
<body>
	<s:form action="updateSubmit" method="post" validate="true" id="form-update" enctype="multipart/form-data">
		<s:hidden name="activity.id"/>
		<s:hidden name="activity.isValid"/>
		<s:hidden name="activity.createTime"/>
		<s:hidden name="activity.createUser"/>
		<s:hidden name="activity.updateTime"/>
		<s:hidden name="activity.updateUser"/>
		<s:hidden name="activity.ver"/>

		<ul>						
			<li class="all">
				<b>標題</b>
				<s:textfield name="activity.title" maxlength="200"/>
			</li>
			<li class="all">
				<b>來源</b>
				<s:textfield name="activity.source" maxlength="200"/>
			</li>
			<li class="half">
				<b>分類</b>
				<s:select name="activity.category" list="categoryList" listKey="code" listValue="name" />
			</li>
			<li class="half">
				<b>活動日期</b>
				<s:textfield name="activity.actDate" maxlength="200"/>			
			</li>
			<li class="all">
				<b>活動地點</b>
				<s:textfield name="activity.actAddress" maxlength="200"/>
			</li>			
			<li class="all">
				<b>主辦單位</b>
				<s:textfield name="activity.organizer" maxlength="200"/>
			</li>
			<li class="all">
				<b>指導單位</b>
				<s:textfield name="activity.advisor" maxlength="200"/>
			</li>			
			<li class="all">
				<b>聯絡窗口</b>
				<s:textfield name="activity.contact" maxlength="200"/>
			</li>
			<li class="half">
				<b>報名人數</b>
				<s:textfield name="activity.signUpNum" maxlength="200"/>
			</li>
			<li class="half">
				<b>報名起迄</b>
				<s:textfield name="activity.signUpPeriod" maxlength="200"/>			
			</li>
			<li class="all">
				<b>報名網址</b>
				<s:textfield name="activity.signUpLink" maxlength="200"/>
			</li>			
			<li class="all">
				<b>內容</b>
				<s:textarea name="activity.content" />
			</li>		
		</ul>
		
		<!-- 附檔 -->
		<table id="table-attach" class="table-files">
			<thead>
				<tr>
					<td colspan="3">
						<input type="button" value="+ 增加附檔" class="btn-addMoreAttach redBtn"/>
					</td>
				</tr>
				<tr class="hidden-sample-tr">
					<td>
						<s:file type="file" class="upload" onchange="fileOnchange(this)"/>
						<input type="button" class="btn-func btn-view btn-fake-browse" value="選擇檔案" onclick="fakeBrowseBtnOnclick(this)"/>
						<input type="button" class="btn-func btn-del cancelSelectFile" value="刪除" onclick="deleteFileBtnOnclick(this)"/>

						<label class="label-fileName">
							<span style="color:#AA3333;">(尚未選取檔案)</span>
						</label>
					</td>
					<td>
						<s:select class="fileType" list="fileTypeList" listKey="code" listValue="name"/>
					</td>
					<td>						
						<s:textfield class="fileTitle" placeholder="檔案標題"/>
					</td>
				</tr>				
			</thead>
			<tbody>
				<s:iterator value="activity.attachList" status="stat">
					<tr>
						<s:hidden class="id" name="%{'activity.attachList['+#stat.index+'].id'}"/>
						
						<td>
							<s:file type="file" name="%{'activity.attachList['+#stat.index+'].upload'}" class="upload" onchange="fileOnchange(this)"/>
							<input type="button" class="btn-func btn-view btn-fake-browse" value="選擇檔案" onclick="fakeBrowseBtnOnclick(this)"/>
							<input type="button" class="btn-func btn-del cancelSelectFile" value="刪除" onclick="deleteFileBtnOnclick(this)"/>
							
							<label class="label-fileName">
								<s:url value="downloadAttach.action" var="downloadAttachUrl">
									<s:param name="attachFileId" value="id" />
								</s:url>
								<a href="<s:property value="downloadAttachUrl" />" >
									<s:property value="uploadFileName"/>
								</a>
							</label>
						</td>
						<td>
							<s:select class="fileType" name="%{'activity.attachList['+#stat.index+'].fileType'}" list="fileTypeList" listKey="code" listValue="name"/>
						</td>
						<td>						
							<s:textfield class="fileTitle" name="%{'activity.attachList['+#stat.index+'].fileTitle'}" placeholder="檔案標題"/>
						</td>						
					</tr>
				</s:iterator>
			</tbody>
		</table>
		
		<!-- 影片 -->
		<input type="button" value="+ 增加影片" id="btn-addMoreVideo" class="redBtn"/>
		<table id="table-video" class="">
			<thead>
				<tr>
					<th width="3%">No.</th>
					<th>活動影片名稱</th>
					<th>影片</th>
					<th>瀏覽次數</th>
					<th></th>
				</tr>
				<tr class="hidden-sample-tr">
					<s:hidden class="id" value="0"/>
					<s:hidden class="isValid"/>
					<s:hidden class="createTime"/>
					<s:hidden class="createUser"/>
					<s:hidden class="updateTime"/>
					<s:hidden class="updateUser"/>
					<s:hidden class="ver"/>
					<s:hidden class="sort"/>
					<s:hidden class="displayStatus"/>
					<s:hidden class="clickNum"/>
					<s:hidden class="title"/>
					<s:hidden class="videoUrl"/>
					<s:hidden class="videoDesc"/>
					
					<td class="td-No"></td>
					<td class="td-title"></td>
					<td class="td-videoUrl"></td>
					<td class="td-clickNum"></td>
					<td>
						<input type="button" class="btn-func btn-edit" value="編輯" />
						<input type="button" class="btn-func btn-del" value="刪除" />	
					</td>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="activity.videoList" status="stat">
					<tr>
						<s:hidden class="id" name="%{'activity.videoList['+#stat.index+'].id'}"/>
						<s:hidden class="isValid" name="%{'activity.videoList['+#stat.index+'].isValid'}"/>
						<s:hidden class="createTime" name="%{'activity.videoList['+#stat.index+'].createTime'}"/>
						<s:hidden class="createUser" name="%{'activity.videoList['+#stat.index+'].createUser'}"/>
						<s:hidden class="updateTime" name="%{'activity.videoList['+#stat.index+'].updateTime'}"/>
						<s:hidden class="updateUser" name="%{'activity.videoList['+#stat.index+'].updateUser'}"/>
						<s:hidden class="ver" name="%{'activity.videoList['+#stat.index+'].ver'}"/>
						<s:hidden class="sort" name="%{'activity.videoList['+#stat.index+'].sort'}"/>
						<s:hidden class="displayStatus" name="%{'activity.videoList['+#stat.index+'].displayStatus'}"/>
						<s:hidden class="clickNum" name="%{'activity.videoList['+#stat.index+'].clickNum'}"/>
						<s:hidden class="title" name="%{'activity.videoList['+#stat.index+'].title'}"/>
						<s:hidden class="videoUrl" name="%{'activity.videoList['+#stat.index+'].videoUrl'}"/>
						<s:hidden class="videoDesc" name="%{'activity.videoList['+#stat.index+'].videoDesc'}"/>
						
						<td class="td-No"><s:property value="%{#stat.index+1}" /></td>
						<td class="td-title"><s:property value="title"/></td>
						<td class="td-videoUrl"><s:property value="videoUrl" escapeHtml="false"/></td>
						<td class="td-clickNum"><s:property value="clickNum"/></td>
						<td>
							<input type="button" class="btn-func btn-edit" value="編輯" />
							<input type="button" class="btn-func btn-del" value="刪除" />	
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<div class="clear"></div>
			
		<h2>SEO區(網站優化加註，幫助訊息更易搜尋到)</h2>
		<ul class="common-meta-fields">
			<li class="all">
				<b>Meta Title</b>
				<s:textfield name="activity.metaTitle" maxlength="200"/>
			</li>
			<li class="all">
				<b>Meta Description</b>
				<s:textfield name="activity.metaDes" />
			</li>
			<li class="all">
				<b>Meta KeyWord</b>
				<s:textfield name="activity.metaKeyword" />
			</li>
		</ul>
		<div class="clear"></div>
		
		<h2>狀態設定區</h2>
		<ul class="common-linkiac-fields">
			<li class="quarter">
				<b>瀏覽次數</b>
				<s:textfield name="activity.clickNum" type="number" min="0"/>
			</li>
			<li class="quarter">
				<b>排序(數字愈大排愈前面)</b>
				<s:textfield name="activity.sort" type="number"/>
			</li>
			<li class="quarter">
				<b>顯示狀態</b>
				<s:radio name="activity.displayStatus" list="#{'true':'開啟', 'false':'關閉'}" class="horizontalList"/>
			</li>
			<li class="quarter">
				<b>首頁顯示</b>
				<s:radio name="activity.homeDisplayStatus" list="#{'true':'開啟', 'false':'關閉'}" class="horizontalList"/>
			</li>			
		</ul>		
		<div class="clear"></div>
		
		<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
			<s:submit cssClass="redBtn" value="儲存" />
			<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>
		</div>		
	</s:form>
	
<!-- ======================================================================= -->
	
	<form id="activityVideoForm">
		<div class="subForm">
			<s:hidden class="videoRowIndex"/>
			<h2 class="itemTitle">活動影片</h2>
			<ul>
				<li class="all">
					<b>活動影片名稱</b>
					<input type="text" class="title" maxlength="200"/>
				</li>
				<li class="all">
					<b>活動影片(備註：視頻處可嵌入相關音影語法)</b>
					<textarea class="videoUrl" maxlength="500">
					
					</textarea>
				</li>
				<li class="all">
					<b>活動影片說明</b>
					<textarea class="videoDesc"></textarea>
				</li>
				<li class="third">
					<b>瀏覽次數</b>
					<input type="number" class="clickNum" min="0"/>
				</li>
				<li class="third">
					<b>排序(數字愈大排愈前面)</b>
					<input type="number" class="sort"/>
				</li>
				<li class="third">
					<b>顯示狀態</b>
					<s:select list="#{'true':'開啟', 'false':'關閉'}" class="displayStatus"/>
				</li>
			</ul>
			
			<div class="clear"></div>
			<div class="">
				<input type="button" class="redBtn btn-addConfirm" value="確定新增"/>
				<input type="button" class="redBtn btn-editConfirm" value="確定變更"/>
				<input type="button" class="grayBtn btn-cancel" value="取消"/>
			</div>
		</div>	
	</form>
	
<!-- ======================================================================= -->
	
	
	<s:include value="./form-backToIndex.jsp" />
</body>
</html>