<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
	 	// 注意: 在此頁面的重置按鈕記得要加上id
		$("#btn-reset").click(function(){
			$("input[type=text]").val("");
			$("select").prop('selectedIndex', 0);
		});
	});
</script>
</head>
<body>
	<s:include value="./banner.jsp" />

	<s:form action="index" method="post" validate="true">
		<s:hidden name="searchCondition.className"/>
<%-- 		<s:textfield name="searchCondition.className"/> --%>
	
		<!-- 分類 -->
		<div class="container top50">
			<div class="row">
				<s:include value="./index_searchSubTitle.jsp" />
			</div>
			<div class="row">
				<!-- 手機版 -->
				<s:include value="./mobile_menu.jsp" />
				<!-- PC版 -->
				<s:include value="./pc_menu.jsp" />
			
				<!-- 搜尋輸入區塊 -->
		        <div class="col-sm-12 col-xs-12">
		        	<div class="well">
		                <form class="form-group">
		                    <div class="row">
		                        <div class="col-sm-8 col-xs-12">
		                        	<s:textfield name="searchCondition.searchText" class="form-control" placeholder="搜尋" style="font-size:18px"/>
		                        </div>
		                        <div class="col-sm-4 col-xs-12">
		                        	<button type="submit" class="btn btn-primary" id="btn-search"><i class="fa fa-search-plus right5" aria-hidden="true"></i><span style="font-size:18px">搜尋</span></button>&nbsp;
									<button type="button" class="btn btn-default" id="btn-reset"><span style="font-size:18px">清除</span></button>
		                        </div>
		                    </div>
		                </form>
		            </div>
		        </div>
			</div>
		</div>

		<!-- 搜尋結果 -->
		<div class="container">
			<div class="row">
				<s:include value="./index_resultSubTitle.jsp" />
			</div>
			<s:include value="./technology-node-graph.jsp" />
			<div class="row">
				<s:include value="./pagination_top.jsp" />
			</div>
			<div class="row">
				<s:if test="pagedList == null || pagedList.list == null || pagedList.list.size == 0">
					<label style="font-size:24px; color:#FF0033;">查無資料，請重新查詢!</label>
				</s:if>
				<s:else>
					<s:iterator value="pagedList.list" status="stat">
						<!-- 研發成果 -->
						<s:if test="technology != null">
							<s:include value="./listItem_technology.jsp" />
						</s:if>
						<!-- 專利資料 -->
						<s:if test="patent != null">
							<s:include value="./listItem_patent.jsp" />
						</s:if>
						<!-- 合作案例 -->
						<s:if test="coopEx != null">
							<s:include value="./listItem_coopEx.jsp" />
						</s:if>
						<!-- 產學人才 -->
						<s:if test="talentedPeople != null">
							<s:include value="./listItem_talentedPeople.jsp" />
						</s:if>
						<!-- 育成中心 -->
						<s:if test="incubationCenter != null">
							<s:include value="./listItem_incubationCenter.jsp" />
						</s:if>
						<!-- 法規政策 -->
						<s:if test='literature != null'>
							<s:include value="./ListItem_policyAndLiterature.jsp" />
						</s:if>
						<!-- 活動/人培 -->
						<s:if test='activity != null'>
							<s:include value="./listItem_activity.jsp" />
						</s:if>
						<!-- 產業情報 -->
						<s:if test='industryInfo != null'>
							<s:include value="./listItem_industryInfo.jsp" />
						</s:if>
						<!-- 產業情報 -->
						<s:if test='news != null'>
							<s:include value="./listItem_news.jsp" />
						</s:if>
					</s:iterator>
				</s:else>
			</div>
			<div class="row">
				<s:include value="./pagination.jsp" />
			</div>
		</div>
	</s:form>
	<br>
</body>