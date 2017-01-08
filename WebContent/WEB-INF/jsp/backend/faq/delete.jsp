<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<s:url value="/scripts/tinymce/tinymce.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/scripts/tinymce/jquery.tinymce.min.js"/>"></script>
<script>
    //網頁編輯器設定
    tinymce.init({
        selector: 'textArea[name="faq.content"]',
        plugins: [
          'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
          'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
          'save table contextmenu directionality emoticons template paste textcolor'
        ],
        readonly : 1,
        content_css: 'css/content.css',
        menubar: '',
        toolbar: [],
        height: 400,
    });
</script>
<script>
	$(document).ready(function(){
		addSearchConditionHiddenToForm();
		$("#btn-back").click(function(){				
			$("#form-backToIndex").submit();
		});
	});
</script>
<script>
	function addSearchConditionHiddenToForm() {
		$("#form-backToIndex input[type=hidden]").each(function(index){
			$("#form-delete").append($(this).clone());
		});
	}
</script>
<style>
textarea[disabled] { width:100%; resize:none; border:none; background-color:#ffffff; color:#000000;}
</style>
<meta name="funcPathText" content="編輯管理  > 刪除"/>
</head>
<body>
	<s:form action="deleteSubmit" method="post" validate="true" id="form-delete">
		<s:hidden name="id" />
		<ul>						
			<li class="all">
				<b>標題</b>
				<div class="border-text">
					<s:property value="faq.title"/>
				</div>
			</li>
			<li class="half">
				<b>來源</b>
				<div class="border-text">
					<s:property value="faq.source"/>
				</div>
			</li>
			<li class="half">
				<b>分類</b>
				<div class="border-text">
					<s:property value="faq.category"/>
				</div>
			</li>
			<li class="all">
				<b>內容</b>
				<s:textarea name="faq.content"/>	
			</li>		
		</ul>
		<div class="clear"></div>
			
		<h2>SEO區(網站優化加註，幫助訊息更易搜尋到)</h2>
		<ul class="common-meta-fields">
			<li class="all">
				<b>Meta Title</b>
				<div class="border-text">
					<s:property value="faq.metaTitle"/>
				</div>				
			</li>
			<li class="all">
				<b>Meta Description</b>
				<div class="border-text">
					<s:property value="faq.metaDes"/>
				</div>				
			</li>
			<li class="all">
				<b>Meta KeyWord</b>
				<div class="border-text">
					<s:property value="faq.metaKeyword"/>
				</div>				
			</li>
		</ul>
		<div class="clear"></div>
		
		<h2>狀態設定區</h2>
		<ul class="common-linkiac-fields">
			<li class="quarter">
				<b>瀏覽次數</b>
				<div class="border-text">
					<s:property value="faq.clickNum"/>
				</div>				
			</li>
			<li class="quarter">
				<b>排序(數字愈大排愈前面)</b>
				<div class="border-text">
					<s:property value="faq.sort"/>
				</div>				
			</li>
			<li class="quarter">
				<b>顯示狀態</b>
				<s:radio name="faq.displayStatus" list="#{'true':'開啟', 'false':'關閉'}" class="horizontalList" disabled="true"/>
			</li>
			<li class="quarter">
				<b>首頁顯示</b>
				<s:radio name="faq.homeDisplayStatus" list="#{'true':'開啟', 'false':'關閉'}" class="horizontalList" disabled="true"/>
			</li>			
		</ul>		
		<div class="clear"></div>	
		
		<div class="bottom-btn-block">
			<s:submit cssClass="btn btn-info redBtn" value="確定" />
			<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>
		</div>
	</s:form>
				
	<s:include value="./form-backToIndex.jsp" />
</body>
</html>