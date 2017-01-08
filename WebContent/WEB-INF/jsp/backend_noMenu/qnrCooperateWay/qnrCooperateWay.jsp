<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script>
	$(document).ready(function() {
		setValueBackToRadio();
		switchPartSetting();
		part4controlSetting();

		$("input[type=submit]").click(function(event) {
			event.preventDefault();
			if (isFinishPDPL()) {
				$("form").submit();
				return true;
			} else {
				return false;
			}
		});
		
// 		$("#table-part1 input[type=radio][value=1]").prop("checked", true); //TODO 上版前要註解掉
// 		$("#table-part2 input[type=radio][value=1]").prop("checked", true); //TODO 上版前要註解掉
// 		$("#table-part3 input[type=radio][value=1]").prop("checked", true); //TODO 上版前要註解掉
		
		pdplSetting();
		hideOrShowApplicantData();
	});
</script>
<script>
	function setValueBackToRadio() {
		var q1_1 = "<s:property value="qnrCoopereateWay.q1_1"/>";
		$("input[name='qnrCoopereateWay.q1_1'][value="+q1_1+"]").prop("checked", true);		
		var q1_2 = "<s:property value="qnrCoopereateWay.q1_2"/>";
		$("input[name='qnrCoopereateWay.q1_2'][value="+q1_2+"]").prop("checked", true);		
		var q1_3 = "<s:property value="qnrCoopereateWay.q1_3"/>";
		$("input[name='qnrCoopereateWay.q1_3'][value="+q1_3+"]").prop("checked", true);
		var q1_4 = "<s:property value="qnrCoopereateWay.q1_4"/>";
		$("input[name='qnrCoopereateWay.q1_4'][value="+q1_4+"]").prop("checked", true);
		var q1_5 = "<s:property value="qnrCoopereateWay.q1_5"/>";
		$("input[name='qnrCoopereateWay.q1_5'][value="+q1_5+"]").prop("checked", true);
		var q1_6 = "<s:property value="qnrCoopereateWay.q1_6"/>";
		$("input[name='qnrCoopereateWay.q1_6'][value="+q1_6+"]").prop("checked", true);
		var q1_7 = "<s:property value="qnrCoopereateWay.q1_7"/>";
		$("input[name='qnrCoopereateWay.q1_7'][value="+q1_7+"]").prop("checked", true);
		var q1_8 = "<s:property value="qnrCoopereateWay.q1_8"/>";
		$("input[name='qnrCoopereateWay.q1_8'][value="+q1_8+"]").prop("checked", true);
		var q1_9 = "<s:property value="qnrCoopereateWay.q1_9"/>";
		$("input[name='qnrCoopereateWay.q1_9'][value="+q1_9+"]").prop("checked", true);
		var q1_10 = "<s:property value="qnrCoopereateWay.q1_10"/>";
		$("input[name='qnrCoopereateWay.q1_10'][value="+q1_10+"]").prop("checked", true);
		var q1_11 = "<s:property value="qnrCoopereateWay.q1_11"/>";
		$("input[name='qnrCoopereateWay.q1_11'][value="+q1_11+"]").prop("checked", true);
		var q1_12 = "<s:property value="qnrCoopereateWay.q1_12"/>";
		$("input[name='qnrCoopereateWay.q1_12'][value="+q1_12+"]").prop("checked", true);
		var q1_13 = "<s:property value="qnrCoopereateWay.q1_13"/>";
		$("input[name='qnrCoopereateWay.q1_13'][value="+q1_13+"]").prop("checked", true);
		var q1_14 = "<s:property value="qnrCoopereateWay.q1_14"/>";
		$("input[name='qnrCoopereateWay.q1_14'][value="+q1_14+"]").prop("checked", true);
		var q1_15 = "<s:property value="qnrCoopereateWay.q1_15"/>";
		$("input[name='qnrCoopereateWay.q1_15'][value="+q1_15+"]").prop("checked", true);

		var q2_1 = "<s:property value="qnrCoopereateWay.q2_1"/>";
		$("input[name='qnrCoopereateWay.q2_1'][value="+q2_1+"]").prop("checked", true);
		var q2_2 = "<s:property value="qnrCoopereateWay.q2_2"/>";
		$("input[name='qnrCoopereateWay.q2_2'][value="+q2_2+"]").prop("checked", true);
		var q2_3 = "<s:property value="qnrCoopereateWay.q2_3"/>";
		$("input[name='qnrCoopereateWay.q2_3'][value="+q2_3+"]").prop("checked", true);
		var q2_4 = "<s:property value="qnrCoopereateWay.q2_4"/>";
		$("input[name='qnrCoopereateWay.q2_4'][value="+q2_4+"]").prop("checked", true);
		var q2_5 = "<s:property value="qnrCoopereateWay.q2_5"/>";
		$("input[name='qnrCoopereateWay.q2_5'][value="+q2_5+"]").prop("checked", true);
		var q2_6 = "<s:property value="qnrCoopereateWay.q2_6"/>";
		$("input[name='qnrCoopereateWay.q2_6'][value="+q2_6+"]").prop("checked", true);
		var q2_7 = "<s:property value="qnrCoopereateWay.q2_7"/>";
		$("input[name='qnrCoopereateWay.q2_7'][value="+q2_7+"]").prop("checked", true);
		var q2_8 = "<s:property value="qnrCoopereateWay.q2_8"/>";
		$("input[name='qnrCoopereateWay.q2_8'][value="+q2_8+"]").prop("checked", true);
		var q2_9 = "<s:property value="qnrCoopereateWay.q2_9"/>";
		$("input[name='qnrCoopereateWay.q2_9'][value="+q2_9+"]").prop("checked", true);
		var q2_10 = "<s:property value="qnrCoopereateWay.q2_10"/>";
		$("input[name='qnrCoopereateWay.q2_10'][value="+q2_10+"]").prop("checked", true);
		
		var q3_1 = "<s:property value="qnrCoopereateWay.q3_1"/>";
		$("input[name='qnrCoopereateWay.q3_1'][value="+q3_1+"]").prop("checked", true);
		var q3_2 = "<s:property value="qnrCoopereateWay.q3_2"/>";
		$("input[name='qnrCoopereateWay.q3_2'][value="+q3_2+"]").prop("checked", true);
		var q3_3 = "<s:property value="qnrCoopereateWay.q3_3"/>";
		$("input[name='qnrCoopereateWay.q3_3'][value="+q3_3+"]").prop("checked", true);
		var q3_4 = "<s:property value="qnrCoopereateWay.q3_4"/>";
		$("input[name='qnrCoopereateWay.q3_4'][value="+q3_4+"]").prop("checked", true);
		var q3_5 = "<s:property value="qnrCoopereateWay.q3_5"/>";
		$("input[name='qnrCoopereateWay.q3_5'][value="+q3_5+"]").prop("checked", true);
		var q3_6 = "<s:property value="qnrCoopereateWay.q3_6"/>";
		$("input[name='qnrCoopereateWay.q3_6'][value="+q3_6+"]").prop("checked", true);
		var q3_7 = "<s:property value="qnrCoopereateWay.q3_7"/>";
		$("input[name='qnrCoopereateWay.q3_7'][value="+q3_7+"]").prop("checked", true);
		var q3_8 = "<s:property value="qnrCoopereateWay.q3_8"/>";
		$("input[name='qnrCoopereateWay.q3_8'][value="+q3_8+"]").prop("checked", true);
		var q3_9 = "<s:property value="qnrCoopereateWay.q3_9"/>";
		$("input[name='qnrCoopereateWay.q3_9'][value="+q3_9+"]").prop("checked", true);
		var q3_10 = "<s:property value="qnrCoopereateWay.q3_10"/>";
		$("input[name='qnrCoopereateWay.q3_10'][value="+q3_10+"]").prop("checked", true);
		var q3_11 = "<s:property value="qnrCoopereateWay.q3_11"/>";
		$("input[name='qnrCoopereateWay.q3_11'][value="+q3_11+"]").prop("checked", true);
		var q3_12 = "<s:property value="qnrCoopereateWay.q3_12"/>";
		$("input[name='qnrCoopereateWay.q3_12'][value="+q3_12+"]").prop("checked", true);
		var q3_13 = "<s:property value="qnrCoopereateWay.q3_13"/>";
		$("input[name='qnrCoopereateWay.q3_13'][value="+q3_13+"]").prop("checked", true);
		var q3_14 = "<s:property value="qnrCoopereateWay.q3_14"/>";
		$("input[name='qnrCoopereateWay.q3_14'][value="+q3_14+"]").prop("checked", true);
	}
