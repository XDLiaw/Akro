<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<s:url value="/scripts/talentedPeople/headshotFuncSetting.js"/>"></script>
<script type="text/javascript" src="<s:url value="/scripts/talentedPeople/tableFuncSetting.js"/>"></script>
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
table.table-talentedPeopleInfo { margin-bottom:15px; }
table.table-talentedPeopleInfo tr:hover { background:none; }
table.table-talentedPeopleInfo td { border:none; }
table.table-talentedPeopleInfo td.headShot { width:20%; border:#e6eff5 1px solid; }
input[type=file][name="talentedPeople.uploadheadShot"] { display:none }

table#table-domain { margin:0px; }

tr.hidden-sample-tr { display:none; }
#table-rdResult li { margin-bottom:0px; }
#table-rdResult li select { padding: 7px 5px; font-size:0.76em; }
#table-transferCase td div { float:left; }
#table-mainProject td div { float:left; }
</style>
<meta name="funcPathText" content="編輯管理  > 編輯"/>
</head>
<body>
	<s:form action="selfUpdateSubmit" method="post" validate="true" enctype="multipart/form-data" id="form-update">
		<div>
			<s:hidden name="talentedPeople.id" />
			<s:hidden name="talentedPeople.isValid" />
			<s:hidden name="talentedPeople.createTime" />
			<s:hidden name="talentedPeople.createUser" />
			<s:hidden name="talentedPeople.updateTime" />
			<s:hidden name="talentedPeople.updateUser" />
			<s:hidden name="talentedPeople.ver" />
			<s:hidden name="talentedPeople.sysUser.id"/>
		</div>
		
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
							<s:textfield name="talentedPeople.expYear" maxlength="4"/>
						</li>
						<li class="half">
							<b>連絡電話</b>
							<label>
								<input type="checkbox" name="talentedPeople.isPublicTel" value="true" 
									<s:property value="%{talentedPeople.isPublicTel ? 'checked' : ''}"/> />公開
							</label>
							<s:textfield name="talentedPeople.tel" maxlength="20"/>
						</li>
						<li class="half">
							<b>e-mail</b>
							<label>
								<input type="checkbox" name="talentedPeople.isPublicEmail" value="true" 
									<s:property value="%{talentedPeople.isPublicEmail ? 'checked' : ''}"/> />公開
							</label>
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
					<s:hidden name="talentedPeople.base64HeadShot"/>
					<img src="data:image;base64,<s:property value="talentedPeople.base64HeadShot"/>" style="max-width:150px; max-height:200px;" />
					<s:file type="file" name="talentedPeople.uploadheadShot" class="upload" accept=".jpg, .jpeg, .png, .gif" />
					<input type="button" class="btn-func btn-view btn-fake-browse" value="選擇檔案"/>
					<input type="button" class="btn-func btn-del cancelSelectFile" value="刪除" />
				</td>				
			</tr>
		</table>

<!----------------------------------------------------------------------------->
	
		<ul>
			<li class="all">
				<b>領域(可複選)</b>
				
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
		
<!----------------------------------------------------------------------------->
		
		<b>重要研發成果(包含:專利,技術,IC佈局, 軟體…..)</b> 
		<input type="button" id="add-rdResult" value="+"/>
		<label>
			<input type="checkbox" name="talentedPeople.isPublicRdResult" value="true" 
				<s:property value="%{talentedPeople.isPublicRdResult ? 'checked' : ''}"/> />公開
		</label>
		<table id="table-rdResult">
			<thead>
				<tr>
					<th width="3%">No.</th>
					<th>研發成果名稱</th>
					<th>型式</th>
					<th>資料更新日期</th>
					<th width="16%"></th>
				</tr>
				<tr class="hidden-sample-tr">
					<s:hidden class="id" value="0"/>
					<s:hidden class="name" />
					<s:hidden class="type" />
					<s:hidden class="inventer" />
					<s:hidden class="owner" />
					<s:hidden class="patentNo" />
					<s:hidden class="country" />
					<s:hidden class="patentPeriodStart" />
					<s:hidden class="patentPeriodEnd" />
					<s:hidden class="patentAbstract" />
					<s:hidden class="usage" />
					<s:hidden class="updateDate" />
					<s:hidden class="priority" />

					<td class="td-No"></td>
					<td class="td-name"></td>
					<td class="td-type"></td>
					<td class="td-updateDate"></td>
					<td>
						<input type="button" class="btn-func btn-edit" value="編輯" />
						<input type="button" class="btn-func btn-del" value="刪除" />						
					</td>
				</tr>				
			</thead>
			<tbody>
				<s:iterator value="talentedPeople.rdResults" status="stat">
				<tr>
					<s:hidden class="id" value="%{id}"/>
					<s:hidden class="isValid" value="%{isValid}"/>
					<s:hidden class="createTime" value="%{createTime}"/>
					<s:hidden class="createUser" value="%{createUser}"/>
					<s:hidden class="updateTime" value="%{updateTime}"/>
					<s:hidden class="updateUser" value="%{updateUser}"/>
					<s:hidden class="ver" value="%{ver}"/>
					<s:hidden class="name" value="%{name}"/>
					<s:hidden class="type" value="%{type}"/>
					<s:hidden class="inventer" value="%{inventer}"/>
					<s:hidden class="owner" value="%{owner}"/>
					<s:hidden class="patentNo" value="%{patentNo}"/>
					<s:hidden class="country" value="%{optionCountry.id}"/>
					<s:hidden class="patentPeriodStart" value="%{patentPeriodStart}"/>
					<s:hidden class="patentPeriodEnd" value="%{patentPeriodEnd}"/>
					<s:hidden class="patentAbstract" value="%{patentAbstract}"/>
					<s:hidden class="usage" value="%{usage}"/>
					<s:hidden class="updateDate" value="%{updateDate}"/>
					<s:hidden class="priority" value="%{priority}"/>
				
					<td class="td-No">
						<s:property value="%{#stat.index+1}" />
					</td>
					<td class="td-name">
						<s:property value="name"/>
					</td>
					<td class="td-type">
						<s:property value="type"/>
					</td>
					<td class="td-updateDate">
						<s:property value="updateDate"/>
					</td>
					<td>
						<input type="button" class="btn-func btn-edit" value="編輯" />
						<input type="button" class="btn-func btn-del" value="刪除" />						
					</td>
				</tr>
				</s:iterator>
			</tbody>
		</table>

		<div class="clear"></div>

<!----------------------------------------------------------------------------->
		
		<b>成果移轉及授權案例</b>
		<input type="button" id="add-transferCases" value="+"/>
		<label>
			<input type="checkbox" name="talentedPeople.isPublicTransferCase" value="true" 
				<s:property value="%{talentedPeople.isPublicTransferCase ? 'checked' : ''}"/> />公開
		</label>
		<table id="table-transferCase">
			<thead>
				<tr>
					<th width="3%">No.</th>
					<th width="">應用領域</th>
					<th width="">對象廠商或機構</th>
					<th width="">時間(授權期間或讓受/技轉時間)</th>
					<th>資料更新日期</th>
					<th width="16%"></th>
				</tr>
				<tr class="hidden-sample-tr">
					<s:hidden class="id" value="0" />
					<s:hidden class="applyField" />
					<s:hidden class="targetOrg" />
					<s:hidden class="yearStart" />
					<s:hidden class="monthStart" />
					<s:hidden class="yearEnd" />
					<s:hidden class="monthEnd" />
					<s:hidden class="updateDate" />
					<s:hidden class="priority" />
					
					<td class="td-No">No.</td>
					<td class="td-applyField"></td>
					<td class="td-targetOrg"></td>
					<td class="td-time"></td>
					<td class="td-updateDate"></td>
					<td>
						<input type="button" class="btn-func btn-edit" value="編輯" />
						<input type="button" class="btn-func btn-del" value="刪除" />
					</td>					
				</tr>
			</thead>
			<tbody>
				<s:iterator value="talentedPeople.transferCases" status="stat">
				<tr>
					<s:hidden class="id" value="%{id}"/>
					<s:hidden class="isValid" value="%{isValid}"/>
					<s:hidden class="createTime" value="%{createTime}"/>
					<s:hidden class="createUser" value="%{createUser}"/>
					<s:hidden class="updateTime" value="%{updateTime}"/>
					<s:hidden class="updateUser" value="%{updateUser}"/>
					<s:hidden class="ver" value="%{ver}"/>
					<s:hidden class="applyField" value="%{applyField}"/>
					<s:hidden class="targetOrg" value="%{targetOrg}"/>
					<s:hidden class="yearStart" value="%{yearStart}"/>
					<s:hidden class="monthStart" value="%{monthStart}"/>
					<s:hidden class="yearEnd" value="%{yearEnd}"/>
					<s:hidden class="monthEnd" value="%{monthEnd}"/>
					<s:hidden class="updateDate" value="%{updateDate}"/>
					<s:hidden class="priority" value="%{priority}"/>
				
					<td class="td-No">
						<s:property value="%{#stat.index+1}" />
					</td>
					<td class="td-applyField">
						<s:property value="applyField"/>
					</td>
					<td class="td-targetOrg">
						<s:property value="targetOrg"/>
					</td>
					<td class="td-time">
						<s:set var="start" value="%{yearStart+'年'+monthStart+'月'}"/>
						<s:set var="end" value="%{yearEnd+'年'+monthEnd+'月'}"/>
						<s:property value="%{#start+(#end != null ? ' ~ '+#end : '')}" />
					</td>
					<td class="td-updateDate">
						<s:property value="updateDate"/>
					</td>
					<td>
						<input type="button" class="btn-func btn-edit" value="編輯" />
						<input type="button" class="btn-func btn-del" value="刪除" />
					</td>
				</tr>
				</s:iterator>
			</tbody>		
		</table>

<!----------------------------------------------------------------------------->
		
		<b>主要產學合作計畫案例</b>
		<input type="button" id="add-mainProject" value="+"/>
		<label>
			<input type="checkbox" name="talentedPeople.isPublicMainProject" value="true" 
				<s:property value="%{talentedPeople.isPublicMainProject ? 'checked' : ''}"/> />公開
		</label>
		<table id="table-mainProject">
			<thead>
				<tr>
					<th width="3%">No.</th>
					<th width="">合作計畫或合約名稱</th>
					<th width="">合作廠商名稱</th>
					<th width="">合作有效期間</th>
					<th>資料更新日期</th>
					<th width="16%"></th>
				</tr>
				<tr class="hidden-sample-tr">
					<s:hidden class="id" value="0"/>
					<s:hidden class="name" />
					<s:hidden class="coopComName" />
					<s:hidden class="yearStart" />
					<s:hidden class="monthStart" />
					<s:hidden class="yearEnd" />
					<s:hidden class="monthEnd" />
					<s:hidden class="updateDate" />
					<s:hidden class="priority" />
				
					<td class="td-No"></td>
					<td class="td-name"></td>
					<td class="td-coopComName"></td>
					<td class="td-time"></td>
					<td class="td-updateDate"></td>
					<td>
						<input type="button" class="btn-func btn-edit" value="編輯" />
						<input type="button" class="btn-func btn-del" value="刪除" />
					</td>				
				</tr>
			</thead>
			<tbody>
				<s:iterator value="talentedPeople.mainProjects" status="stat">
				<tr>
					<s:hidden class="id" name="%{'talentedPeople.mainProjects['+#stat.index+'].id'}"/>
					<s:hidden class="isValid" name="%{'talentedPeople.mainProjects['+#stat.index+'].isValid'}"/>
					<s:hidden class="createTime" name="%{'talentedPeople.mainProjects['+#stat.index+'].createTime'}"/>
					<s:hidden class="createUser" name="%{'talentedPeople.mainProjects['+#stat.index+'].createUser'}"/>
					<s:hidden class="updateTime" name="%{'talentedPeople.mainProjects['+#stat.index+'].updateTime'}"/>
					<s:hidden class="updateUser" name="%{'talentedPeople.mainProjects['+#stat.index+'].updateUser'}"/>
					<s:hidden class="ver" name="%{'talentedPeople.mainProjects['+#stat.index+'].ver'}"/>
					<s:hidden class="name" name="%{'talentedPeople.mainProjects['+#stat.index+'].name'}"/>
					<s:hidden class="coopComName" name="%{'talentedPeople.mainProjects['+#stat.index+'].coopComName'}"/>
					<s:hidden class="yearStart" name="%{'talentedPeople.mainProjects['+#stat.index+'].yearStart'}"/>
					<s:hidden class="monthStart" name="%{'talentedPeople.mainProjects['+#stat.index+'].monthStart'}"/>
					<s:hidden class="yearEnd" name="%{'talentedPeople.mainProjects['+#stat.index+'].yearEnd'}"/>
					<s:hidden class="monthEnd" name="%{'talentedPeople.mainProjects['+#stat.index+'].monthEnd'}"/>
					<s:hidden class="updateDate" name="%{'talentedPeople.mainProjects['+#stat.index+'].updateDate'}"/>
					<s:hidden class="priority" name="%{'talentedPeople.mainProjects['+#stat.index+'].priority'}"/>
					
					<td class="td-No">
						<s:property value="%{#stat.index+1}" />
					</td>
					<td class="td-name">
						<s:property value="name"/>
					</td>
					<td class="td-coopComName">
						<s:property value="coopComName"/>
					</td>
					<td class="td-name">
						<s:set var="start" value="%{yearStart+'年'+monthStart+'月'}"/>
						<s:set var="end" value="%{yearEnd+'年'+monthEnd+'月'}"/>
						<s:property value="%{#start+(#end != null ? ' ~ '+#end : '')}" />
					</td>
					<td class="td-updateDate">
						<s:property value="updateDate"/>
					</td>
					<td>
						<input type="button" class="btn-func btn-edit" value="編輯" />
						<input type="button" class="btn-func btn-del" value="刪除" />
					</td>									
				</tr>
				</s:iterator>
			</tbody>			
		</table>
		
<!----------------------------------------------------------------------------->	
		
		<ul>
			<li class="all">
				<b>產學獲獎事蹟</b>
				<label>
					<input type="checkbox" name="talentedPeople.isPublicRewardHistory" value="true" 
						<s:property value="%{talentedPeople.isPublicRewardHistory ? 'checked' : ''}"/> />公開
				</label>
				<s:textarea name="talentedPeople.rewardHistory" rows="5" />
			</li>
			<li class="all">
				<b>其他產業相關經驗 (如:任職過業界或法人, 或擔任過業界或法人顧問……等對產學合作有助益的經驗)</b>
				<label>
					<input type="checkbox" name="talentedPeople.isPublicOtherExperience" value="true" 
						<s:property value="%{talentedPeople.isPublicOtherExperience ? 'checked' : ''}"/> />公開
				</label>
				<s:textarea name="talentedPeople.otherExperience" rows="5" />
			</li>
		</ul>

<!----------------------------------------------------------------------------->
		
		<div class="clear"></div>
		<div class="bottom-btn-block">
			<s:submit cssClass="redBtn" value="儲存" />
<!-- 			<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/> -->
		</div>		
	</s:form>
	
<!-- ======================================================================= -->

	<form id="rdResultForm">
		<div class="subForm">
			<s:hidden class="rdResultRowIndex"/>
			<h2 class="itemTitle">重要研發成果</h2>
			<ul>
				<li class="quarter">
					<b>1.研發成果名稱</b>
					<input type="text" class="name" maxlength="500"/>
				</li>
				<li class="quarter">
					<b>2.型式</b>
					<s:select class="type" list="rdResultTypeList" listKey="code" listValue="name"/>
				</li>
				<li class="quarter">
					<b>3.發明人(創作人)</b>
					<input type="text" class="inventer" maxlength="100"/>
				</li>
				<li class="quarter">
					<b>4.所有權人</b>
					<input type="text" class="owner" maxlength="100"/>
				</li>
				<li class="all clear"></li>
				<li class="quarter">
					<b>5.專利號(申請中請填申請號)</b>
					<input type="text" class="patentNo" maxlength="100"/>
				</li>
				<li class="quarter">
					<b>6.國別</b>
					<s:select class="country" list="countryList" listKey="id" listValue="name"/>
				</li>
				<li class="quarter">
					<b>7.專利期間(起)</b>
					<input type="text" class="patentPeriodStart calendarBox" maxlength="10" placeholder="格式範例:2016/12/30"/>				
				</li>
				<li class="quarter">
					<b>7.專利期間(迄)</b>
					<input type="text" class="patentPeriodEnd calendarBox" maxlength="10" placeholder="格式範例:2016/12/30"/>				
				</li>
				<li class="all clear"></li>
				<li class="all">
					<b>8.摘要(請說明成果重點與特色)</b>
					<s:textarea class="patentAbstract" rows="3"/>
				</li>
				<li class="all">
					<b>9.應用產業/範圍(請說明成果可應用於何領域或產品)</b>
					<input type="text" class="usage" maxlength="1000"/>
				</li>
				<li class="half">
					<b>排序優先度 (將依數字小到大排序)</b>
					<input type="text" class="priority" maxlength="19"/>
				</li>
				<li class="half">
					<b>資料更新日期</b>
					<input type="text" class="updateDate" disabled="disabled"/>
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

	<form id="transferCaseForm">
		<div class="subForm">
			<s:hidden class="transferCaseRowIndex"/>
			<h2 class="itemTitle">成果移轉及授權案例</h2>
		
			<ul>
				<li class="half">
					<b>應用領域</b>
					<input type="text" class="applyField" maxlength="500"/>
				</li>
				<li class="half">
					<b>對象廠商或機構</b>
					<input type="text" class="targetOrg" maxlength="500"/>
				</li>
				<li class="half">
					<b>時間(授權期間或讓受/技轉時間)</b>
					<div>
						<div style="width:24%; float:left;">
							<s:select class="yearStart" list="yearList" listKey="code" listValue="name" />
						</div>
						<div style="width:24%; float:left;">
							<s:select class="monthStart" list="monthList" listKey="code" listValue="name" />
						</div>
						<div style="float:left;">~</div>
						<div style="width:24%; float:left;">
							<s:select class="yearEnd" list="yearList" listKey="code" listValue="name" headerKey="" headerValue=""/>
						</div>
						<div style="width:24%; float:left;">	
							<s:select class="monthEnd" list="monthList" listKey="code" listValue="name" headerKey="" headerValue=""/>
						</div>	
					</div>
				</li>
				<li class="quarter">
					<b>排序優先度 (將依數字小到大排序)</b>
					<input type="text" class="priority" maxlength="19"/>
				</li>
				<li class="quarter">
					<b>資料更新日期</b>
					<input type="text" class="updateDate" disabled="disabled"/>
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

	<form id="mainProjectForm">
		<div class="subForm">
			<s:hidden class="mainProjectRowIndex"/>
			<h2 class="itemTitle">主要產學合作計畫案例</h2>
		
			<ul>
				<li class="half">
					<b>合作計畫或合約名稱</b>
					<input type="text" class="name" maxlength="500"/>
				</li>
				<li class="half">
					<b>合作廠商名稱</b>
					<input type="text" class="coopComName" maxlength="500"/>
				</li>
				<li class="half">
					<b>合作有效期間</b>
					<div>
						<div style="width:24%; float:left;">
							<s:select class="yearStart" list="yearList" listKey="code" listValue="name" />
						</div>
						<div style="width:24%; float:left;">
							<s:select class="monthStart" list="monthList" listKey="code" listValue="name" />
						</div>
						<div style="float:left;">~</div>
						<div style="width:24%; float:left;">
							<s:select class="yearEnd" list="yearList" listKey="code" listValue="name" />
						</div>
						<div style="width:24%; float:left;">	
							<s:select class="monthEnd" list="monthList" listKey="code" listValue="name" />
						</div>	
					</div>
				</li>
				<li class="quarter">
					<b>排序優先度 (將依數字小到大排序)</b>
					<input type="text" class="priority" maxlength="19"/>
				</li>
				<li class="quarter">
					<b>資料更新日期</b>
					<input type="text" class="updateDate" disabled="disabled"/>
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

<%-- 	<s:include value="./form-backToIndex.jsp" /> --%>
	
</body>
</html>