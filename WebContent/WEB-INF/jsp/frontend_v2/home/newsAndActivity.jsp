<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<!-- 公告訊息&活動人培 -->
<div class="container top50">
	<div class="row">
		<!-- 公告訊息 -->
		<div class="col-sm-6 col-xs-12">
			<div>
				<div class="large_title_01">
					<i class="fa fa-file-text-o" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>公告訊息
					<div class="pull-right">
						<s:url value="/f2/news/init" var="urlTag" escapeAmp="false">
							<s:param name="searchCondition.category" value="@iace.entity.news.News@getCategoryList()[0].code" />
						</s:url>
						<a href="<s:property value="urlTag"/>"> 
							<img src="<s:url value="/images/frontend-v2/more_blue.png"/>" alt="" height="30" />
						</a>
					</div>
				</div>
				<div class="line_blue">&nbsp;</div>
				<div class="line_gray1px"></div>
			</div>
			<div>
				<table class="table">
					<tbody>
						<s:iterator value="newsList" status="stat">
						<tr>
							<td style="border:none;">
								<h4><span class="label label-info"><s:property value="category" /></span></h4>
							</td>
							<td style="border:none;">
								<s:url value="/f2/news/showDetail" var="detailUrlTag" escapeAmp="false">
									<s:param name="id" value="id" />
									<s:param name="searchCondition.category" value="category" />
								</s:url>
							
								<div class="truncate2">
									<span class="date_01"><s:date name="createTime" format="yyyy/MM/dd" /></span>&nbsp;
									<a href="<s:property value="%{#detailUrlTag}"/>" class="list_link_01">
										<s:property value="title" />
									</a>
								</div>
							</td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>

		<!-- 活動人培 -->
		<div class="col-sm-6 col-xs-12">
			<div>
				<div class="large_title_01">
					<i class="fa fa-calendar-check-o" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>活動人培
					<div class="pull-right">
						<s:url value="/f2/activity/init" var="urlTag" escapeAmp="false">
							<s:param name="searchCondition.category" value="@iace.entity.activity.Activity@getCategoryList()[0].code" />
						</s:url>
						<a href="<s:property value="urlTag"/>">
							<img src="<s:url value="/images/frontend-v2/more_blue.png"/>" alt="" height="30" />
						</a>
					</div>
				</div>
				<div class="line_blue">&nbsp;</div>
				<div class="line_gray1px"></div>
			</div>
			<div>
				<table class="table">
					<tbody>
						<s:iterator value="activityList" status="stat">
							<tr>
								<td width="15%" style="border:none;">
									<h4><span class="label label-info"><s:property value="category"/></span></h4>
								</td>
								<td style="border:none;">
									<div class="truncate2">
										<span class="date_01"><s:date name="createTime" format="yyyy/MM/dd" /></span>&nbsp;
										
										<s:url value="/f2/activity/showDetail" var="detailUrlTag" escapeAmp="false">
											<s:param name="id" value="id" />
											<s:param name="searchCondition.category" value="category" />
										</s:url>
										<a href="<s:property value="%{#detailUrlTag}"/>" class="list_link_01"><s:property value="title" /></a>
									</div>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>