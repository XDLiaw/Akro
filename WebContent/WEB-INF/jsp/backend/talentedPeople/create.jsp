<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function() {
		fileBrowseSetting();
	});
</script>
<script>
	function fileBrowseSetting() {
		$(".btn-fake-browse").click(function(){
			$(this).parents(".headShot").find("input[type=file]").trigger("click");
		});
		
		$("input[type=file]").change(function() {
			readURL(this); // display subnail
		});
		
		$("input[type=button].cancelSelectFile").click(function(){
			$(this).parents(".headShot").find("input[type=file]").val("");
			$(this).parents(".headShot").find("img").attr('src', '');
		});
	}
</script>
<script>
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	        	$(input).parents(".headShot").find("img").attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}
</script>
<style>
table.table-talentedPeopleInfo { margin-bottom:15px; }
table.table-talentedPeopleInfo tr:hover { background:none; }
table.table-talentedPeopleInfo td { border:none; }
table.table-talentedPeopleInfo td.headShot { width:20%; border:#e6eff5 1px solid }
input[type=file][name="talentedPeople.uploadheadShot"] { display:none }

table#table-domain { margin:0px; }
</style>
<meta name="funcPathText" content="新增"/>
</head>
<body>
	<s:form action="createSubmit" method="post" validate="true" enctype="multipart/form-data">
		<table class="table-talentedPeopleInfo">
			<tr>
				<td><b style="font-size:20px; font-weight:bold;">基本資料</b></td>
				<td><b style="font-size:20px; font-weight:bold;">照片</b></td>
			</tr>		
			<tr>
				<td>
					<ul>
						<li class="quarter">
							<b>姓名(中)</b>
							<s:textfield name="talentedPeople.nameCh" maxlength="100"/>
						</li>
						<li class="quarter">
							<b>姓名(英)</b>
							<s:textfield name="talentedPeople.nameEn" maxlength="100"/>
						</li>
						<li class="quarter">
							<b>性別</b>
							<s:select name="talentedPeople.gender" list="#{ '男':'男', '女':'女' }"/>
						</li>
						<li class="quarter">
							<b>產學經驗(年)</b>
							<s:textfield name="talentedPeople.expYear"/>
						</li>
						<li class="half">
							<b>連絡電話</b>
							<s:textfield name="talentedPeople.tel" maxlength="20"/>
						</li>
						<li class="half">
							<b>e-mail</b>
							<s:textfield name="talentedPeople.email" maxlength="100"/>
						</li>
						<li class="half">
							<b>現職單位</b>
							<s:textfield name="talentedPeople.workOrg" maxlength="100"/>
						</li>
						<li class="half">
							<b>現職職位</b>
							<s:textfield name="talentedPeople.job" maxlength="100"/>
						</li>
						<li class="all">
							<b>網站連結</b>
							<s:textfield name="talentedPeople.url" maxlength="1000"/>
						</li>						
					</ul>					
				</td>
				<td class="headShot text-align-center">
					<img src="" style="max-width:150px; max-height:200px;" />
					<s:file type="file" name="talentedPeople.uploadheadShot" class="upload" accept=".jpg, .jpeg, .png, .gif" />
					<input type="button" class="btn-func btn-view btn-fake-browse" value="選擇檔案"/>
					<input type="button" class="btn-func btn-del cancelSelectFile" value="刪除" />
				</td>				
			</tr>
		</table>
	
		<ul>
			<li class="all">
				<b>領域</b>
				<table id="table-domain">
					<s:iterator value="mainDomainList" status="stat">
						<tr>
							<td>
								<span style="font-weight:bold;"><s:property value="name"/></span>
								<div class="horizontalList">
									<s:iterator value="subDomainList" status="stat2">
										<div class="checkbox">
											<input type="checkbox" 
												name="talentedPeople.domainsId" 
												id="<s:property value="%{'chkbox_'+id}" />"
												value="<s:property value="%{id}" />"
												<s:property value="%{talentedPeople.domainsId.contains(id) ? 'checked' : ''}"/>
											/>										
											<label for="<s:property value="%{'chkbox_'+id}" />">
												<s:property value="name"/>
											</label>
										</div>
									</s:iterator>
								</div>
							<td>
						<tr>
					</s:iterator>
				</table>				
			</li>
			<li class="all">
				<b>合作專長</b>
				<s:textfield name="talentedPeople.specialty" maxlength="1000"/>
			</li>
		</ul>
		
		<div class="clear"></div>
		<div class="bottom-btn-block">
			<s:submit cssClass="redBtn" value="送出" />	
		</div>		
	</s:form>	
</body>
</html>