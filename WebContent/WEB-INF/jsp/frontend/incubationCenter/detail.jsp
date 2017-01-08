<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function(){
		attributeTableColumnSetting();
		
		$("#btn-back").click(function(){				
			$("#form-backToIndex").submit();
		});
	});
</script>
<script>
	function attributeTableColumnSetting() {
		$(".attribute").each(function(index){
			var code = $(this).html();
			var name = $("select[name='searchCondition.attribute'] option[value="+code+"]").html();
			$(this).html(name);
		});
	}
</script>
<meta name="funcPathText" content="編輯管理  > 檢視"/>
</head>
<body>
<div class="rightContent frontend">
	<div style="display:none;">
		<s:select name="searchCondition.attribute" list="attributeList" listKey="code" listValue="%{name}" headerKey="" headerValue="請選擇屬性" />
	</div>
	
	<ul>
		<li class="third">
			<b>屬性</b>
			<div class="border-text attribute">
				<s:property value="incubationCenter.attribute"/>
			</div>
		</li>
		<li class="third">
			<b>學校中文名稱</b>
			<div class="border-text"><s:property value="incubationCenter.schoolNameCh"/></div>
		</li>	
		<li class="third">
			<b>單位中文名稱</b>
			<div class="border-text"><s:property value="incubationCenter.orgNameCh"/></div>
		</li>
		<li class="third">
			<b>單位負責人</b>
			<div class="border-text"><s:property value="incubationCenter.bossName"/></div>
		</li>			
		<li class="third">
			<b>職稱</b>
			<div class="border-text"><s:property value="incubationCenter.bossTitle"/></div>
		</li>
		<li class="third">
			<b>電話</b>
			<div class="border-text"><s:property value="incubationCenter.tel"/></div>
		</li>
		<li class="all">
			<b>單位地址</b>
			<div class="border-text"><s:property value="incubationCenter.address"/></div>
		</li>
		<li class="all">
			<b>電子信箱</b>
			<div class="border-text"><s:property value="incubationCenter.email"/></div>
		</li>						
		<li class="all">
			<b>網址</b>
			<div class="border-text">
				<a href="<s:property value="incubationCenter.url"/>" target="_blank">
					<s:property value="incubationCenter.url"/>
				</a>
			</div>
		</li>						
		<li class="all">
			<b>單位歷史</b>
			<div class="border-text">
				<s:property value="incubationCenter.orgHistory"/>
			</div>
		</li>						
	</ul>
	<div class="clear"></div>
	<div style="width: 80%; text-align: center; margin: 20px auto 40px auto;">
		<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>	
	</div>	
	<form action="index" method="post" id="form-backToIndex">
		<s:hidden name="searchCondition.name"/>
		<s:hidden name="searchCondition.attribute"/>
		<s:hidden name="searchCondition.pageIndex"/>
		<s:hidden name="searchCondition.pageSize"/>
	</form>
</div>	
</body>
</html>