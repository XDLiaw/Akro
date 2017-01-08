<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<div class="col-sm-12 col-xs-12">
	<div class="well well-sm">
		<table class="table content_03" style="margin-bottom: 0;">
			<tbody>
				<tr>
					<td width="10%" style="border: none;"><h4>
						<span class="label label-success">專利資料</span>
					</h4></td>
					<td width="10%" style="border: none;" class="date_01">專利名稱</td>
					<td style="border: none;">
						<s:url value="/f2/patent/showDetail" var="detailUrlTag" escapeAmp="false">
							<s:param name="id" value="patent.id" />
						</s:url> 
						<a href="<s:property value="%{#detailUrlTag}"/>" class="list_link_01" target="_blank">
							<s:property value="patent.name" />
						</a>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">專利權人</td>
					<td><s:property value="patent.assignee" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">申請號</td>
					<td><s:property value="patent.appliactionNo" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">申請國別</td>
					<td><s:property value="patent.country.name" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">申請日</td>
					<td><s:property value="patent.applicationDate" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">狀態</td>
					<td><s:property value="patent.patentStatus" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">專利技術領域</td>
					<td><s:property value="patent.techField.name" /></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

