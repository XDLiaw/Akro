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
        selector: 'textArea[name="emailContentTemplate"]',
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
<script type="text/javascript">
	$(document).ready(function() {
		$("input[type=file]#btn_file").change(function() {
			$("input[type=text]#file_display").val($(this).val());
		});
	});
</script>
</head>
<body>
	<s:if test="errMsgs != null && errMsgs.size() > 0">
		<table>
			<tr><th>錯誤訊息列表</th></tr>
			<s:iterator value="errMsgs" status="stat">
				<tr><td><s:property/></td></tr>
			</s:iterator>
		</table>
	</s:if>	
	
	<s:form action="sendEmailSubmit" method="post" validate="true" enctype="multipart/form-data" id="form-batchImport">
		<ul>
			<li class="all">
				<b>收件者列表檔案*</b>
				<s:file name="uploadFile" accept=".xlsx"/>
				<span style="font-size:0.7em;">P.S. 第一欄必須為收件者Email(欲於同一列寄送給多個對象，請在email之間用分號隔開，但勿含有空白)</span><br>
				<span style="font-size:0.7em;">P.S. 後面欄位為要用來替換模板參數的資料</span>
			</li>
			<li class="half">
				<b>發件人姓名</b>
				<s:textfield name="emailSenderName"/>
			</li>			
			<li class="half">
				<b>發件人Email*</b>
				<s:textfield name="emailFrom"/>
			</li>
			<li class="all">
				<b>信件主旨*</b>
				<s:textfield name="emailSubject"/>
			</li>				
			<li class="all">
				<b>信件內文模板*</b><br>
				<span style="font-size:0.7em;">P.S. 寄發信件時將會用匯入的收件者列表Excel檔的標題列當作關鍵字並以相對應資料替換內文模板中的參數</span><br>
				<span style="font-size:0.7em;">P.S. 參數請用%符號包夾，例如%Name%</span>
				<s:textarea name="emailContentTemplate"/>
			</li>			
			<li class="all">
				<b>附件</b>
				<s:file name="attaches" />
				<s:file name="attaches" />
				<s:file name="attaches" />
				<s:file name="attaches" />
				<s:file name="attaches" />
				<s:file name="attaches" />
				<s:file name="attaches" />
				<s:file name="attaches" />
				<s:file name="attaches" />
				<s:file name="attaches" />
			</li>
		</ul>
		
		<div class="clear"></div>
		<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
		<input type="submit" value="寄送郵件" class="btn btn-info redBtn" />
		<input type="button" value="清除" class="grayBtn" 
			onclick=" window.location.href = '<s:url value="/batchSendEmail/sendEmail"/>' " />
		</div>	
	</s:form>
</body>
</html>