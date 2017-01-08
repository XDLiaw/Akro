<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<div class="col-sm-12 col-xs-12">
	<div class="well well-sm">
		<table class="table content_03" style="margin-bottom: 0;">
			<tbody>
				<tr>
					<td width="10%" style="border: none;"><h4>
						<span class="label label-danger">育成中心</span>
					</h4></td>
					<td width="10%" style="border: none;" class="date_01">學校名稱</td>
					<td style="border: none;">
						<s:url value="/f2/incubationCenter/showDetail" var="detailUrlTag" escapeAmp="false">
							<s:param name="id" value="incubationCenter.id" />
						</s:url>
						<a href="<s:property value="%{#detailUrlTag}"/>" class="list_link_01" target="_blank">
							<s:property value="incubationCenter.schoolNameCh" />
						</a>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">單位名稱</td>
					<td><s:property value="incubationCenter.orgNameCh" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">屬性</td>
					<td>
						<s:if test="incubationCenter.attribute == '01'">國立大專院校</s:if>
						<s:if test="incubationCenter.attribute == '02'">私立大專院校</s:if>
						<s:if test="incubationCenter.attribute == '03'">政府</s:if>
						<s:if test="incubationCenter.attribute == '04'">法人</s:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>