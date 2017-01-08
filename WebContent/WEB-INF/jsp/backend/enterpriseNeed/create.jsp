<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function() {
		companyLocationSelectSetting();
		specificTopicRadioSetting();
		otherCoopTargetRadioSetting();
		currentCoopProjectRadioSetting();
		wantedCoopSchoolRadioSetting();
	});
</script>
<script>
	function companyLocationSelectSetting() {
		$("select[name='enterpriseInfo.optionCompanyLocation.id']").change(function(){
			var selectLocation = $(this).find("option:selected").html();
			$("input[name='enterpriseInfo.address']").val(selectLocation);
		});
		$("select[name='enterpriseInfo.optionCompanyLocation.id']").trigger("change");
	}
</script>
<script>
	function specificTopicRadioSetting() {
		$("input[type=radio][name='enterpriseInfo.enterpriseSituation.hasSpecificTopic']").change(function(){
			var hasSpecificTopic = $("input[type=radio][name='enterpriseInfo.enterpriseSituation.hasSpecificTopic']:checked").val();
			if (hasSpecificTopic == "true") {
				$("input[name='enterpriseInfo.enterpriseSituation.specificTopic']").removeAttr("disabled");
			} else {
				$("input[name='enterpriseInfo.enterpriseSituation.specificTopic']").attr("disabled", "disabled");
			} 
		});
		$("input[type=radio][name='enterpriseInfo.enterpriseSituation.hasSpecificTopic']").trigger("change");
	}
</script>
<script>
	function otherCoopTargetRadioSetting() {
		$("input[type=radio][name='enterpriseInfo.enterpriseSituation.hasOtherCoopTarget']").change(function(){
			var hasSpecificTopic = $("input[type=radio][name='enterpriseInfo.enterpriseSituation.hasOtherCoopTarget']:checked").val();
			if (hasSpecificTopic == "true") {
				$("input[name='enterpriseInfo.enterpriseSituation.otherCoopTarget']").removeAttr("disabled");
			} else {
				$("input[name='enterpriseInfo.enterpriseSituation.otherCoopTarget']").attr("disabled", "disabled");
			} 
		});
		$("input[type=radio][name='enterpriseInfo.enterpriseSituation.hasOtherCoopTarget']").trigger("change");
	}
</script>
<script>
	function currentCoopProjectRadioSetting() {
		$("input[type=radio][name='enterpriseInfo.enterpriseAcademiaCoop.hasCurrentCoopProject']").change(function(){
			var hasSpecificTopic = $("input[type=radio][name='enterpriseInfo.enterpriseAcademiaCoop.hasCurrentCoopProject']:checked").val();
			if (hasSpecificTopic == "true") {
				$("input[name='enterpriseInfo.enterpriseAcademiaCoop.currentCoopProjectTopic']").removeAttr("disabled");
			} else {
				$("input[name='enterpriseInfo.enterpriseAcademiaCoop.currentCoopProjectTopic']").attr("disabled", "disabled");
			} 
		});
		$("input[type=radio][name='enterpriseInfo.enterpriseAcademiaCoop.hasCurrentCoopProject']").trigger("change");
	}
</script>
<script>
	function wantedCoopSchoolRadioSetting() {
		$("input[type=radio][name='enterpriseInfo.enterpriseAcademiaCoop.hasWantedCoopSchool']").change(function(){
			var hasSpecificTopic = $("input[type=radio][name='enterpriseInfo.enterpriseAcademiaCoop.hasWantedCoopSchool']:checked").val();
			if (hasSpecificTopic == "true") {
				$("input[name='enterpriseInfo.enterpriseAcademiaCoop.wantedCoopSchoolTopic']").removeAttr("disabled");
			} else {
				$("input[name='enterpriseInfo.enterpriseAcademiaCoop.wantedCoopSchoolTopic']").attr("disabled", "disabled");
			} 
		});
		$("input[type=radio][name='enterpriseInfo.enterpriseAcademiaCoop.hasWantedCoopSchool']").trigger("change");
	}
</script>
<style>
	table {border:solid 1px; width:100%;}
	table tr {border:solid 1px;}
	table tr td {border:solid 1px;}
