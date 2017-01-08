<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function(){
		dropDownBoxSetting();
	});
</script>
<script>
	function dropDownBoxSetting() {
		$(".dropDownBox").mouseleave(function(){
			toggleDropDownBox();
			displaySelectedGrbDomains();
		});
	}

	var expanded = false;
	function toggleDropDownBox() {
		if (!expanded) {
			$(".dropDownBox").css("display","block")
			expanded = true;
		} else {
			$(".dropDownBox").css("display","none")
			expanded = false;
			displaySelectedGrbDomains();
		}
	}
	
	function displaySelectedGrbDomains() {
		var selectedGrbDomains = "";
		$("[name='researchPlan.grbDomainCodes']:checked").each(function(index){
			selectedGrbDomains += $(this).parents("li.li-grbDomain").find(".grbDomainName").val()+"; \r\n";
		});
		var selectCount = $("[name='researchPlan.grbDomainCodes']:checked").length;
		if (selectCount > 0) {
			$(".selectBox select option").html(selectedGrbDomains);
			$(".selectBox").attr("title", selectedGrbDomains);
		} else {
			$(".selectBox select option").html("選擇領域");
			$(".selectBox").removeAttr("title");
		}
	}
</script>
<style>
.selectBox { position: relative; width: 100%; }
.overSelect { position: absolute; left: 0; right: 13px; top: 0; bottom: 0; }
.dropDownBox { width:30%; background-color:rgba(255, 255, 255, 1.0) ; display:none; border:#e6eff5 1px solid; position:absolute; }
.dropDownBox label { display: block; font-size: 0.7em; }
.dropDownBox label:hover { background-color: #1e90ff; color:#ffffff; }
.dropDownBox li { margin:0; padding:0;}
</style>
<meta name="funcPathText" content="新增"/>
</head>
<body>
	<s:form action="createSubmit" method="post" validate="true">
		<div id="div-researchPlan">
			<h2 class="itemTitle Down">研究計畫資料</h2>
			<ul>
				<li class="all">
					<b>計畫名稱</b>
					<div>
						<s:textfield name="researchPlan.name" maxlength="1000" />
					</div>
				</li>
				<li class="quarter">
					<b>計畫編號</b>
					<div>
						<s:textfield name="researchPlan.planNo" maxlength="100" />
					</div>
				</li>
				<li class="eighth">
					<b>計畫主持人</b>
					<div>
						<s:textfield name="researchPlan.manager" maxlength="100" />
					</div>
				</li>
				<li class="eighth">
					<b>計畫年度</b>
					<div>
						<s:textfield name="researchPlan.year" placeholder="民國年" maxlength="4" />
					</div>
				</li>
				<li class="quarter">
					<b>GRB系統編號</b>
					<div>
						<s:textfield name="researchPlan.projkey" maxlength="100" />
					</div>
				</li>
				<li class="quarter">
					<b>成果報告ID</b>
					<div>
						<s:textfield name="researchPlan.grb05Id" maxlength="500" />
					</div>
				</li>
				<li class="half">
					<b>產業化潛力</b>
					<div>
						<s:select name="researchPlan.trlCode" list="optionTrlList" listKey="code" listValue="%{code +'-'+ name}"/>
					</div>
				</li>
				<li class="half">
					<b>研究領域</b>
					<div class="multiselect">
						<div class="selectBox" onclick="toggleDropDownBox()">
							<select><option>選擇領域</option></select>
							<div class="overSelect"></div>
						</div>
						<div class="dropDownBox">
							<ul>
								<s:iterator value="optionGrbDomainList" status="stat">
									<li class="all li-grbDomain">
										<s:checkbox id="%{'chkbox_'+id}" label="%{code + '-' + name}" name="researchPlan.grbDomainCodes" fieldValue="%{code}"/>  
										<input type="hidden" class="grbDomainName" value="<s:property value="name"/>" />
									</li>
								</s:iterator>
							</ul>
						</div>
					</div>
				</li>
				<li class="all">
					<b>計畫關鍵詞</b>
					<div>
						<s:textfield name="researchPlan.keyword" maxlength="1000" />
					</div>
				</li>
			</ul>
		</div>
	
		<div class="clear"></div>
		<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
			<s:submit cssClass="redBtn" value="送出" />
		</div>
	</s:form>
</body>
</html>