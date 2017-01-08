<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<div class="col-sm-12 col-xs-12">
	<div class="well well-sm">
		<table class="table content_03" style="margin-bottom: 0;">
			<tbody>
				<tr>
					<td width="10%" style="border: none;"><h4>
						<span class="label label-warning">產學人才</span>
					</h4></td>
					<td width="10%" style="border: none;" class="date_01">姓名</td>
					<td style="border: none;">
						<s:url value="/f2/talentedPeople/showDetail" var="detailUrlTag" escapeAmp="false">
							<s:param name="id" value="talentedPeople.id" />
						</s:url>
						<a href="<s:property value="%{#detailUrlTag}"/>" class="list_link_01" target="_blank">
							<s:property value="talentedPeople.nameCh" />
						</a>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">性別</td>
					<td><s:property value="talentedPeople.gender" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">現職單位</td>
					<td><s:property value="talentedPeople.workOrg" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">現職職位</td>
					<td><s:property value="talentedPeople.job" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">合作專長</td>
					<td><s:property value="talentedPeople.specialty" /></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>