</script>
<script>
	function switchPartSetting() {
		hideAllPart();
		
		var submitPageFrom = "<s:property value="submitPageFrom"/>";
		if (submitPageFrom == null || submitPageFrom == "") {
			$("#div-part0").show();
		} else {
			$("#div-part3").show();
		}		

		$("input[type=button].goToPart0").click(function() {
			hideAllPart();
			$("#div-part0").show();
		});
		$("input[type=button].goToPart1").click(function() {
			if (isFinishPart0()) {
				hideAllPart();
				$("#div-part1").show();
			} else {
				alert("尚有題目未回答!");
			}
		});
		$("input[type=button].goToPart2").click(function() {
			if (isFinishPart1()) {
				hideAllPart();
				$("#div-part2").show();
			} else {
				alert("尚有題目未回答!");
			}
		});
		$("input[type=button].goToPart3").click(function() {
			if (isFinishPart2()) {
				hideAllPart();
				$("#div-part3").show();
			} else {
				alert("尚有題目未回答!");
			}
		});
		
		$("input[type=button].goToPart4").click(function() {
			if (isFinishPart3()) {
				hideAllPart();
				$("#div-part4").show();
			} else {
				alert("尚有題目未回答!");
			}
		});
		
		$("input[type=button].goToPDPL").click(function() {
			if(isFinishPart4()) {
				hideAllPart();
				$("#div-PDPL").show();
			} else {
				alert("尚有題目未回答!");
			}
		});
	}
	
	function isFinishPart0() {
		if ($("#div-part0 input[type='checkbox']:checked").length < 1) {
			return false;
		}
		if ($("#div-part0 input[type='radio']:checked").length != 2) {
			return false;
		}
		return true;
	}
	
	function isFinishPart1() {
		return $("#div-part1 input[type='radio']:checked").length == 15;
	}
	
	function isFinishPart2() {
		return $("#div-part2 input[type='radio']:checked").length == 10;
	}
	
	function isFinishPart3() {
		return $("#div-part3 input[type='radio']:checked").length == 14;
	}
	
	function isFinishPart4() {
		var q0_1 = [false, false, false];
		$("input[name='qnrCoopereateWay.q0_1']:checked").map(function(index){
			q0_1[$(this).val()-1] = true;
		});
		
		var numRadioNeedToCheck = 0;
		if (q0_1[0] == true) {
			numRadioNeedToCheck = 9;
		}
		else {
			if (q0_1[1] == true) {
				numRadioNeedToCheck += 3;
			}
			if (q0_1[2] == true) {
				numRadioNeedToCheck += 1;
			}
		} 
			
		return $("#div-part4 .qnrList input[type='radio']:checked").length >= numRadioNeedToCheck;
	}
	
	function isFinishPDPL() {
		var aggreePDPL = $("input[name='qnrCoopereateWay.aggreePDPL']").prop('checked');
		if (aggreePDPL) {
			var name = $("input[name='qnrCoopereateWay.name']").val();
			var email = $("input[name='qnrCoopereateWay.email']").val();
			var address = $("input[name='qnrCoopereateWay.address']").val();

			if (name.length == 0 || email.length == 0 || email.address == 0) {
				alert("請填寫您的大名、EMAIL、地址");
				return false;
			}
		}
		
		return true;
	}

	function hideAllPart() {
		$("#div-part0").hide();
		$("#div-part1").hide();
		$("#div-part2").hide();
		$("#div-part3").hide();
		$("#div-part4").hide();
		$("#div-PDPL").hide();
	}
