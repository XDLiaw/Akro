<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<!-- 產學新聞 -->
<div style="background-image:url('<s:url value="/images/frontend-v2/banner_index_04.jpg"/>'); background-size:cover; margin-top:50px; padding-bottom:30px;">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-xs-12 top50">
				<div>
					<div class="large_title_02">
						<i class="fa fa-globe" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>新聞雷達
						<div class="pull-right">
							<s:url value="/f2/industryInfo/init" var="urlTag" escapeAmp="false">
								<s:param name="searchCondition.category" value="@iace.entity.industryInfo.IndustryInfo@getCategoryList()[0].code" />
							</s:url>
							<a href="<s:property value="%{#urlTag}"/>">
								<img src="<s:url value="/images/frontend-v2/more_blue.png"/>" alt="" height="30" />
							</a>
						</div>
					</div>
					<div class="line_blue">&nbsp;</div>
					<div class="line_gray1px"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-xs-12">
				<div class="top10">
					<table class="table">
						<tbody>
							<s:iterator value="industryInfoList1" status="stat">
								<tr>
									<td style="border:none;">
										<div class="truncate">
											<span class="date_02"><s:date name="postDate" format="yyyy/MM/dd" /></span>&nbsp;&nbsp;&nbsp;
											<a href="<s:property value="link"/>" class="list_link_02" target="_blank"><s:property value="title"/></a>
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
</div>


<!-- 產業評析 -->
<div class="report_01">
	<div class="container">
		<div class="row">
			<div class="col-sm-offset-6 col-sm-6 col-xs-12 top50">
				<div>
					<div class="large_title_01">
						<i class="fa fa-pie-chart" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>產業評析
						<div class="pull-right">
							<s:url value="/f2/industryInfo/init" var="urlTag" escapeAmp="false">
								<s:param name="searchCondition.category" value="@iace.entity.industryInfo.IndustryInfo@getCategoryList()[1].code" />
							</s:url>
							<a href="<s:property value="%{#urlTag}"/>">
								<img src="<s:url value="/images/frontend-v2/more_blue.png"/>" alt="" height="30" />
							</a>
						</div>
					</div>
					<div class="line_blue">&nbsp;</div>
					<div class="line_gray1px"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-offset-6 col-sm-6 col-xs-12">
				<div class="top10">
					<table class="table">
						<tbody>
							<s:iterator value="industryInfoList2" status="stat">
								<tr>
									<td style="border:none;">
										<div class="truncate">
											<span class="date_01"><s:date name="postDate" format="yyyy/MM/dd" /></span>&nbsp;&nbsp;&nbsp;
											<a href="<s:property value="link"/>" class="list_link_01" target="_blank">
												<s:property value="title" escapeHtml="false"/>
											</a>
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
</div>