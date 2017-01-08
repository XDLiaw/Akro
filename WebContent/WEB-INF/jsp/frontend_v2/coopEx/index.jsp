<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn-reset").click(function() {
			$("input[type=text]").val("");
			$("select").prop('selectedIndex', 0);
		});
	});
</script>
</head>
<body>
	<!-- Banner -->
	<s:include value="./banner.jsp" />
	
	<!-- Main -->
	<div class="container top50">
		<div class="row">
			<div class="col-sm-12 col-xs-12">
				<div>
					<div class="large_title_01">
						<i class="fa fa-calendar-check-o" aria-hidden="true" style="font-size:18px; margin-right:5px;"></i>產學合作案例
					</div>
					<div class="line_blue">&nbsp;</div>
					<div class="line_gray1px bottom20"></div>
				</div>
			</div>
		</div>
		<div>
			<!-- 左選單 -->
			<div class="col-sm-3 col-xs-12 bottom20">
				<s:include value="./left_menu.jsp" />
			</div>
			<!-- 右列表 -->
			<div class="col-sm-9 col-xs-12 bottom20">
				<s:form action="index" method="post" validate="true">
					<s:hidden name="searchCondition.type" />
					<div class="well">
						<div class="row">
							<div class="col-sm-3 col-xs-12">
								<s:select name="searchCondition.year" list="#{'':'--年份--', '2016':'2016', '2015':'2015', '2014':'2014', '2013':'2013'}" class="form-control" />
							</div>
							<div class="col-sm-6 col-xs-12">
								<s:textfield placeholder="關鍵字" name="searchCondition.searchText" class="form-control"/>
							</div>
							<div class="col-sm-3 col-xs-12">
								<button type="submit" class="btn btn-primary" id="btn-search">
									<i class="fa fa-search-plus right5" aria-hidden="true"></i>搜尋
								</button>
								&nbsp;
								<button type="button" class="btn btn-default" id="btn-reset">清除</button>
							</div>
						</div>
					</div>
					<div>
						<s:if test="coopExPagedList != null">
							<s:iterator value="coopExPagedList.list" status="stat">
								<div class="row">
									<div class="col-lg-3 col-md-4 col-sm-12 col-cs-12">
										<div class="list-thumbnail img_radius">
											<img src="data:image;base64,<s:property value="base64Thumbnail"/>" class="img-responsive" alt=""/>
										</div>
									</div>
									<div class="col-lg-9 col-md-8 col-sm-12 col-cs-12">
										<div>
											<s:url value="/f2/coopEx/showDetail" var="detailUrlTag" escapeAmp="false">
												<s:param name="id" value="id" />
												<s:param name="searchCondition.projName" value="searchCondition.projName" />
												<s:param name="searchCondition.type" value="searchCondition.type" />
												<s:param name="searchCondition.year" value="searchCondition.year" />
												<s:param name="searchCondition.pageIndex" value="searchCondition.pageIndex" />
												<s:param name="searchCondition.pageSize" value="searchCondition.pageSize" />
											</s:url>
											<a href="<s:property value="%{#detailUrlTag}"/>" class="list_link_01" style="color:#1EB0FF;">
												<s:property value="title"/>
											</a>
										</div>
										<div class="date_01">研發團隊：<s:property value="rdTeam"/></div>
										<div class="date_01">輔導團隊：<s:property value="assisTeam"/></div>
										<div class="top10 truncate_list"><s:property value="contentWithoutHTML"/></div>
									</div>
								</div>
								<div class="line_solid"></div>
							</s:iterator>
						</s:if>	
					</div>
					<!-- 換頁 -->
					<s:include value="./pagination.jsp" />
				</s:form>
			</div>
		</div>
	</div>
</body>
</html>