</style>
<meta name="funcPathText" content="新增"/>
</head>
<body>
<!-- 	<h2 class="itemTitle">新增</h2> -->
	<s:form action="createSubmit" method="post" validate="true" >
		<table>
			<tr>
				<th colspan="2">企業基本資料</th>
			</tr>
			<tr>
				<td width="20%"><b>企業名稱</b></td>
				<td><s:textfield name="enterpriseInfo.name"/></td>
			</tr>
			<tr>
				<td width="20%"><b>統一編號</b></td>
				<td><s:textfield name="enterpriseInfo.companyId"/></td>
			</tr>			
			<tr>
				<td><b>公司目前產品/服務項目</b></td>
				<td><s:textarea name="enterpriseInfo.mainProduct"/></td>
			</tr>
			<tr>
				<td><b>產業類別</b></td>
				<td>
					<div style="margin-right:1%; float:left; ">
						<b>(一階)領域:</b>
					</div>
					<div style="width:70%; margin-right:1%; float:left; ">
						<s:checkboxlist name="enterpriseInfo.optionDomainIdList" list="optionDomainList" listKey="id" listValue="name" cssClass="horizontalList"/>
					</div>
					<div class="clear"></div>
					<b>(二階)發展方向:</b>
					<s:textarea name="enterpriseInfo.phase2"/>
					<b>(三階)應用端:</b>
					<s:textarea name="enterpriseInfo.phase3"/>
				</td>
			</tr>
			<tr>
				<td><b>公司地址</b></td>
				<td>
					<div style="width:10%; margin-right:1%; float:left; ">
						<s:select name="enterpriseInfo.optionCompanyLocation.id" list="optionCompanyLocationList" listKey="id" listValue="name" />
					</div>
					<div style="width:89%; float:left; ">
						<s:textfield name="enterpriseInfo.address"/>
					</div>
				</td>
			</tr>
			<tr>
				<td><b>負責人</b></td>
				<td>
					<div style="width:5%; margin-right:1%; float:left; ">
						<b>姓名</b>
					</div>
					<div style="width:43%; margin-right:1%; float:left; ">
						<s:textfield name="enterpriseInfo.personInChargeName"/>
					</div>
					
					<div style="width:5%; margin-right:1%; float:left; ">
						<b>職稱</b>
					</div>
					<div style="width:44%; float:left; ">
						<s:textfield name="enterpriseInfo.personInChargeJobtitle"/>
					</div>
					
					<div class="clear"></div>
									
					<div style="width:5%; margin-right:1%; float:left; ">
						<b>電話</b>
					</div>
					<div style="width:43%; margin-right:1%; float:left; ">
						<s:textfield name="enterpriseInfo.personInChargePhone"/>
					</div>					

					<div style="width:5%; margin-right:1%; float:left; ">
						<b>Email</b>
					</div>
					<div style="width:44%; float:left; ">
						<s:textfield name="enterpriseInfo.personInChargeEmail"/>
					</div>	
				</td>
			</tr>
			<tr>
				<td><b>受訪人</b></td>
				<td>
					<div style="width:5%; margin-right:1%; float:left; ">
						<b>姓名</b>
					</div>
					<div style="width:43%; margin-right:1%; float:left; ">
						<s:textfield name="enterpriseInfo.intervieweeName"/>
					</div>
					
					<div style="width:5%; margin-right:1%; float:left; ">
						<b>職稱</b>
					</div>
					<div style="width:44%; float:left; ">
						<s:textfield name="enterpriseInfo.intervieweeJobtitle"/>
					</div>
					
					<div class="clear"></div>
									
					<div style="width:5%;margin-right:1%; float:left; ">
						<b>電話</b>
					</div>
					<div style="width:43%; margin-right:1%; float:left; ">
						<s:textfield name="enterpriseInfo.intervieweePhone"/>
					</div>								

					<div style="width:5%; margin-right:1%; float:left; ">
						<b>Email</b>
					</div>
					<div style="width:44%; float:left; ">
						<s:textfield name="enterpriseInfo.intervieweeEmail"/>
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
						<s:radio name="enterpriseInfo.enterpriseRequireTech.phase1.id" list="optionDomainList" listKey="id" listValue="name" cssClass="horizontalList"/>					
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<div style="margin-right:1%; float:left; ">
						<b>(二階)發展方向:</b>
					</div>
					<s:textarea name="enterpriseInfo.enterpriseRequireTech.phase2"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<div style="margin-right:1%; float:left; ">
						<b>(三階)應用端:</b>
					</div>
					<s:textarea name="enterpriseInfo.enterpriseRequireTech.phase3"/>
				</td>
			</tr>			
			<tr>
				<td width="20%">
					<b>已經探詢過的單位<br>(上述技術需求)</b>
				</td>
				<td colspan="3">
					<s:textfield name="enterpriseInfo.enterpriseRequireTech.inquiredOrg"/>
				</td>
			</tr>
			<tr>
				<td width="20%"><b>訪談日期</b></td>
				<td>
					<s:textfield name="enterpriseInfo.enterpriseRequireTech.interviewDate" cssClass="calendarBox" autocomplete="off"/>
				</td>
				<td width="20%"><b>記錄人</b></td>
				<td>
					<s:textfield name="enterpriseInfo.enterpriseRequireTech.recordBy" />
				</td>			
			</tr>			
		</table>
		
		<table>
			<tr><th colspan="2">企業情況調查</th></tr>
			<tr>
				<td width="20%"><b>1.企業已有技術來源</b></td>
				<td>
					<div style="width:40%; margin-right:1%; float:left; ">
						<s:radio name="enterpriseInfo.enterpriseSituation.optionHadTecSrc.id" list="optionHadTecSrcList" listKey="id" listValue="name" cssClass="horizontalList"/>
					</div>
					<div style="margin-right:1%; float:left; ">
						<b>比例(100% 請填1, 55%請填0.55, 以此類推)</b>					
					</div>
					<div style="float:left; ">
						<s:textfield name="enterpriseInfo.enterpriseSituation.hadTecSrcRation" size="4" />
					</div>
				</td>
			</tr>
			<tr>
				<td rowspan="3" ><b>2.與法人機構，<br>技術合作的意願</b></td>
				<td>
					<div style="margin-right:1%; float:left; ">
						<b>2-1.是否有過跟法人機構技術合作(含技轉)的經驗？</b>
					</div>
					<s:radio name="enterpriseInfo.enterpriseSituation.hasComCoopExp" list="#{'true':'是', 'false':'否' }" cssClass="horizontalList" />
				</td>
			</tr>
			<tr>
				<td>
					<div style="width:19%; margin-right:1%; float:left;">
						<b>2-2.合作題目為何？</b>
					</div>	
					<div style="width:80%; float:left;">
						<s:textfield name="enterpriseInfo.enterpriseSituation.coopTopic" />
					</div>				
				</td>
			</tr>
			<tr>
				<td>
					<b>2-3.請闡述與法人機構技轉的優、缺點？</b><br>
					<div style="width:5%; margin-right:1%; float:left;">
						優點:
					</div>
					<div style="width:94%; float:left;">
						<s:textfield name="enterpriseInfo.enterpriseSituation.coopPros" />
					</div>
					
					<div style="width:5%; margin-right:1%; float:left;">
						缺點:
					</div>				
					<div style="width:94%; float:left;">
						<s:textfield name="enterpriseInfo.enterpriseSituation.coopCons" />
					</div>					
				</td>
			</tr>
			<tr>
				<td rowspan="6" width="20%"><b>3.與學界，技術合作的<br>意願 &amp; 合作模式</b></td>
				<td>
					<div style="margin-right:1%; float:left;">
						<b>3-1.是否有過跟學界技術合作的經驗？</b>
					</div>
					<s:radio name="enterpriseInfo.enterpriseSituation.hasAcademiaCoopExp" list="#{'true':'是', 'false':'否' }" cssClass="horizontalList" />
				</td>
			</tr>
			<tr>
				<td>
					<div style="width:19%; margin-right:1%; float:left;">
						<b>3-2.合作題目為何？</b>
					</div>	
					<div style="width:80%; float:left;">
						<s:textfield name="enterpriseInfo.enterpriseSituation.academiaTopic" />
					</div>				
				</td>
			</tr>			
			<tr>
				<td>
					<div style="width:26%; margin-right:1%; float:left;">
						<b>3-3.對於跟學界合作的意願？</b>
					</div>
					<div style="width:73%; float:left;">
						<s:textfield name="enterpriseInfo.enterpriseSituation.academiaIntention" maxlength="100"/>
					</div>
				</td>
			</tr>			
			<tr>
				<td>
					<b>3-4.請闡述與學界技術合作的優、缺點？</b><br>
					<div style="width:5%; margin-right:1%; float:left;">
						優點:
					</div>
					<div style="width:94%; float:left;">
						<s:textfield name="enterpriseInfo.enterpriseSituation.academiaPros" />
					</div>
					<div style="width:5%; margin-right:1%; float:left;">
						缺點:
					</div>
					<div style="width:94%; float:left;">
						<s:textfield name="enterpriseInfo.enterpriseSituation.academiaCons" />
					</div>					
				</td>
			</tr>
			<tr>
				<td>
					<b>3-5.與學校合作，是否有特定的合作模式？</b>
					<s:radio name="enterpriseInfo.enterpriseSituation.optionCooperateMode.id" list="optionCooperateModeList" listKey="id" listValue="name" cssClass="horizontalList" />
				</td>
			</tr>
			<tr>
				<td>
					<b>3-6.若以新創方式合作，是否有特定主題或方向？</b><br>
					<div style="width:15%; margin-right:1%; float:left;">
						<s:radio name="enterpriseInfo.enterpriseSituation.hasSpecificTopic" list="#{'true':'是', 'false':'否' }" cssClass="horizontalList"/>
					</div>
					<div style="width:5%; margin-right:1%; float:left;">
						主題:
					</div>
					<div style="width:78%; float:left;">
						<s:textfield name="enterpriseInfo.enterpriseSituation.specificTopic" />					
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<b>4.是否有其他合作對象<br>(非學術或研究單位)</b>
				</td>
				<td>
					<div style="width:15%; margin-right:1%; float:left;">
						<s:radio name="enterpriseInfo.enterpriseSituation.hasOtherCoopTarget" list="#{'true':'是', 'false':'否' }" cssClass="horizontalList"/>
					</div>
					<div style="width:5%; margin-right:1%; float:left;">
						對象:
					</div>
					<div style="width:78%; float:left;">
						<s:textfield name="enterpriseInfo.enterpriseSituation.otherCoopTarget" />					
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
					<div style="width:34%; margin-right:1%; float:left;">
						<b>5-1傾向與哪些學校進行技術合作？</b>
					</div>
					<div style="width:65%; float:left;">
						<s:textfield name="enterpriseInfo.enterpriseAcademiaCoop.coopSchool" />
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<b>5-2.目前公司是否有其他的產學合作案正在進行中？</b><br>
					<div style="width:15%; margin-right:1%; float:left;">
						<s:radio name="enterpriseInfo.enterpriseAcademiaCoop.hasCurrentCoopProject" list="#{'true':'是', 'false':'否' }" cssClass="horizontalList"/>
					</div>
					<div style="width:5%; margin-right:1%; float:left;">
						主題:
					</div>
					<div style="width:78%; float:left;">
						<s:textfield name="enterpriseInfo.enterpriseAcademiaCoop.currentCoopProjectTopic" />					
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<b>5-3.手上是否已有想合作的學校對象？我們可以協助鏈結。</b><br>
					<div style="width:15%; margin-right:1%; float:left;">
						<s:radio name="enterpriseInfo.enterpriseAcademiaCoop.hasWantedCoopSchool" list="#{'true':'是', 'false':'否' }" cssClass="horizontalList"/>
					</div>
					<div style="width:5%; margin-right:1%; float:left;">
						主題:
					</div>
					<div style="width:78%; float:left;">
						<s:textfield name="enterpriseInfo.enterpriseAcademiaCoop.wantedCoopSchoolTopic" />					
					</div>
				</td>
			</tr>
			<tr>
				<td><b>6.其他/對於科技部<br>「運用法人鏈結產學<br>合作計畫」有何建議？</b></td>
				<td>
					<s:textarea name="enterpriseInfo.enterpriseAcademiaCoop.suggestion" />
				</td>
			</tr>		
		</table>		
		
		<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
			<input type="submit" value="送出" class="redBtn"/>
		</div>	
	</s:form>	
</body>
</html>