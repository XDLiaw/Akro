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
						<i class="fa fa-file-text-o" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>公告訊息
					</div>
					<div class="line_blue">&nbsp;</div>
					<div class="line_gray1px bottom20"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- 左選單 -->
			<div class="col-sm-3 col-xs-12 bottom20">
				<s:include value="./left_menu.jsp" />
			</div>
			<!-- 右列表 -->
			<div class="col-sm-9 col-xs-12 bottom20">
				<s:form action="index" method="post" validate="true">
					<s:hidden name="searchCondition.category" />
					<div class="well">
						<div class="row">
							<div class="col-sm-3 col-xs-12">
								<s:select name="searchCondition.year" list="#{'':'--年份--', '2016':'2016', '2015':'2015', '2014':'2014', '2013':'2013'}" class="form-control" />
							</div>
							<div class="col-sm-6 col-xs-12">
								<s:textfield placeholder="主題" name="searchCondition.searchText" class="form-control"/>
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
						<table class="table">
							<thead>
								<tr>
									<th width="15%">發佈日期</th>
									<th>主題</th>
								</tr>
							</thead>
							<tbody>
								<s:if test="newsPagedList != null">
									<s:iterator value="newsPagedList.list" status="stat">
										<tr>
											<s:url value="/f2/news/showDetail" var="detailUrlTag" escapeAmp="false">
												<s:param name="id" value="id" />
												<s:param name="searchCondition.searchText" value="searchCondition.searchText" />
												<s:param name="searchCondition.category" value="category" />
												<s:param name="searchCondition.year" value="searchCondition.year" />
												<s:param name="searchCondition.pageIndex" value="searchCondition.pageIndex" />
												<s:param name="searchCondition.pageSize" value="searchCondition.pageSize" />
											</s:url>
											<td class="date_01"><s:date name="createTime" format="yyyy/M/d"/></td>
											<td><a href="<s:property value="%{#detailUrlTag}"/>" class="list_link_01"><s:property value="title"/></a></td>
										</tr>
									</s:iterator>
								</s:if>	
							</tbody>
						</table>
					</div>
					<div class="line_solid"></div>
					<!-- 換頁 -->
					<s:include value="./pagination.jsp" />
				</s:form>
			</div>
		</div>
	</div>
</body>
</html>