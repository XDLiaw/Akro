<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function() {
		btnUnfoldRdResultSetting();
		
		$("#btn-back").click(function(){				
			$("#form-backToIndex").submit();
		});	
	});
</script>
<script>
	function btnUnfoldRdResultSetting() {
		$(".btn-unfold-rd-result").click(function(){
			var rowIndex = $('#table-rdResult tr').index($(this).parents('tr'));
			if ($(this).val() == "展開") {
// 				$('#table-rdResult tr').eq(rowIndex).find("td").css("visibility","hidden");
// 				$('#table-rdResult tr').eq(rowIndex).find(".btn-unfold-rd-result").parents("td").css("visibility","visible");;
				$(this).val("收起");
			} else {
// 				$('#table-rdResult tr').eq(rowIndex).find("td").css("visibility","visible");
				$(this).val("展開");
			}
			
			$('#table-rdResult tr').eq(rowIndex+1).toggle();
			$('#table-rdResult tr').eq(rowIndex+2).toggle();
			$('#table-rdResult tr').eq(rowIndex+3).toggle();
			$('#table-rdResult tr').eq(rowIndex+4).toggle();
		});
	}
</script>
<style>
table.table-talentedPeopleInfo { margin-bottom:15px; }
table.table-talentedPeopleInfo tr:hover { background:none; }
table.table-talentedPeopleInfo td { border:none; }
table.table-talentedPeopleInfo td.headShot { width:20%; border:#e6eff5 1px solid; }
table#table-domain { margin:0px; }
textarea[disabled] { width:100%; resize:none; border:none; background-color:#ffffff; }
</style>
<meta name="funcPathText" content="編輯管理 > 檢視"/>
</head>
<body>
<div class="rightContent">
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
						<div class="border-text"><s:property value="talentedPeople.nameCh"/>&nbsp;</div>
					</li>
					<li class="quarter">
						<b>姓名(英)</b>
						<div class="border-text"><s:property value="talentedPeople.nameEn"/>&nbsp;</div>
					</li>
					<li class="quarter">
						<b>性別</b>
						<div class="border-text"><s:property value="talentedPeople.gender"/>&nbsp;</div>
					</li>
					<li class="quarter">
						<b>產學經驗(年)</b>
						<div class="border-text"><s:property value="talentedPeople.expYear"/>&nbsp;</div>
					</li>
					
					<li class="half">
						<b>連絡電話</b>
						<div class="border-text">
							<s:if test="talentedPeople.isPublicTel">
								<s:property value="talentedPeople.tel"/>&nbsp;
							</s:if>
							<s:else>非公開</s:else>
						</div>
					</li>
					
					<li class="half">
						<b>e-mail</b>
						<div class="border-text">
							<s:if test="talentedPeople.isPublicEmail">
								<s:property value="talentedPeople.email"/>&nbsp;
							</s:if>
							<s:else>非公開</s:else>
						</div>
					</li>
					<li class="half">
						<b>現職單位</b>
						<div class="border-text"><s:property value="talentedPeople.workOrg"/>&nbsp;</div>
					</li>
					<li class="half">
						<b>現職職位</b>
						<div class="border-text"><s:property value="talentedPeople.job"/>&nbsp;</div>
					</li>
					<li class="all">
						<b>網站連結</b>
						<div class="border-text">
							<a href="<s:property value="talentedPeople.url"/>">
								<s:property value="talentedPeople.url"/>
							</a>
						</div>
					</li>					
				</ul>					
			</td>
			<td class="headShot text-align-center">
				<img src="data:image;base64,<s:property value="talentedPeople.base64HeadShot"/>" style="max-width:150px; max-height:200px;" />
			</td>				
		</tr>
	</table>

	<ul>
		<li class="all">
			<b>領域</b>
			<div class="border-text">
				<s:iterator value="talentedPeople.domains" status="stat">
					<s:property value="%{name + '; '}"/>
				</s:iterator>
			</div>				
		</li>
		<li class="all">
			<b>合作專長</b>
			<div class="border-text"><s:property value="talentedPeople.specialty"/>&nbsp;</div>
		</li>
	</ul>
	
	<b>重要研發成果(包含:專利,技術,IC佈局, 軟體…..)</b>
	<s:if test="talentedPeople.isPublicRdResult != true">
		<p>非公開</p><br>
	</s:if>
	<s:else>
		<table id="table-rdResult" >
			<tr>
				<th>研發成果名稱</th>
				<th>型式</th>
				<th>資料更新日期</th>
				<th></th>
			</tr>
			<s:iterator value="talentedPeople.rdResults" status="stat">
				<tr>
					<td><s:property value="name"/></td>
					<td><s:property value="type"/></td>
					<td><s:property value="updateDate"/></td>
					<td><input type="button" value="展開" class="btn-func btn-view btn-unfold-rd-result"/></td>
				</tr>
				<tr style="display:none; background:#E4EBF0">
					<td>
						<b>研發成果名稱</b>
						<s:property value="name"/>
					</td>
					<td>
						<b>型式</b>
						<s:property value="type"/>
					</td>
					<td>
						<b>資料更新日期</b>
						<s:property value="updateDate"/>
					</td>
					<td>
						<b>國別</b>
						<s:property value="optionCountry.name"/>
					</td>
				</tr>
				<tr style="display:none; background:#E4EBF0">
					<td>
						<b>專利期間</b>
						<s:property value="%{patentPeriodStart + ' ~ ' + patentPeriodEnd}" />
					</td>
					<td>
						<b>專利號/申請號</b>
						<s:property value="patentNo"/>
					</td>
					<td>
						<b>發明人</b>
						<s:property value="inventer"/>
					</td>
					<td>
						<b>所有權人</b>
						<s:property value="owner"/>
					</td>
				</tr>
				<tr style="display:none; background:#E4EBF0">
					<td colspan="4" title="<s:property value="patentAbstract"/>">
						<b>摘要</b>
						<s:textarea name="patentAbstract" disabled="true"/>
					</td>
				</tr>
				<tr style="display:none; background:#E4EBF0">
					<td colspan="4" title="<s:property value="usage"/>">
						<b>應用產業/範圍</b>
						<s:property value="usage"/>
					</td>
				</tr>
	
			</s:iterator>
		</table>
	</s:else>
		
	<b>成果移轉及授權案例</b>
	<s:if test="talentedPeople.isPublicTransferCase != true">
		<p>非公開</p><br>
	</s:if>
	<s:else>
		<table id="table-transferCase">
			<tr>
				<th width="">應用領域</th>
				<th width="">對象廠商或機構</th>
				<th width="">授權期間或讓受/技轉時間</th>
				<th>資料更新日期</th>
			</tr>
			<s:iterator value="talentedPeople.transferCases" status="stat">
				<tr>
					<td><s:property value="applyField" /></td>
					<td><s:property value="targetOrg" /></td>
					<td>
						<s:set var="start" value="%{yearStart+'年'+monthStart+'月'}"/>
						<s:set var="end" value="%{yearEnd+'年'+monthEnd+'月'}"/>
						<s:property value="%{#start+(#end != null ? ' ~ '+#end : '')}" />
					</td>
					<td><s:property value="updateDate" /></td>
				</tr>
			</s:iterator>	
		</table>
	</s:else>		
	
	<b>主要產學合作計畫案例</b>
	<s:if test="talentedPeople.isPublicMainProject != true">
		<p>非公開</p><br>
	</s:if>
	<s:else>
		<table id="table-mainProject">
			<tr>
				<th width="">合作計畫或合約名稱</th>
				<th width="">合作廠商名稱</th>
				<th width="">合作有效期間</th>
				<th>資料更新日期</th>
			</tr>
			<s:iterator value="talentedPeople.mainProjects" status="stat">
				<tr>
					<td><s:property value="name" /></td>
					<td><s:property value="coopComName" /></td>
					<td>
						<s:set var="start" value="%{yearStart+'年'+monthStart+'月'}"/>
						<s:set var="end" value="%{yearEnd+'年'+monthEnd+'月'}"/>
						<s:property value="%{#start+' ~ '+#end}" />
					</td>
					<td><s:property value="updateDate" /></td>
				</tr>
			</s:iterator>
		</table>
	</s:else>
	
	<ul>
		<li class="all">
			<b>產學獲獎事蹟</b>
			<s:if test="talentedPeople.isPublicRewardHistory">
				<s:textarea name="talentedPeople.rewardHistory" disabled="true" />
			</s:if>
			<s:else>
				<div class="border-text">非公開</div>
			</s:else>
		</li>
		<li class="all">
			<b>其他產業相關經驗 (如:任職過業界或法人, 或擔任過業界或法人顧問……等對產學合作有助益的經驗)</b>
			<s:if test="talentedPeople.isPublicOtherExperience">
				<s:textarea name="talentedPeople.otherExperience" disabled="true" />
			</s:if>
			<s:else>
				<div class="border-text">非公開</div>
			</s:else>
		</li>
	</ul>
	
	<div class="clear"></div>
	<div class="bottom-btn-block">
		<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>
	</div>
				
	<form action="index" method="post" id="form-backToIndex">
		<s:hidden name="searchCondition.name"/>
		<s:hidden name="searchCondition.gender"/>
		<s:hidden name="searchCondition.expYearS"/>
		<s:hidden name="searchCondition.expYearE"/>
		<s:hidden name="searchCondition.workOrg"/>
		<s:hidden name="searchCondition.job"/>
		<s:hidden name="searchCondition.specialty"/>
		<s:iterator value="searchCondition.grbDomainIdList" status="stat">
			<input type="hidden" name="searchCondition.grbDomainIdList" value="<s:property/>"/>
		</s:iterator>
		<s:hidden name="searchCondition.pageIndex"/>
		<s:hidden name="searchCondition.pageSize"/>
	</form>
</div>	
</body>
</html>