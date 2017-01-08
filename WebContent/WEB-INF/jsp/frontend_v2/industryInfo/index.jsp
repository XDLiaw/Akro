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
						<i class="fa fa-file-text-o" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>產業情報
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
					
					<div>
						<table class="table">
							<thead>
								<tr>
									<th width="15%">發佈日期</th>
									<th>主題</th>
									<th width="20%">來源/作者</th>
								</tr>
							</thead>
							<tbody>
								<s:if test="industryInfoPagedList != null">
									<s:iterator value="industryInfoPagedList.list" status="stat">
										<tr>
											<td class="date_01"><s:date name="postDate" format="yyyy/M/d"/></td>
											<td>
												<a href="<s:property value="link"/>" class="list_link_01" target="_blank">
													<s:property value="title" escapeHtml="false"/>
												</a>
											</td>
											<td><s:property value="source"/></td>
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