</script>
<script>
	function part4controlSetting() {
		$("input[name='qnrCoopereateWay.q0_1']").click(function() {		
			var q0_1 = [false, false, false];
			$("input[name='qnrCoopereateWay.q0_1']:checked").map(function(index){
				q0_1[$(this).val()-1] = true;
			});

			$("div#div-part4 .qnrList input[type=radio]").attr("disabled", true);
			$("div#div-part4 .qnrList input[type=radio]").parents("li").hide();
			if (q0_1[0] == true) {
				$("div#div-part4 .qnrList input[type=radio]").removeAttr("disabled");
				$("div#div-part4 .qnrList input[type=radio]").parents("li").show();
			} 
			if (q0_1[1] == true) {
				$("div#div-part4 .qnrList input[type=radio][name='qnrCoopereateWay.q4_6']").removeAttr("disabled");
				$("div#div-part4 .qnrList input[type=radio][name='qnrCoopereateWay.q4_7']").removeAttr("disabled");
				$("div#div-part4 .qnrList input[type=radio][name='qnrCoopereateWay.q4_8']").removeAttr("disabled");
				$("div#div-part4 .qnrList input[type=radio][name='qnrCoopereateWay.q4_6']").parents("li").show();
				$("div#div-part4 .qnrList input[type=radio][name='qnrCoopereateWay.q4_7']").parents("li").show();
				$("div#div-part4 .qnrList input[type=radio][name='qnrCoopereateWay.q4_8']").parents("li").show();
			}
			if (q0_1[2] == true) {
				$("div#div-part4 .qnrList input[type=radio][name='qnrCoopereateWay.q4_9']").removeAttr("disabled");
				$("div#div-part4 .qnrList input[type=radio][name='qnrCoopereateWay.q4_9']").parents("li").show();
			}
		});
	}
