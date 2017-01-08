<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">		
	$(document).ready(function () {
		validateSetting();
		paggingSetting();
	});
</script>
<script>
	function validateSetting() {
		$("form").submit(function(event) {
			var searchText = $("input[name='searchCondition.searchText']").val();
			if (searchText == "") {
				event.preventDefault();
				alert("請輸入關鍵詞");
			}
			return true;
		});
	}
</script>
<script>
	function paggingSetting() {
		$("ul.pagination > li > input").addClass("btn btn-default btn-sm");
		
		var pageIndex = parseInt('<s:property value="pagedList.pageIndex"/>');
		var pageNumber = parseInt('<s:property value="pagedList.pageNumber"/>');
		var pageCount = parseInt('<s:property value="pagedList.pageCount"/>');
		
		$("ul > li > input.btn-page").click(function() {
			$("#pageIndex").val($(this).attr("value") - 1);
			return true;
		});
		$("ul.pagination > li > input.btn-page[value='"+pageNumber+"']").addClass("active");

		//第一頁按鈕
		$("ul > li > input.btn-first-page").click(function() {
			$("#pageIndex").val(0);
		});
		
		//最後一頁按鈕
		$("ul > li > input.btn-last-page").click(function() {
			$("#pageIndex").val(pageCount-1);
		});
		
		//上一頁按鈕
		if (pageIndex == 0) {
			$("ul > li > input.btn-previous-page").addClass("disabled");
		}
		$("ul > li > input.btn-previous-page").click(function() {
			if (pageIndex > 0) {
				$("#pageIndex").val(pageIndex - 1);
				return true;
			} else {
				return false;
			}
		});
		
		//下一頁按鈕
		if (pageIndex == pageCount - 1) {
			$("ul > li > input.btn-next-page").addClass("disabled");
		}
		$("ul > li > input.btn-next-page").click(function() {
			if (pageIndex < (pageCount - 1)) {
				$("#pageIndex").val(pageIndex + 1);
				return true;
			} else {
				return false;
			}
		});
		
		// 每頁筆數
		$(".select-pageSize").change(function() {
			var pageSize = $(this).find(":checked").val();
			$("#pageSize").val(pageSize);
			$("#pageIndex").val(0);
			$("form").submit();
		});
		$(".select-pageSize").val($("#pageSize").val());
		
		// 注意: 在此頁面的搜尋按鈕記得要加上id
		$("#btn-search").click(function(){
			$("#pageIndex").val(0);
			return true;
		});
		// 注意: 在此頁面的重置按鈕記得要加上id
		$("#btn-reset").click(function(){
			$("input.form-control:text").val("");
			$("select").prop('selectedIndex', 0);
		});
	}
