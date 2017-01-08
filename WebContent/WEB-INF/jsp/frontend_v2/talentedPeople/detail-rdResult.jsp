<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<script>
	$(document).ready(function(){
		$("#research .detailBtn").click(function(){
			var rowIndex = $("#research tbody tr").index($(this).parents('tr'));
			$("#research tbody tr").eq(rowIndex+1).slideToggle('fast');
		});
	});
</script>


<div id="research" class="panel-collapse collapse">
	<div class="panel-body">
		<table class="table table-condensed table-hover">
			<thead>
				<tr>
					<th>研發成果名稱</th>
					<th width="100">型式</th>
					<th width="100">更新日期</th>
					<th width="20">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="talentedPeople.rdResults" status="stat">
					<tr>
						<td><s:property value="name"/></td>
						<td><s:property value="type"/></td>
						<td><s:property value="updateDate"/></td>
						<td>
							<a href="#####" class="detailBtn">
								<i class="fa fa-file-text-o" aria-hidden="true" style="font-size: 18px;"></i>
							</a>
						</td>
					</tr>
					<tr class="detail" style="display: none;">
						<td bgcolor="#ccf2ff" colspan="4">
							<table class="table content_03" style="margin-bottom: 0;">
								<tr>
									<td class="date_01" width="15%">國別</td>
									<td><s:property value="optionCountry.name"/></td>
									<td class="date_01" width="15%">專利期間</td>
									<td>
										<s:property value="%{patentPeriodStart+(patentPeriodEnd != null ? ' ~ '+patentPeriodEnd : '')}" />
									</td>
									<td class="date_01" width="15%">專利號/申請號</td>
									<td><s:property value="patentNo"/></td>
								</tr>
								<tr>
									<td class="date_01">發明人</td>
									<td colspan="5"><s:property value="inventer"/></td>
								</tr>
								<tr>									
									<td class="date_01">所有權人</td>
									<td colspan="5"><s:property value="owner"/></td>
								</tr>
								<tr>
									<td class="date_01">摘要</td>
									<td colspan="5"><s:property value="patentAbstract"/></td>
								</tr>
								<tr>
									<td class="date_01">應用產業/範圍</td>
									<td colspan="5"><s:property value="usage"/></td>
								</tr>								
							</table>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>
