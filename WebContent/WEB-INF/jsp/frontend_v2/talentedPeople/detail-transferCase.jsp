<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<div id="transfer" class="panel-collapse collapse">
	<div class="panel-body">
		<table class="table table-condensed table-hover">
			<thead>
				<tr>
					<th>應用領域</th>
					<th>對象廠商或機構</th>
					<th>授權期間或讓受/技轉時間</th>
					<th width="100">更新日期</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="talentedPeople.transferCases" status="stat">
					<tr>
						<td><s:property value="applyField" /></td>
						<td><s:property value="targetOrg" /></td>
						<td>
							<s:set var="start" value="%{yearStart+'年'+monthStart+'月'}"/>
							<s:set var="end" value="%{yearEnd+'年'+monthEnd+'月'}"/>
							<s:property value="%{#start+(#end != null ? ' ~ '+#end : '')}" />
						</td>
						<td><s:property value="updateDate" /></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>