</script>
<style type="text/css">
	table td.type { font-size:16px; font-weight:bold; color:#5533cc; }
</style>
</head>
<body>
<div class="rightContent frontend">
	<s:form action="integrationSearch" method="post" validate="true" >
		<ul>
			<li class="quarter">
				<s:select name="searchCondition.className" list="classList" listKey="code" listValue="name" headerKey="" headerValue="全部"/>
			</li>
			<li class="half">
				<s:textfield placeholder="請輸入欲查詢的關鍵詞" name="searchCondition.searchText" />
			</li>
			<li class="quarter">
				<input type="submit" value="查詢" class="redBtn" id="btn-search"/>
				<input type="button" value="清除" class="grayBtn" id="btn-reset"/>
			</li>
		</ul>
		<div class="clear"></div>
		
		<div class="page">
			<s:set var="pgList" value="pagedList"/>
			<s:set var="pgIndex" value="searchCondition.pageIndex"/>
			<s:set var="pgCount" value="#pgList.pageCount"/>
			
			<ul class="pagination">
				<s:if test="#pgList != null && #pgCount > 0">
					<li><input type="submit" value="第一頁" class="btn-first-page" /></li>
					<li><input type="submit" value=&laquo; class="btn-previous-page" /></li>
					<s:if test="#pgIndex >= 5">
						<li>......</li>
					</s:if>
					<s:iterator value="#pgList.pageNumberList" status="stat" 
						begin="%{#pgIndex < 5 ? 0 : #pgIndex - 5 }"
						end="%{#pgIndex > #pgCount - 6 ? #pgCount -1 : #pgIndex +5 }">
						<li><input type="submit" value=<s:property/> class="btn-page" /></li>
					</s:iterator>
					<s:if test="#pgIndex <= #pgCount - 6">
						<li>......</li>
					</s:if>
					<li><input type="submit" value=&raquo;	class="btn-next-page" /></li>
					<li class="next"><input type="submit" value="最末頁" class="btn-last-page" /></li>
				</s:if>
				<li>
					<p>共 <s:property value="#pgList.totatlItemCount"/>筆資料</p>
				</li>
				<li>
					&nbsp;&nbsp;&nbsp;每頁筆數:
				</li>
				<li>
					<select class="select-pageSize">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>
				</li>
			</ul>
		</div>		
		
		<div>
			<table>
				<s:if test="pagedList != null">
					<s:iterator value="pagedList.list" status="stat">
						<tr><td colspan="5"><s:property value="%{pagedList.itemStart + #stat.count -1}" /><td></tr>
						<!-- 研發成果 -->
						<s:if test="technology != null">
							<tr>
								<td width="10%" class="type" rowspan="5">研發成果</td>
								<td width="10%"><b>計畫名稱</b></td>
								<td width="" colspan="3">
									<s:url value="/f/researchPlan/showDetail" var="detailUrlTag" escapeAmp="false">
										<s:param name="id" value="technology.researchPlan.id" />
									</s:url>
									<a href="<s:property value="%{#detailUrlTag}"/> " target="_blank">
										<s:property value="technology.researchPlan.name"/>
									</a>	
								</td>
							</tr>
							<tr>
								<td width="10%"><b>主持人</b></td>
								<td width="35%"><s:property value="technology.researchPlan.manager"/></td>
								<td width="10%"><b>年度</b></td>
								<td width="35%"><s:property value="technology.researchPlan.year"/></td>
							</tr>
							<tr>
								<td width="10%"><b>研究領域</b></td>
								<td width="" colspan="3">
									<s:if test="technology.researchPlan.grbDomains != null">
										<s:iterator value="technology.researchPlan.grbDomains" status="stat">
											<s:property value="showString"/>&nbsp;&nbsp;&nbsp;
										</s:iterator>
									</s:if>
								</td>
							</tr>
							<tr>
								<td width="10%"><b>技術名稱</b></td>
								<td width="" colspan="3"><s:property value="technology.name"/></td>
							</tr>
							<tr>
								<td width="10%"><b>技術簡述</b></td>
								<td width="" colspan="3"><s:property value="technology.descriptoin"/></td>
							</tr>
						</s:if>
						<!-- 專利資料 -->
						<s:if test="patent != null">
							<tr>
								<td width="10%" class="type" rowspan="4">專利資料</td>
								<td width="10%"><b>專利名稱</b></td>
								<td width="" colspan="3">
									<s:url value="/f/patent/showDetail" var="detailUrlTag" escapeAmp="false">
										<s:param name="id" value="patent.id" />
									</s:url>
									<a href="<s:property value="%{#detailUrlTag}"/> " target="_blank">
										<s:property value="patent.name"/>
									</a>	
								</td>
							</tr>
							<tr>
								<td width="10%"><b>專利權人</b></td>
								<td width="35%"><s:property value="patent.assignee"/></td>
								<td width="10%"><b>申請號</b></td>
								<td width="35%"><s:property value="patent.appliactionNo"/></td>
							</tr>
							<tr>
								<td width="10%"><b>申請國別</b></td>
								<td width="35%"><s:property value="patent.country.name"/></td>
								<td width="10%"><b>申請日</b></td>
								<td width="35%"><s:property value="patent.applicationDate"/></td>							
							</tr>
							<tr>
								<td width="10%"><b>狀態</b></td>
								<td width="35%"><s:property value="patent.patentStatus"/></td>
								<td width="10%"><b>專利技術領域</b></td>
								<td width="35%"><s:property value="patent.techField.name"/></td>							
							</tr>
						</s:if>
						<!-- 產學人才 -->
						<s:if test="talentedPeople != null">
							<tr>
								<td width="10%" class="type" rowspan="4">產學人才</td>
								<td width="10%"><b>姓名</b></td>
								<td width="35%">
									<s:url value="/f/talentedPeople/showDetail" var="detailUrlTag" escapeAmp="false">
										<s:param name="id" value="talentedPeople.id" />
									</s:url>
									<a href="<s:property value="%{#detailUrlTag}"/> " target="_blank">
										<s:property value="talentedPeople.nameCh"/>
									</a>	
								</td>
								<td width="10%"><b>性別</b></td>
								<td width="35%"><s:property value="talentedPeople.gender"/></td>
							</tr>
							<tr>
								<td width="10%"><b>現職單位</b></td>
								<td width="" colspan="3"><s:property value="talentedPeople.workOrg"/></td>
							</tr>
							<tr>
								<td width="10%"><b>現職職位</b></td>
								<td width="" colspan="3"><s:property value="talentedPeople.job"/></td>
							</tr>
							<tr>
								<td width="10%"><b>合作專長</b></td>
								<td width="" colspan="3"><s:property value="talentedPeople.specialty"/></td>
							</tr>
						</s:if>
						<!-- 合作案例 -->
						<s:if test="coopEx != null">
							<tr>
								<td width="10%" class="type" rowspan="4">合作案例</td>
								<td width="10%"><b>標題</b></td>
								<td width="" colspan="3">
									<s:url value="/f/coopEx/showDetail" var="detailUrlTag" escapeAmp="false">
										<s:param name="id" value="coopEx.id" />
									</s:url>
									<a href="<s:property value="%{#detailUrlTag}"/> " target="_blank">
										<s:property value="coopEx.title"/>
									</a>	
								</td>
							</tr>
							<tr>
								<td width="10%"><b>案名</b></td>
								<td width="" colspan="3"><s:property value="coopEx.projName"/></td>
							</tr>
							<tr>
								<td width="10%"><b>年度</b></td>
								<td width="35%"><s:property value="coopEx.year"/></td>
								<td width="10%"><b>研發團隊</b></td>
								<td width="35%"><s:property value="coopEx.rdTeam"/></td>							
							</tr>
							<tr>
								<td width="10%"><b>類別</b></td>
								<td width="35%"><s:property value="coopEx.type"/></td>
								<td width="10%"><b>輔導團隊</b></td>
								<td width="35%"><s:property value="coopEx.assisTeam"/></td>							
							</tr>
						</s:if>
						<!-- 法規政策 -->
						<s:if test='literature != null && literature.category.equals("法規政策")'>
							<tr>
								<td width="10%" class="type" rowspan="2">法規政策</td>
								<td width="10%"><b>題名</b></td>
								<td width="" colspan="3">
									<a href="<s:property value="literature.linkUrl"/>" target="_blank">
										<s:property value="literature.titleC"/>
									</a>
								</td>
							</tr>
							<tr>
								<td width="10%"><b>語文</b></td>
								<td width="35%"><s:property value="literature.language"/></td>
								<td width="10%"><b>出版年</b></td>
								<td width="35%"><s:property value="literature.publishYear"/></td>							
							</tr>							
						</s:if>
						<!-- 文獻 -->
						<s:if test='literature != null && literature.category.equals("文獻")'>
							<tr>
								<td width="10%" class="type" rowspan="3">文獻</td>
								<td width="10%"><b>題名</b></td>
								<td width="" colspan="3">
									<s:url value="/f/literature/showDetail" var="detailUrlTag" escapeAmp="false">
										<s:param name="id" value="literature.id" />
									</s:url>
									<a href="<s:property value="%{#detailUrlTag}"/> " target="_blank">
										<s:property value="literature.titleC"/>
									</a>	
								</td>
							</tr>
							<tr>
								<td width="10%"><b>作者</b></td>
								<td width="35%"><s:property value="literature.authorC"/></td>
								<td width="10%"><b>語文</b></td>
								<td width="35%"><s:property value="literature.language"/></td>							
							</tr>
							<tr>
								<td width="10%"><b>卷期頁碼(頁數)</b></td>
								<td width="35%"><s:property value="literature.pagination"/></td>
								<td width="10%"><b>出版年</b></td>
								<td width="35%"><s:property value="literature.publishYear"/></td>							
							</tr>
						</s:if>
						<!-- 育成中心 -->
						<s:if test="incubationCenter != null">
							<tr>
								<td width="10%" class="type" rowspan="3">育成中心</td>
								<td width="10%"><b>學校名稱</b></td>
								<td width="" colspan="3">
									<s:url value="/f/incubationCenter/showDetail" var="detailUrlTag" escapeAmp="false">
										<s:param name="id" value="incubationCenter.id" />
									</s:url>
									<a href="<s:property value="%{#detailUrlTag}"/> " target="_blank">
										<s:property value="incubationCenter.schoolNameCh"/>
									</a>	
								</td>
							</tr>
							<tr>
								<td width="10%"><b>單位名稱</b></td>
								<td width="" colspan="3"><s:property value="incubationCenter.orgNameCh"/></td>
							</tr>
							<tr>
								<td width="10%"><b>屬性</b></td>
								<td width="" colspan="3">
									<s:if test="incubationCenter.attribute == '01'">國立大專院校</s:if>
									<s:if test="incubationCenter.attribute == '02'">私立大專院校</s:if>
									<s:if test="incubationCenter.attribute == '03'">政府</s:if>
									<s:if test="incubationCenter.attribute == '04'">法人</s:if>
								</td>
							</tr>
						</s:if>
					</s:iterator>
				</s:if>
			</table>
		</div>		
		
		<div class="page">
			<s:hidden id="pageIndex" name="searchCondition.pageIndex" />
			<s:hidden id="pageSize" name="searchCondition.pageSize" />
			
			<s:set var="pgList" value="pagedList"/>
			<s:set var="pgIndex" value="searchCondition.pageIndex"/>
			<s:set var="pgCount" value="#pgList.pageCount"/>
			
			<ul class="pagination">
				<s:if test="#pgList != null && #pgCount > 0">
					<li><input type="submit" value="第一頁" class="btn-first-page" /></li>
					<li><input type="submit" value=&laquo; class="btn-previous-page" /></li>
					<s:if test="#pgIndex >= 5">
						<li>......</li>
					</s:if>
					<s:iterator value="#pgList.pageNumberList" status="stat" 
						begin="%{#pgIndex < 5 ? 0 : #pgIndex - 5 }"
						end="%{#pgIndex > #pgCount - 6 ? #pgCount -1 : #pgIndex +5 }">
						<li><input type="submit" value=<s:property/> class="btn-page" /></li>
					</s:iterator>
					<s:if test="#pgIndex <= #pgCount - 6">
						<li>......</li>
					</s:if>
					<li><input type="submit" value=&raquo;	class="btn-next-page" /></li>
					<li class="next"><input type="submit" value="最末頁" class="btn-last-page" /></li>
				</s:if>
				<li>
					<p>共 <s:property value="#pgList.totatlItemCount"/>筆資料</p>
				</li>
				<li>
					&nbsp;&nbsp;&nbsp;每頁筆數:
				</li>
				<li>
					<select class="select-pageSize">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>
				</li>
			</ul>
		</div>	

	</s:form>
</div>
</body>