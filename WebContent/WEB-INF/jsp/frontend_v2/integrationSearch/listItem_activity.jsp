<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<div class="col-sm-12 col-xs-12">
	<div class="well well-sm">
		<table class="table content_03" style="margin-bottom: 0;">
			<tbody>
				<tr>
					<td width="10%" style="border: none;">
						<h4>
							<span class="label label-pink">活動/人培</span>
						</h4>
						<h4>
							<span class="label label-default">
								<i class="fa fa-cube right5" aria-hidden="true"></i>
								<s:property value="activity.category"/>
							</span>
						</h4>
					</td>
					<td width="10%" style="border: none;" class="date_01">主題</td>
					<td style="border: none;">
						<s:url value="/f2/activity/showDetail" var="detailUrlTag" escapeAmp="false">
							<s:param name="id" value="activity.id" />
							<s:param name="searchCondition.category" value="activity.category" />
						</s:url> 
						<a href="<s:property value="%{#detailUrlTag}"/>" class="list_link_01" target="_blank">
							<s:property value="activity.title"/>
						</a>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">活動日期</td>
					<td><s:property value="activity.actDate"/></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">活動地點</td>
					<td><s:property value="activity.actAddress"/></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td>&nbsp;</td> -->
<!-- 					<td class="date_01">內容</td> -->
<!-- 					<td> -->
<!-- 						<img src="images/pic_07.jpg" class="img_radius" align="left" vspace="1" hspace="1" style="max-width: 200px; margin-right: 15px;" alt="" /> -->
<%-- 						<s:property value="activity.content"/> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
			</tbody>
		</table>
	</div>
</div>