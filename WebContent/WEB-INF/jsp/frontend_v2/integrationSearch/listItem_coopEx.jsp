<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<div class="col-sm-12 col-xs-12">
	<div class="well well-sm">
		<table class="table content_03" style="margin-bottom: 0;">
			<tbody>
				<tr>
					<td width="10%" style="border: none;"><h4>
						<span class="label label-primary">合作案例</span>
					</h4></td>
					<td width="10%" style="border: none;" class="date_01">標題</td>
					<td style="border: none;">
						<s:url value="/f2/coopEx/showDetail" var="detailUrlTag" escapeAmp="false">
							<s:param name="id" value="coopEx.id" />
							<s:param name="searchCondition.type" value="coopEx.type" />
						</s:url> 
						<a href="<s:property value="%{#detailUrlTag}"/>" class="list_link_01" target="_blank"> 
							<s:property value="coopEx.title" />
						</a>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">案名</td>
					<td><s:property value="coopEx.projName" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">年度</td>
					<td><s:property value="coopEx.year" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">研發團隊</td>
					<td><s:property value="coopEx.rdTeam" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">類別</td>
					<td><s:property value="coopEx.type" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">輔導團隊</td>
					<td><s:property value="coopEx.assisTeam" /></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>