</script>
<script>
	function pdplSetting() {
		$("input[type=checkbox][name='qnrCoopereateWay.aggreePDPL']").click(function() {
			hideOrShowApplicantData();
		});
	}

	function hideOrShowApplicantData() {
		if ($("input[type=checkbox][name='qnrCoopereateWay.aggreePDPL']").prop("checked")) {
			$("#ul-applicant-data").show();
		} else {
			$("#ul-applicant-data").hide();

			$("input[name='qnrCoopereateWay.name']").val("");
			$("input[name='qnrCoopereateWay.email']").val("");
			$("input[name='qnrCoopereateWay.address']").val("");
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="<s:url value="/css/qnrCooperateWay.css"/>" />
</head>
<body>
	<s:form action="fillInQnrSubmit" method="post" validate="true">
		<s:hidden name="schoolId" />
		
		<div id="div-part0" style="font-size: 1.15em;">
			<img src="<s:url value="/images/qnrCooperateWayDesc.jpg"/>" style="max-width: 1000px; max-height: 1000px; margin-bottom:30px;">
			<h2 class="itemTitle Down">基本資料</h2>
			<ul>
				<li class="all">
					1. 請問您目前任職單位職稱為(可複選)：
					<s:checkboxlist name="qnrCoopereateWay.q0_1" list="#{'1':'產學合作業務一級主管 (研究發展處研發長, 技術合作處技合長, 產學合作處產學長或產學合作中心單位主管)', '2':'技轉中心單位主管', '3':'育成中心單位主管'}" cssClass="horizontalList"/>
				</li>
				<li class="all">
					2. 請問您服務於學術界年資合計： 
					<s:radio name="qnrCoopereateWay.q0_2" list="#{'1':'5年以下', '2':'5-10年', '3':'11-15年', '4':'16-20年', '5':'21-25年', '6':'26-30年', '7':'30年以上' }" cssClass="horizontalList"/>
				</li>
				<li class="all">
					3. 請問您參與產學合作活動/計畫相關資歷合計： 
					<s:radio name="qnrCoopereateWay.q0_3" list="#{'1':'5年以下', '2':'5-10年', '3':'11-15年', '4':'16-20年', '5':'20年以上' }" cssClass="horizontalList"/>
				</li>
			</ul>
			<input type="button" class="goToPart1 redBtn" value="下一頁">
		</div>
		<div class="clear"></div>
		
		<div id="div-part1">
			<h2 class="subTitle-qnrCooperateWay">《第一部份》學校對於推動新興特色的發展導向</h2>
			<div class="top-desc">
				<p>【說明】您目前服務的學校對於推動新興特色的發展導向，如產學合作、創業型大學、教學卓越大學等，請勾選適當的程度，皆為單選題。</p>
			</div>

			<table class="table-qnrCooperateWay" id="table-part1">
				<tr class="text-align-center">
					<th></th>
					<th></th>
					<th nowrap>非常同意</th>
					<th nowrap>同意</th>
					<th nowrap>稍微同意</th>
					<th nowrap>普通</th>
					<th nowrap>稍微不同意</th>
					<th nowrap>不同意</th>
					<th nowrap>非常不同意</th>
				</tr>
				<tr>
					<td>1</td>
					<td>學校一向積極發展新興特色以回應外界期待。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_1" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_1" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_1" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_1" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_1" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_1" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_1" value="1" /></td>
				</tr>
				<tr>
					<td>2</td>
					<td>學校願意承擔發展新興特色所需之風險。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_2" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_2" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_2" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_2" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_2" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_2" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_2" value="1" /></td>
				</tr>
				<tr>
					<td>3</td>
					<td>為發展學校新興特色，大刀闊斧的改革是必需的。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_3" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_3" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_3" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_3" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_3" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_3" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_3" value="1" /></td>
				</tr>
				<tr>
					<td>4</td>
					<td>學校一級主管非常重視校務革新工作與樹立典範。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_4" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_4" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_4" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_4" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_4" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_4" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_4" value="1" /></td>
				</tr>
				<tr>
					<td>5</td>
					<td>學校總是積極導入改善與創新措施。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_5" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_5" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_5" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_5" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_5" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_5" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_5" value="1" /></td>
				</tr>
				<tr>
					<td>6</td>
					<td>學校總是量身訂做適合的規章與實施方法。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_6" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_6" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_6" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_6" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_6" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_6" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_6" value="1" /></td>
				</tr>
				<tr>
					<td>7</td>
					<td>為發展新興特色，相較其他學校本校推行許多校務革新工作。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_7" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_7" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_7" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_7" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_7" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_7" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_7" value="1" /></td>
				</tr>
				<tr>
					<td>8</td>
					<td>學校對於校務革新總能領先其他學校。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_8" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_8" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_8" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_8" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_8" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_8" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_8" value="1" /></td>
				</tr>
				<tr>
					<td>9</td>
					<td>學校的許多革新作法，都能引起其他學校的效法與回應。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_9" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_9" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_9" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_9" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_9" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_9" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_9" value="1" /></td>
				</tr>
				<tr>
					<td>10</td>
					<td>面對其他學校的競爭，學校總是主動出擊。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_10" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_10" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_10" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_10" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_10" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_10" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_10" value="1" /></td>
				</tr>
				<tr>
					<td>11</td>
					<td>面對其他學校的競爭，學校常常是第一個導入革新措施。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_11" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_11" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_11" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_11" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_11" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_11" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_11" value="1" /></td>
				</tr>
				<tr>
					<td>12</td>
					<td>面對其他學校的競爭，本校會積極發展競爭優勢，建立模仿障礙。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_12" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_12" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_12" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_12" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_12" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_12" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_12" value="1" /></td>
				</tr>
				<tr>
					<td>13</td>
					<td>學校給予推動單位很高的自由度。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_13" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_13" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_13" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_13" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_13" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_13" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_13" value="1" /></td>
				</tr>
				<tr>
					<td>14</td>
					<td>學校注重對推動單位員工充份授權。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_14" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_14" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_14" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_14" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_14" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_14" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_14" value="1" /></td>
				</tr>
				<tr>
					<td>15</td>
					<td>教職員工在新校務發展扮演關鍵的決策角色。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_15" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_15" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_15" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_15" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_15" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_15" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q1_15" value="1" /></td>
				</tr>
			</table>

			<input type="button" class="goToPart0 redBtn" value="上一頁"> 
			<input type="button" class="goToPart2 redBtn" value="下一頁">
		</div>
		<div class="clear"></div>
		
		<div id="div-part2">
			<h2 class="subTitle-qnrCooperateWay">《第二部份》學校推動研究商品化活動的支援體系</h2>
			<div class="top-desc">
				<p>【說明】您目前服務的學校針對研發活動及產學合作提供之支援體系，請勾選適當的程度，皆為單選題。</p>
			</div>
			<table class="table-qnrCooperateWay" id="table-part2">
				<tr class="text-align-center">
					<th></th>
					<th></th>
					<th nowrap>非常同意</th>
					<th nowrap>同意</th>
					<th nowrap>稍微同意</th>
					<th nowrap>普通</th>
					<th nowrap>稍微不同意</th>
					<th nowrap>不同意</th>
					<th nowrap>非常不同意</th>
				</tr>
				<tr>
					<td>1</td>
					<td>針對外界不同的需求(例：教學、研究、產學合作、技術移轉等)，學校會有不同的行政單位來負責。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_1" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_1" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_1" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_1" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_1" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_1" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_1" value="1" /></td>
				</tr>
				<tr>
					<td>2</td>
					<td>學校原有任務(例：教學、研究發展)與研究商品化活動在校內是被分開的，各自有自己的運作架構。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_2" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_2" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_2" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_2" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_2" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_2" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_2" value="1" /></td>
					
				</tr>
				<tr>
					<td>3</td>
					<td>學校各行政單位都有自己的特定功能與服務對象與服務事項。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_3" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_3" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_3" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_3" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_3" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_3" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_3" value="1" /></td>
				</tr>
				<tr>
					<td>4</td>
					<td>學校任務從屬與員工單位歸屬是非常明確被界定清楚。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_4" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_4" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_4" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_4" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_4" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_4" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_4" value="1" /></td>
				</tr>
				<tr>
					<td>5</td>
					<td>學校行政體系運作可與學校所有目標發展連動。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_5" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_5" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_5" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_5" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_5" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_5" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_5" value="1" /></td>
				</tr>
				<tr>
					<td>6</td>
					<td>學校行政體系運作可以避免將資源浪費在無潛在效益的活動。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_6" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_6" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_6" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_6" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_6" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_6" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_6" value="1" /></td>
				</tr>
				<tr>
					<td>7</td>
					<td>學校會給予員工明確的目標，避免他們的工作陷入多目標衝突。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_7" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_7" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_7" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_7" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_7" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_7" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_7" value="1" /></td>
				</tr>
				<tr>
					<td>8</td>
					<td>學校行政體系鼓勵大家挑戰既有傳統與作法。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_8" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_8" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_8" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_8" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_8" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_8" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_8" value="1" /></td>
				</tr>
				<tr>
					<td>9</td>
					<td>學校行政體系具有彈性，足以快速回應外界各種需求的改變。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_9" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_9" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_9" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_9" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_9" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_9" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_9" value="1" /></td>
				</tr>
				<tr>
					<td>10</td>
					<td>學校行政體系可以快速調整，藉以回應學校發展方向的改變。</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_10" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_10" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_10" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_10" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_10" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_10" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q2_10" value="1" /></td>
				</tr>
			</table>

			<input type="button" class="goToPart1 redBtn" value="上一頁"> 
			<input type="button" class="goToPart3 redBtn" value="下一頁">
		</div>
		<div class="clear"></div>
		
		<div id="div-part3">
			<h2 class="subTitle-qnrCooperateWay">《第三部份》學校針對研究商品化活動提供之相關配套措施</h2>
			<div class="top-desc">
				<p>【說明】您目前服務的學校為推動研究商品化活動(專利申請、產學合作、技術移轉、新創事業等)所提供之相關輔導與激勵措施，請勾選適當的程度，皆為單選題。</p>
			</div>
			<table class="table-qnrCooperateWay" id="table-part3">
				<tr class="text-align-center">
					<th></th>
					<th></th>
					<th nowrap>非常同意</th>
					<th nowrap>同意</th>
					<th nowrap>稍微同意</th>
					<th nowrap>普通</th>
					<th nowrap>稍微不同意</th>
					<th nowrap>不同意</th>
					<th nowrap>非常不同意</th>
				</tr>
				<tr>
					<td>1</td>
					<td>學校提供研究商品化活動所需資源(如設備、空間與經費)</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_1" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_1" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_1" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_1" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_1" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_1" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_1" value="1" /></td>
				</tr>
				<tr>
					<td>2</td>
					<td>學校擁有豐沛人力資本發展研究商品化活動</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_2" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_2" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_2" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_2" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_2" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_2" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_2" value="1" /></td>
				</tr>
				<tr>
					<td>3</td>
					<td>學校設有專責單位與人員負責協助研究商品化活動</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_3" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_3" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_3" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_3" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_3" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_3" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_3" value="1" /></td>
				</tr>
				<tr>
					<td>4</td>
					<td>學校辦學績效與聲望有助於研究商品化活動發展</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_4" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_4" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_4" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_4" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_4" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_4" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_4" value="1" /></td>
				</tr>
				<tr>
					<td>5</td>
					<td>學校現有的產學網絡與聯盟活動有助於研究商品化活動發展</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_5" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_5" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_5" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_5" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_5" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_5" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_5" value="1" /></td>
				</tr>
				<tr>
					<td>6</td>
					<td>學校目前與鄰近產業廠商連結程度有助於研究商品化活動發展</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_6" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_6" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_6" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_6" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_6" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_6" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_6" value="1" /></td>
				</tr>
				<tr>
					<td>7</td>
					<td>學校提供教職員工與學生多樣化研究商品化訓練課程或是學程</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_7" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_7" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_7" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_7" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_7" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_7" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_7" value="1" /></td>
				</tr>
				<tr>
					<td>8</td>
					<td>學校訂定良好的進行各種研究商品化活動辦法與輔導措施</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_8" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_8" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_8" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_8" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_8" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_8" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_8" value="1" /></td>
				</tr>
				<tr>
					<td>9</td>
					<td>學校訂定良好的研究商品化收益分配的辦法</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_9" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_9" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_9" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_9" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_9" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_9" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_9" value="1" /></td>
				</tr>
				<tr>
					<td>10</td>
					<td>學校訂定良好鼓勵教職員工投入研究商品化活動的辦法</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_10" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_10" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_10" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_10" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_10" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_10" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_10" value="1" /></td>
				</tr>
				<tr>
					<td>11</td>
					<td>學校訂定良好獎勵研究商品化成果傑出教職員工的辦法</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_11" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_11" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_11" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_11" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_11" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_11" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_11" value="1" /></td>
				</tr>
				<tr>
					<td>12</td>
					<td>學校對於研究商品化成功案例會進行報導與宣傳</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_12" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_12" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_12" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_12" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_12" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_12" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_12" value="1" /></td>
				</tr>
				<tr>
					<td>13</td>
					<td>學校將研究商品化活動成果納為教職員工產出之一環</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_13" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_13" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_13" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_13" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_13" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_13" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_13" value="1" /></td>
				</tr>
				<tr>
					<td>14</td>
					<td>學校訂定多元升等機制，將研究商品化成果與個人職涯發展連結</td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_14" value="7" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_14" value="6" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_14" value="5" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_14" value="4" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_14" value="3" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_14" value="2" /></td>
					<td class="text-align-center"><input type="radio" name="qnrCoopereateWay.q3_14" value="1" /></td>
				</tr>
			</table>
			<input type="button" class="goToPart2 redBtn" value="上一頁">
			<input type="button" class="goToPart4 redBtn" value="下一頁">
		</div>
		<div class="clear"></div>

		<div id="div-part4">
			<h2 class="subTitle-qnrCooperateWay">《第四部份》學校2015年度產學資源投入及產出</h2>
			<div class="top-desc">
				<p>【說明】請您依據貴校過去一整年度(2015年)產學合作能力表現，勾選最為符合學校能力範疇之選項，皆為單選題。</p>
				<p>【備註】此部份問項請依您的職掌範疇進行填答：</p>
				<p>若您目前任職產學合作業務一級主管（研究發展處研發長、技術合作處技合長、產學合作處產學長或產學合作中心單位主管）請填寫下方「問題1~9」；</p>
				<p>若任職技轉中心單位主管請填寫下方「問題6~8」；</p>
				<p>育成中心單位主管請填寫下方「問題9」。</p>				
			</div>
			
			<div class="clear"></div>
			<ul class="qnrList">
				<li class="all">
					1.	請問貴校參與產學相關推動業務(含產學研發中心、技轉中心、創新育成中心等或相關行政單位)之全職聘僱人員總數為：
					<s:radio name="qnrCoopereateWay.q4_1" list="#{'1':'7人以下', '2':'8-14人', '3':'15-21人', '4':'22-28人', '5':'29人以上'}" cssClass="horizontalList"/>
				</li>
				<li class="all">
					2.	請問貴校實質參與產學合作研究計畫教職人員佔全校教職人員總數比例約為：
					<s:radio name="qnrCoopereateWay.q4_2" list="#{'1':'10%以下', '2':'11-20%', '3':'21-33%', '4':'34-50%', '5':'51%以上'}" cssClass="horizontalList"/>
				</li>
				<li class="all">
					3.	請問貴校獲得政府 (科技部、經濟部、農委會等各部會)補助之產學合作計畫經費年度總額約為：
					<s:radio name="qnrCoopereateWay.q4_3" list="#{'1':'1,000萬元以下', '2':'1,001-5,000萬元', '3':'5,001萬-1億元', '4':'1億元以上-2億元', '5':'2億元以上'}" cssClass="horizontalList"/>
				</li>
				<li class="all">
					4.	請問貴校2015年度受企業委託之研究計畫(不含政府補助計畫)簽約總件數：
					<s:radio name="qnrCoopereateWay.q4_4" list="#{'1':'20件以下', '2':'21-50件', '3':'51-100件', '4':'100-150件', '5':'150件以上'}" cssClass="horizontalList"/>
				</li>				
				<li class="all">
					5.	請問貴校2015年度受企業委託之研究計畫(不含政府補助計畫)簽約總經費：
					<s:radio name="qnrCoopereateWay.q4_5" list="#{'1':'500萬元以下', '2':'501-1,000萬元', '3':'1,001-5,000萬元', '4':'5,001萬-1億元', '5':'1億元以上'}" cssClass="horizontalList"/>
				</li>				
				<li class="all">
					6.	請問貴校2015年度獲證專利總件數(含政府補助、學校自主申請之專利案件)：
					<s:radio name="qnrCoopereateWay.q4_6" list="#{'1':'25件以下', '2':'26-50件', '3':'51-75件', '4':'76-100件', '5':'100件以上'}" cssClass="horizontalList"/>
				</li>				
				<li class="all">
					7.	請問貴校2015年度技術移轉總件數(含政府補助、學校自主簽訂之產學合作計畫成果)：
					<s:radio name="qnrCoopereateWay.q4_7" list="#{'1':'25件以下', '2':'26-50件', '3':'51-75件', '4':'76-100件', '5':'100件以上'}" cssClass="horizontalList"/>
				</li>				
				<li class="all">
					8.	請問貴校2015年度技術移轉合約授權收入總額(含政府補助計畫、學校自主簽訂之產學合作計畫)：
					<s:radio name="qnrCoopereateWay.q4_8" list="#{'1':'1,000萬元以下', '2':'1,001-5,000萬元', '3':'5,001萬-1億元', '4':'1億元以上-1.5億元', '5':'1.5億元以上'}" cssClass="horizontalList"/>
				</li>
				<li class="all">
					9.	請問貴校創新育成中心進駐企業中，屬於校內師生創業的比例約為：
					<s:radio name="qnrCoopereateWay.q4_9" list="#{'1':'10%以下', '2':'11-20%', '3':'21-33%', '4':'34-50%', '5':'51%以上'}" cssClass="horizontalList"/>
				</li>
			</ul>
			
			<div style="margin:20px 0px 50px 0px; font-size:20px; ">
				<span>【本問卷到此結束，敬請再次確認是否有漏答，謝謝!】</span>
			</div>

			<ul>
				<li class="all">
					另本計畫期望透過工業合作推動小組計畫，擬邀請國際顧問公司的講師來台對國內大專校院進行科技成果產業化推動與引進技術整備度(Technology readiness levels , TRL)概念之專業人才培訓，以協助學校推動研發成果產業化。為確認大專校院的培訓意願與提高工合計畫通過機率，展開此次調查。申請計畫通過後，參與單位無須負擔任何培訓費用。故請問貴校是否有上課意願？<br>
				</li>
				<li class="all">
					<s:radio name="qnrCoopereateWay.attendCourseWill" list="#{'1':'有意願', '2':'無意願', '3':'其他，請說明：'}" cssClass="horizontalList"/>
					<s:textfield name="qnrCoopereateWay.attendCourseDesc"/>
				</li>
			</ul>
			
			<input type="button" class="goToPart3 redBtn" value="上一頁">
			<input type="button" class="goToPDPL redBtn" value="下一頁">
		</div>

		<div id="div-PDPL">
			<div>
				<h2 class="subTitle-qnrCooperateWay">個人資料蒐集、處理及利用之告知暨同意書</h2>
	
				<div class="top-desc">請詳閱下列「個人資料蒐集、處理及利用之告知事項」後，於最下方中勾選是否同意，並留資料，按下「提交」鍵即可，謝謝。</div>
				<div class="PDPL-detail-desc">
					<span>【告知事項】</span> <br>
					<br> <span> 工業技術研究院(下稱本院)為執行科技部105年度「運用法人鏈結產學合作計畫」，進行「精進大學產學合作發展機制問卷調查」，蒐集、處理及利用您所提供，或未來基於各種事由將提供的個人資料（下稱個資），依法告知下列事項： </span><br>
					<br> <span> 一、蒐集目的： </span><br> <span style="padding-left: 32px"> 為執行科技部105年度「運用法人鏈結產學合作計畫」，進行「精進大學產學合作發展機制問卷調查」，並將調查結果提供科技部查詢。 </span><br>
					<br> <span> 二、個資類別： </span><br> <span style="padding-left: 32px"> C001 辨識個人者。如：姓名、職稱、地址、電話、E-MAIL等。 </span><br> <span style="padding-left: 32px"> C011 個人描述。如：性別、出生年等。 </span><br>
					<span style="padding-left: 32px"> C038 職業。如：學校校長、教授、或其他各種職務等。 </span><br> <span style="padding-left: 32px"> C051 學校紀錄。如：大學、研究所或其他學校等學歷記錄。 </span><br> <span style="padding-left: 32px">
						C060 受僱情形：如：目前之受僱情形、過去之僱用經過與工作經驗。 </span><br> <span style="padding-left: 32px"> C132 其他未分類資料：校務執行經驗與相關資訊等。 </span><br>
					<br> <span> 三、利用期間：至蒐集目的消失為止。 </span><br>
					<br> <span> 四、利用地區：中華民國地區及本院北美公司及國外辦事處/室所在地區。 </span><br>
					<br> <span> 五、利用者：科技部、本院、「運用法人鏈結產學合作計畫」網站及「鏈結產學媒合平台」(Industry-Academia Catalyst E-Platform, I-ACE) 網站。 </span><br>
					<br> <span> 六、利用方式：在不違反蒐集目的的前提下，將調查結果建置為統計資訊，以網際網路、電子郵件、書面、傳真及其他合法方式利用之。 </span><br>
					<br> <span> 七、您得以書面主張下列權利： </span><br> <span style="padding-left: 32px"> （一）查詢或請求閱覽。 </span><br> <span style="padding-left: 32px"> （二）請求製給複製本。 </span><br> <span
						style="padding-left: 32px"> （三）請求補充或更正。 </span><br> <span style="padding-left: 32px"> （四）請求停止蒐集、處理或利用。 </span><br> <span style="padding-left: 32px"> （五）請求刪除。 </span><br>
					<br> <span> 八、以上個資除由當事人本人提供外，有需要時，本院亦會透過網際網路，由政府、學校、及其他公開網站取得相關資訊。 </span><br>
					<br> <span> 九、您若不簽署本告知暨同意書，本院將無法採計您對此份問卷之填答意見。 </span><br>
					<br> <span> 十、對本院所持有您的個資，本院會按照政府相關法規予以保密並妥善保管。 </span><br>
					<br>
					<br> <span> 財團法人工業技術研究院 </span><br>
					<br> <span> 姓 名：蘇孟宗 </span><br>
					<br> <span> 職 稱：產業經濟與趨勢中心主任 </span><br>
					<br>
				</div>
			</div>
			
			<div class="applicant-data">
				<span>【同意事項】</span><br> 
				<span> 本人已閱讀並瞭解上述告知事項，並同意科技部、工研院、「運用法人鏈結產學合作計畫」網站及「鏈結產學媒合平台」(Industry-Academia Catalyst E-Platform, I-ACE) 網站在符合上述告知事項範圍內，蒐集、處理及利用本人的個資。本項同意得以電子文件方式表達。 </span>
				<s:checkbox label="同意" name="qnrCoopereateWay.aggreePDPL" />
				<ul id="ul-applicant-data">
					<li>
						<label>※為方便後續進行案例研析，請留下您的大名</label> 
					</li>
					<li>
						<s:textfield name="qnrCoopereateWay.name" maxlength="20"/>
					</li>
					<li>
						<label>Email</label>
					</li>
					<li>
						<s:textfield name="qnrCoopereateWay.email" type="email" maxlength="100"/>
					</li>
					<li>
						<label>聯絡地址(寄發禮品用)</label>
					</li>
					<li class="half">
						<s:textfield name="qnrCoopereateWay.address" maxlength="200"/>
					</li>
				</ul>
			</div>
	
			<div class="clear"></div>
	
			<input type="button" class="goToPart4 redBtn" value="上一頁">
			<input type="submit" class="redBtn" value="提交">					
		</div>
	</s:form>
</body>
</html>