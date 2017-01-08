<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function() {
		$("#btn-back").click(function(){				
			$("#form-backToIndex").submit();
		});
	});
</script>
<style>
	table {border:solid 1px; width:100%; word-break: break-all;}
	table tr {border:solid 1px;}
	table tr td {border:solid 1px;}
</style>
<meta name="funcPathText" content="編輯管理  > 檢視"/>
</head>
<body>
<!-- 	<h2 class="itemTitle">編輯管理 > 檢視</h2> -->
	<table>
		<tr>
			<th colspan="2">企業基本資料</th>
		</tr>
		<tr>
			<td width="20%"><b>企業名稱</b></td>
			<td><s:property value="enterpriseInfo.name"/></td>
		</tr>
		<tr>
			<td width="20%"><b>統一編號</b></td>
			<td><s:property value="enterpriseInfo.companyId"/></td>
		</tr>			
		<tr>
			<td><b>公司目前產品/服務項目</b></td>
			<td><s:property value="enterpriseInfo.mainProduct"/></td>
		</tr>
		<tr>
			<td><b>產業類別</b></td>
			<td>
				<div style="margin-right:1%; float:left; ">
					<b>(一階)領域:</b>
				</div>
				<div style="width:70%; margin-right:1%; float:left; ">
					<s:checkboxlist name="enterpriseInfo.optionDomainIdList" list="optionDomainList" listKey="id" listValue="name" cssClass="horizontalList" disabled="true"/>
				</div>
				<div class="clear"></div>
				<div style="margin-right:1%; float:left; ">
					<b>(二階)發展方向:</b>
				</div>
				<div style="width:83%; margin-right:1%; float:left; ">
					<s:property value="enterpriseInfo.phase2"/>
				</div>
				<div class="clear"></div>
				<div style="margin-right:1%; float:left; ">
					<b>(三階)應用端:</b>
				</div>
				<div style="width:85%; margin-right:1%; float:left; ">
					<s:property value="enterpriseInfo.phase3"/>
				</div>
			</td>
		</tr>
		<tr>
			<td><b>公司地址</b></td>
			<td>
				<div style="margin-right:1%; float:left; ">
					<s:select name="enterpriseInfo.optionCompanyLocation.id" list="optionCompanyLocationList" listKey="id" listValue="name" disabled="true"/>
				</div>
				<div style="width:87%; margin-right:1%; float:left; ">
					<s:property value="enterpriseInfo.address"/>
				</div>
			</td>
		</tr>
		<tr>
			<td><b>負責人</b></td>
			<td>
				<div style="width:5%; margin-right:1%; float:left; ">
					<b>姓名:</b>
				</div>
				<div style="width:43%; margin-right:1%; float:left; ">
					<s:property value="enterpriseInfo.personInChargeName"/>
				</div>
				
				<div style="width:5%; margin-right:1%; float:left; ">
					<b>職稱:</b>
				</div>
				<div style="width:44%; float:left; ">
					<s:property value="enterpriseInfo.personInChargeJobtitle"/>
				</div>
				
				<div class="clear"></div>
								
				<div style="width:5%; margin-right:1%; float:left; ">
					<b>電話:</b>
				</div>
				<div style="width:43%; margin-right:1%; float:left; ">
					<s:property value="enterpriseInfo.personInChargePhone"/>
				</div>					

				<div style="width:5%; margin-right:1%; float:left; ">
					<b>Email:</b>
				</div>
				<div style="width:44%; float:left; ">
					<s:property value="enterpriseInfo.personInChargeEmail"/>
				</div>	
			</td>
		</tr>
		<tr>
			<td><b>受訪人</b></td>
			<td>
				<div style="width:5%; margin-right:1%; float:left; ">
					<b>姓名:</b>
				</div>
				<div style="width:43%; margin-right:1%; float:left; ">
					<s:property value="enterpriseInfo.intervieweeName"/>
				</div>
				
				<div style="width:5%; margin-right:1%; float:left; ">
					<b>職稱:</b>
				</div>
				<div style="width:44%; float:left; ">
					<s:property value="enterpriseInfo.intervieweeJobtitle"/>
				</div>
				
				<div class="clear"></div>
								
				<div style="width:5%;margin-right:1%; float:left; ">
					<b>電話:</b>
				</div>
				<div style="width:43%; margin-right:1%; float:left; ">
					<s:property value="enterpriseInfo.intervieweePhone"/>
				</div>								

				<div style="width:5%; margin-right:1%; float:left; ">
					<b>Email:</b>
				</div>
				<div style="width:44%; float:left; ">
					<s:property value="enterpriseInfo.intervieweeEmail"/>
				</div>	
			</td>
		</tr>		
	</table>

	<table>
		<tr><th colspan="4">技術需求資料</th><tr>
		<tr>
			<td rowspan="3" width="20%">
				<b>未來研發的技術若突破<br>預期可應用範圍及產品</b>
			</td>
			<td colspan="3">
				<div style="margin-right:1%; float:left; ">
					<b>(一階)領域:</b>
				</div>
				<div style="width:80%; margin-right:1%; float:left; ">
					<s:radio name="enterpriseInfo.enterpriseRequireTech.phase1.id" list="optionDomainList" listKey="id" listValue="name" cssClass="horizontalList" disabled="true"/>					
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<div style="margin-right:1%; float:left; ">
					<b>(二階)發展方向:</b>
				</div>
				<div style="width:83%; margin-right:1%; float:left; ">
					<s:property value="enterpriseInfo.enterpriseRequireTech.phase2"/>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<div style="margin-right:1%; float:left; ">
					<b>(三階)應用端:</b>
				</div>
				<div style="width:85%; margin-right:1%; float:left; ">
					<s:property value="enterpriseInfo.enterpriseRequireTech.phase3"/>
				</div>
			</td>
		</tr>			
		<tr>
			<td width="20%">
				<b>已經探詢過的單位<br>(上述技術需求)</b>
			</td>
			<td colspan="3">
				<s:property value="enterpriseInfo.enterpriseRequireTech.inquiredOrg"/>
			</td>
		</tr>
		<tr>
			<td width="20%"><b>訪談日期</b></td>
			<td width="30%">
				<s:property value="enterpriseInfo.enterpriseRequireTech.interviewDate"/>
			</td>
			<td width="20%"><b>記錄人</b></td>
			<td width="30%">
				<s:property value="enterpriseInfo.enterpriseRequireTech.recordBy" />
			</td>			
		</tr>			
	</table>
	
	<table>
		<tr><th colspan="2">企業情況調查</th></tr>
		<tr>
			<td width="20%"><b>1.企業已有技術來源</b></td>
			<td>
				<div style="width:40%; margin-right:1%; float:left; ">
					<s:radio name="enterpriseInfo.enterpriseSituation.optionHadTecSrc.id" list="optionHadTecSrcList" listKey="id" listValue="name" cssClass="horizontalList" disabled="true"/>
				</div>
				<div style="margin-right:1%; float:left; ">
					<b>比例:</b>					
				</div>
				<div style="float:left; ">
					<s:property value="%{enterpriseInfo.enterpriseSituation.hadTecSrcRation * 100 +'%'}" />
				</div>
			</td>
		</tr>
		<tr>
			<td rowspan="3" ><b>2.與法人機構，<br>技術合作的意願</b></td>
			<td>
				<div style="margin-right:1%; float:left; ">
					<b>2-1.是否有過跟法人機構技術合作(含技轉)的經驗？</b>
				</div>
				<s:radio name="enterpriseInfo.enterpriseSituation.hasComCoopExp" list="#{'true':'是', 'false':'否' }" cssClass="horizontalList" disabled="true"/>
			</td>
		</tr>
		<tr>
			<td>
				<div style="margin-right:1%; float:left;">
					<b>2-2.合作題目為何？</b>
				</div>	
				<div style="width:75%; margin-right:1%; float:left;">
					<s:property value="enterpriseInfo.enterpriseSituation.coopTopic" />
				</div>				
			</td>
		</tr>
		<tr>
			<td>
				<b>2-3.請闡述與法人機構技轉的優、缺點？</b><br>
				<div style="margin-right:1%; float:left;">
					優點:
				</div>
				<div style="width:93%; margin-right:1%; float:left;">
					<s:property value="enterpriseInfo.enterpriseSituation.coopPros" />
				</div>
				
				<div style="margin-right:1%; float:left;">
					缺點:
				</div>				
				<div style="width:93%; margin-right:1%; float:left;">
					<s:property value="enterpriseInfo.enterpriseSituation.coopCons" />
				</div>					
			</td>
		</tr>
		<tr>
			<td rowspan="6" width="20%"><b>3.與學界，技術合作的<br>意願 &amp; 合作模式</b></td>
			<td>
				<div style="margin-right:1%; float:left;">
					<b>3-1.是否有過跟學界技術合作的經驗？</b>
				</div>
				<s:radio name="enterpriseInfo.enterpriseSituation.hasAcademiaCoopExp" list="#{'true':'是', 'false':'否' }" cssClass="horizontalList" disabled="true"/>
			</td>
		</tr>
		<tr>
			<td>
				<b>3-2.合作題目為何？</b>
				<s:property value="enterpriseInfo.enterpriseSituation.academiaTopic" />
			</td>
		</tr>			
		<tr>
			<td>
				<b>3-3.對於跟學界合作的意願？</b>
				<s:property value="enterpriseInfo.enterpriseSituation.academiaIntention" />
			</td>
		</tr>			
		<tr>
			<td>
				<b>3-4.請闡述與學界技術合作的優、缺點？</b><br>
				<div style="margin-right:1%; float:left;">
					優點:
				</div>
				<div style="width:93%; margin-right:1%; float:left;">
					<s:property value="enterpriseInfo.enterpriseSituation.academiaPros" />
				</div>
				<div style="margin-right:1%; float:left;">
					缺點:
				</div>
				<div style="width:93%; margin-right:1%; float:left;">
					<s:property value="enterpriseInfo.enterpriseSituation.academiaCons" />
				</div>					
			</td>
		</tr>
		<tr>
			<td>
				<b>3-5.與學校合作，是否有特定的合作模式？</b>
				<s:radio name="enterpriseInfo.enterpriseSituation.optionCooperateMode.id" list="optionCooperateModeList" listKey="id" listValue="name" cssClass="horizontalList" disabled="true"/>
			</td>
		</tr>
		<tr>
			<td>
				<b>3-6.若以新創方式合作，是否有特定主題或方向？</b><br>
				<div style="width:15%; margin-right:1%; float:left;">
					<s:radio name="enterpriseInfo.enterpriseSituation.hasSpecificTopic" list="#{'true':'是', 'false':'否' }" cssClass="horizontalList" disabled="true"/>
				</div>
				<div style="margin-right:1%; float:left;">
					主題:
				</div>
				<div style="width:75%; margin-right:1%; float:left;">
					<s:property value="enterpriseInfo.enterpriseSituation.specificTopic" />					
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<b>4.是否有其他合作對象<br>(非學術或研究單位)</b>
			</td>
			<td>
				<div style="width:15%; margin-right:1%; float:left;">
					<s:radio name="enterpriseInfo.enterpriseSituation.hasOtherCoopTarget" list="#{'true':'是', 'false':'否' }" cssClass="horizontalList" disabled="true"/>
				</div>
				<div style="margin-right:1%; float:left;">
					對象:
				</div>
				<div style="width:75%; margin-right:1%; float:left;">
					<s:property value="enterpriseInfo.enterpriseSituation.otherCoopTarget" />					
				</div>					
			</td>
		</tr>				
	</table>
	
	<table>
		<tr>
			<th colspan="2">產學合作</th>
		</tr>
		<tr>
			<td rowspan="3" width="20%"><b>5.合作對象</b></td>
			<td>
				<div style="margin-right:1%; float:left;">
					<b>5-1傾向與哪些學校進行技術合作？</b>
				</div>
				<div style="width:65%; margin-right:1%; float:left;">
					<s:property value="enterpriseInfo.enterpriseAcademiaCoop.coopSchool" />
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<b>5-2.目前公司是否有其他的產學合作案正在進行中？</b><br>
				<div style="width:15%; margin-right:1%; float:left;">
					<s:radio name="enterpriseInfo.enterpriseAcademiaCoop.hasCurrentCoopProject" list="#{'true':'是', 'false':'否' }" cssClass="horizontalList" disabled="true"/>
				</div>
				<div style="margin-right:1%; float:left;">
					主題:
				</div>
				<div style="width:75%; margin-right:1%; float:left;">
					<s:property value="enterpriseInfo.enterpriseAcademiaCoop.currentCoopProjectTopic" />					
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<b>5-3.手上是否已有想合作的學校對象？我們可以協助鏈結。</b><br>
				<div style="width:15%; margin-right:1%; float:left;">
					<s:radio name="enterpriseInfo.enterpriseAcademiaCoop.hasWantedCoopSchool" list="#{'true':'是', 'false':'否' }" cssClass="horizontalList" disabled="true"/>
				</div>
				<div style="margin-right:1%; float:left;">
					主題:
				</div>
				<div style="width:75%; margin-right:1%; float:left;">
					<s:property value="enterpriseInfo.enterpriseAcademiaCoop.wantedCoopSchoolTopic" />					
				</div>
			</td>
		</tr>
		<tr>
			<td><b>6.其他/對於科技部<br>「運用法人鏈結產學<br>合作計畫」有何建議？</b></td>
			<td>
				<s:property value="enterpriseInfo.enterpriseAcademiaCoop.suggestion" />
			</td>
		</tr>		
	</table>		
		
	<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
		<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>
	</div>
	
	<form action="index" method="post" id="form-backToIndex">
		<s:hidden name="searchCondition.searchText"/>
		<s:hidden name="searchCondition.optionCompanyLocationId"/>
		<s:hidden name="searchCondition.personInChargeName"/>
		<s:hidden name="searchCondition.intervieweeName"/>
		<s:hidden name="searchCondition.interviewDateS"/>
		<s:hidden name="searchCondition.interviewDateE"/>
		<s:hidden name="searchCondition.pageIndex"/>
		<s:hidden name="searchCondition.pageSize"/>
	</form>
</body>
</html>