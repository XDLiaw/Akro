<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
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
			$("#form-createTechnology").append($(this).clone());
			$("#form-updateTechnology").append($(this).clone());
		});
	}
</script>
<meta name="funcPathText" content="編輯管理  > 編輯"/>
</head>
<body>
<div class="rightContent frontend">
	<div id="div-researchPlan">
		<h2 class="itemTitle Down">研究計畫資料</h2>
		<ul>
			<li class="all">
				<b>計畫名稱</b>
				<div>
					<s:property value="researchPlan.name" />
				</div>
			</li>
			<li class="eighth">
				<b>計畫主持人</b>
				<div>
					<s:property value="researchPlan.manager" />
				</div>
			</li>
			<li class="eighth">
				<b>計畫年度</b>
				<div>
					<s:property value="researchPlan.year" />
				</div>
			</li>
			<li class="half">
				<b>計畫編號</b>
				<div>
					<s:property value="researchPlan.planNo" />
				</div>
			</li>
			<li class="quarter">
				<b>GRB系統編號</b>
				<div>
					<s:property value="researchPlan.projkey" />
				</div>
			</li>
			<li class="half">
				<b>產業化潛力</b>
				<div>
					<s:property value="%{researchPlan.trl.showString}" />
				</div>
			</li>
			<li class="half">
				<b>研究領域</b>
				<div>
					<s:if test="researchPlan.grbDomains != null">
						<s:iterator value="researchPlan.grbDomains" status="stat">
							<s:property value="name"/>&nbsp;&nbsp;&nbsp;
						</s:iterator>
					</s:if>	
				</div>
			</li>
			<li class="all">
				<b>計畫關鍵詞</b>
				<div>
					<s:property value="researchPlan.keyword" />
				</div>				
			</li>
		</ul>
	</div>
	<div class="clear"><hr></div>		
	<div id="div-technologhList">
		<h2 class="itemTitle Down">研發成果列表</h2>
		<table id="rndResultsTable" class="">
			<thead>
				<tr>
					<th nowrap width="2%">No.</th>
					<th nowrap width="">技術名稱</th>
					<th nowrap width="">技術簡述</th>
				</tr>
			</thead>
			<tbody>
				<s:if test="researchPlan.technologies != null">
					<s:iterator value="researchPlan.technologies" status="stat">
						<tr>
							<td><s:property value="#stat.count" /></td>
							<td><s:property value="name"/></td>
							<td><s:property value="descriptoin"/></td>
						</tr>
					</s:iterator>
				</s:if>
			</tbody>
		</table>
	</div>
	<div class="clear"></div>
	<div class="bottom-btn-block">
		<s:if test="fromHomePage">
			<input type="button" class="grayBtn" value="研發成果查詢" 
				onclick="window.location.href='<s:url value="/f/researchPlan/init"/>'"/>
		</s:if>
		<s:else>
			<input type="button" class="grayBtn" id="btn-back" value="回列表頁"/>
		</s:else>
	</div>	
	<form action="index" method="post" id="form-backToIndex">
		<s:hidden name="searchCondition.planName"/>
		<s:hidden name="searchCondition.planNo"/>
		<s:hidden name="searchCondition.year"/>
		<s:hidden name="searchCondition.keyword"/>
		<s:hidden name="searchCondition.trlId"/>
		<s:hidden name="searchCondition.manager"/>
		<s:hidden name="searchCondition.grbDomainId"/>
		<s:hidden name="searchCondition.technologyName"/>
		<s:hidden name="searchCondition.technologyTrlId"/>		
		<s:hidden name="searchCondition.pageIndex"/>
		<s:hidden name="searchCondition.pageSize"/>
	</form>
		
	<div class="clear"></div>
</div>
</body>
</html>