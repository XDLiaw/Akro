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
		
		$(".btn-open").click(function(){
			$(this).parents("tr").find(".btn-open").toggle();
			$(this).parents("tr").find(".btn-close").toggle();
			var rowIndex = $(this).parents("tr").index();
			$("#table-faq tbody tr").eq(rowIndex+1).toggle();
		});
		$(".btn-close").click(function(){
			$(this).parents("tr").find(".btn-open").toggle();
			$(this).parents("tr").find(".btn-close").toggle();
			var rowIndex = $(this).parents("tr").index();
			$("#table-faq tbody tr").eq(rowIndex+1).toggle();
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
						<i class="fa fa-file-text-o" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>常問集
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
							<div class="col-sm-9 col-xs-12">
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
						<table class="table" id="table-faq">
							<thead>
								<tr>
									<th width="15%">發佈日期</th>
									<th>主題</th>
									<th width="10%">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<s:if test="faqPagedList != null">
									<s:iterator value="faqPagedList.list" status="stat">
										<tr class="info">
											<td class="date_01"><s:date name="createTime" format="yyyy/M/d" /></td>
											<td><s:property value="title"/></td>
											<td><button class="btn btn-default btn-open" type="button">
													<i class="fa fa-plus right5" aria-hidden="true"></i>展開
												</button>
												<button class="btn btn-default btn-close" type="button" style="display: none">
													<i class="fa fa-minus right5" aria-hidden="true"></i>收合
												</button>
											</td>
										</tr>
										<tr class="active ans" style="display: none">
											<td colspan="3">
												<div class="content_01">
													<s:property value="content" escapeHtml="false"/>
												</div>
											</td>
										</tr>
									</s:iterator>
								</s:if>
							</tbody>
						</table>
					</div>
					<!-- 換頁 -->
					<s:include value="./pagination.jsp" />
				</s:form>
			</div>
		</div>
	</div>
</body>
</html>