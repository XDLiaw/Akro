<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>

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
			$("#form-update").append($(this).clone());
		});
	}
</script>
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#patent_img').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<meta name="funcPathText" content="編輯管理  > 編輯"/>
</head>
<body>
<!-- 	<h2 class="itemTitle">編輯</h2> -->

	<s:form action="updateSubmit" method="post" validate="true" enctype="multipart/form-data" id="form-update">
		<s:hidden name="patent.id" />
		<s:hidden name="patent.isValid" />
		<s:hidden name="patent.createTime" />
		<s:hidden name="patent.createUser" />
		<s:hidden name="patent.updateTime" />
		<s:hidden name="patent.updateUser" />
		<s:hidden name="patent.ver" />
		
		<ul>
			<li class="all">
				<b>專利名稱</b>
				<s:textfield name="patent.name" cssClass="form-control" />
			</li>
			<li class="all">
				<b>專利權人</b>
				<s:textfield name="patent.assignee" cssClass="form-control"  />
			</li>	
			<li class="all">
				<b>發明人</b>
				<s:textfield name="patent.invertor" cssClass="form-control" />
			</li>
			<li class="quarter">
				<b>國際分類號</b>
				<s:textfield name="patent.ipc" cssClass="form-control" />
			</li>			
			<li class="quarter">
				<b>申請國別</b>
				<s:select name="patent.country.code" list="optionCountryList" listKey="code" listValue="%{code +' ' +name}" />
			</li>
			<li class="quarter">
				<b>申請號</b>
				<s:textfield name="patent.appliactionNo" cssClass="form-control" />
			</li>
			<li class="quarter">
				<b>申請日</b>
				<s:textfield name="patent.applicationDate" cssClass="form-control calendarBox" autocomplete="off">			
					<s:param name="value">
						<s:date name="patent.applicationDate" format="yyyy/MM/dd" /> 
					</s:param>
				</s:textfield>
			</li>
			<li class="quarter">
				<b>公開號</b>
				<s:textfield name="patent.openNo" cssClass="form-control" />
			</li>						
			<li class="quarter">
				<b>公開日</b>
				<s:textfield name="patent.openDate" cssClass="form-control calendarBox" autocomplete="off">
					<s:param name="value">
						<s:date name="patent.openDate" format="yyyy/MM/dd" /> 
					</s:param>				
				</s:textfield>
			</li>						
			<li class="quarter">
				<b>公告號</b>
				<s:textfield name="patent.publicationNo" cssClass="form-control" />
			</li>						
			<li class="quarter">
				<b>公告日</b>
				<s:textfield name="patent.publicationDate" cssClass="form-control calendarBox" autocomplete="off">
					<s:param name="value">
						<s:date name="patent.publicationDate" format="yyyy/MM/dd" /> 
					</s:param>			
				</s:textfield>
			</li>
			<li class="quarter">
				<b>專利類別</b>
				<s:textfield name="patent.category" cssClass="form-control" />
			</li>
			<li class="quarter">
				<b>專利狀態</b>
				<s:textfield name="patent.patentStatus" cssClass="form-control" />
			</li>			
			<li class="half">
				<b>專利家族</b>
				<s:textfield name="patent.familyNo" cssClass="form-control" />
			</li>
			<li class="all">
				<b>專利技術摘要</b>
				<s:textarea name="patent.techAbstract" cssClass="form-control" rows="10"/>
			</li>
			<li class="all">
				<b>重要圖式</b>
				<div>
					<a href="<s:url value="%{patent.patentPictureLink}"/>" target="_blank">
						<img id="patent_img" src="data:image;base64,<s:property value="patent.base64PatentPicture"/>" style="max-width:400px; max-height:400px;">
					</a>
					<br>
					<input type="button" value="上傳圖檔" class="btn blueBtn" onclick="$('.upload').trigger('click')"/>
					<input class="upload" name="uploadPatentImg" type="file" onchange="readURL(this);" style="display:none;">
				</div>
			</li>
			<li class="half">
				<b>專利技術領域</b>
				<s:select name="patent.techField.name" list="techFieldList" listKey="name" listValue="name" />
			</li>
			<li class="half">
				<b>應用範圍/產業</b>
				<s:textfield name="patent.usage" cssClass="form-control" />
			</li>									
			<li class="all">
				<b>技術發展階段</b>
				<s:select name="patent.trl.code" list="optionTrlList" listKey="code" listValue="%{code +' ' +name}" headerKey="" headerValue="" />
			</li>									
			<li class="all">
				<b>技術發展階段說明</b>
				<s:textarea name="patent.trlDesc" cssClass="form-control" rows="10"/>
			</li>
		</ul>
		<div class="clear"></div>
		<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
			<s:submit cssClass="redBtn" value="儲存" />
			<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>
		</div>
	</s:form>
	<form action="index" method="post" id="form-backToIndex">
		<s:hidden name="searchCondition.name"/>
		<s:hidden name="searchCondition.appliactionNo"/>
		<s:hidden name="searchCondition.countryCode"/>
		<s:hidden name="searchCondition.techFieldId"/>
		<s:hidden name="searchCondition.pageIndex"/>
		<s:hidden name="searchCondition.pageSize"/>
	</form>	
</body>
</html>