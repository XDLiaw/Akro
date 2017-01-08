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
        selector: 'textArea[name="news.content"]',
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
<script>
$(document).ready(function() {
	addSearchConditionHiddenToForm();
	$("#btn-back").click(function(){				
		$("#form-backToIndex").submit();
	});
	
	addMore();
	fileBrowseSetting();
});
</script>
<script>
	function addSearchConditionHiddenToForm() {
		$("#form-backToIndex input[type=hidden]").each(function(index){
			$("#form-update").append($(this).clone());
		});
	}
</script>
<script>
	function addMore() {	
		$("input[type=button].btn-addMoreAttach").click(function(){
			var newTr = $(this).parents("table").find("tr.hidden-sample-tr").clone();
			newTr.removeClass("hidden-sample-tr");
			$(this).parents("table").find("tbody").append(newTr);
			fileBrowseSetting();
			resetNameAttrForAttachTable();
		});
	}
</script>
<script>
	function fileBrowseSetting() {
		$(".btn-fake-browse").click(function(){
			$(this).parents("tr").find("input[type=file]").trigger("click");
		});
		
		$("input[type=file]").change(function() {
			var fileName = $(this).get(0).files[0].name;
			$(this).parents("tr").find(".label-fileName").html(fileName);
			readURL(this);
		});
		
		$("input[type=button].cancelSelectFile").click(function(){
			var rowCount = $(this).parents("tbody").find("tr").length;
			$(this).parents("tr").remove();
			resetNameAttrForAttachTable();
		});
	}
</script>
<script>
function resetNameAttrForAttachTable() {
	$("#table-attach > tbody > tr").each(function( index ){
		var tr = $("#table-attach > tbody > tr").eq(index);

		tr.find(".id").attr("name", "news.attachs["+index+"].id");;
		tr.find(".upload").attr("name", "news.attachs["+index+"].upload");
		tr.find(".fileType").attr("name", "news.attachs["+index+"].fileType");
		tr.find(".fileTitle").attr("name", "news.attachs["+index+"].fileTitle");
	});
}
</script>
<script>
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.readAsDataURL(input.files[0]);
	    }
	}
</script>
<style>
/* table.table-files tr, th, td { border: solid 1px; } */
/* table.table-files td li { margin-bottom: 1px; } */
table.table-files input[type=file] { display:none; }
table.table-files tr.hidden-sample-tr { display:none; }
table.table-files .label-fileName { min-height:35px; padding: 0px 5px; }
</style>
</head>
<body>
	<s:form action="updateSubmit" method="post" validate="true" id="form-update" enctype="multipart/form-data">
		<s:hidden name="news.id"/>
		<s:hidden name="news.isValid"/>
		<s:hidden name="news.createTime"/>
		<s:hidden name="news.createUser"/>
		<s:hidden name="news.updateTime"/>
		<s:hidden name="news.updateUser"/>
		<s:hidden name="news.ver"/>
		<ul>						
			<li class="all">
				<b>標題</b>
				<s:textfield name="news.title" maxlength="200"/>
			</li>
			<li class="half">
				<b>來源</b>
				<s:textfield name="news.source" maxlength="200"/>
			</li>
			<li class="half">
				<b>分類</b>
				<s:select name="news.category" list="categoryList" listKey="code" listValue="name" />
			</li>
			<li class="all">
				<b>內容</b>
				<s:textarea name="news.content" />
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
						<s:file type="file" class="upload" />
						<input type="button" class="btn-func btn-view btn-fake-browse" value="選擇檔案"/>
						<input type="button" class="btn-func btn-del cancelSelectFile" value="刪除" />

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
				<s:iterator value="news.attachs" status="stat">
					<tr>
						<s:hidden class="id" name="%{'news.attachs['+#stat.index+'].id'}"/>
						
						<td>
							<s:file type="file" name="%{'news.attachs['+#stat.index+'].upload'}" class="upload" />
							<input type="button" class="btn-func btn-view btn-fake-browse" value="選擇檔案"/>
							<input type="button" class="btn-func btn-del cancelSelectFile" value="刪除" />
							
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
							<s:select class="fileType" name="%{'news.attachs['+#stat.index+'].fileType'}" list="fileTypeList" listKey="code" listValue="name"/>
						</td>
						<td>						
							<s:textfield class="fileTitle" name="%{'news.attachs['+#stat.index+'].fileTitle'}" placeholder="檔案標題"/>
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
				<s:textfield name="news.metaTitle" maxlength="200"/>
			</li>
			<li class="all">
				<b>Meta Description</b>
				<s:textfield name="news.metaDes" />
			</li>
			<li class="all">
				<b>Meta KeyWord</b>
				<s:textfield name="news.metaKeyword" />
			</li>
		</ul>
		<div class="clear"></div>
		
		<h2>狀態設定區</h2>
		<ul class="common-linkiac-fields">
			<li class="quarter">
				<b>瀏覽次數</b>
				<s:textfield name="news.clickNum" type="number" min="0"/>
			</li>
			<li class="quarter">
				<b>排序(數字愈大排愈前面)</b>
				<s:textfield name="news.sort" type="number"/>
			</li>
			<li class="quarter">
				<b>顯示狀態</b>
				<s:radio name="news.displayStatus" list="#{'true':'開啟', 'false':'關閉'}" class="horizontalList"/>
			</li>
			<li class="quarter">
				<b>首頁顯示</b>
				<s:radio name="news.homeDisplayStatus" list="#{'true':'開啟', 'false':'關閉'}" class="horizontalList"/>
			</li>			
		</ul>		
		<div class="clear"></div>
		
		<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
			<s:submit cssClass="redBtn" value="儲存" />
			<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>
		</div>		
	</s:form>
	
	<s:include value="./form-backToIndex.jsp" />
</body>
</html>