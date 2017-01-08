<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>


<div id="cooperation" class="panel-collapse collapse">
	<div class="panel-body">
		<table class="table table-condensed table-hover">
			<thead>
				<tr>
					<th>合作計畫或合約名稱</th>
					<th>合作廠商名稱</th>
					<th>合作有效期間</th>
					<th width="100">更新日期</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="talentedPeople.mainProjects" status="stat">
					<tr>
						<td><s:property value="name" /></td>
						<td><s:property value="coopComName" /></td>
						<td>
							<s:set var="start" value="%{yearStart+'年'+monthStart+'月'}"/>
							<s:set var="end" value="%{yearEnd+'年'+monthEnd+'月'}"/>
							<s:property value="%{#start+' ~ '+#end}" />
						</td>
						<td><s:property value="updateDate" /></td>
					</tr>
				</s:iterator>	
			</tbody>
		</table>
	</div>
</div>