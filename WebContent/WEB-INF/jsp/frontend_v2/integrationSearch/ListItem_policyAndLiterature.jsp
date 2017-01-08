<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<div class="col-sm-12 col-xs-12">
	<div class="well well-sm">
		<table class="table content_03" style="margin-bottom: 0;">
			<tbody>
				<tr>
					<td width="10%" style="border: none;"><h4>
						<span class="label label-purple"><s:property value="literature.category" /></span>
					</h4></td>
					<td width="10%" style="border: none;" class="date_01">題名</td>
					<td style="border: none;">
						<s:if test="literature.category == '文獻'">
							<s:url value="/f2/literature/showDetail" var="detailUrlTag" escapeAmp="false">
								<s:param name="id" value="literature.id" />
							</s:url>
						</s:if>
						<s:else>
							<s:url value="/f2/policy/showDetail" var="detailUrlTag" escapeAmp="false">
								<s:param name="id" value="literature.id" />
							</s:url>
						</s:else>
						<a href="<s:property value="%{#detailUrlTag}"/>" class="list_link_01" target="_blank">
							<s:property value="literature.title" />
						</a>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">語文</td>
					<td><s:property value="literature.language" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">出版年</td>
					<td><s:property value="literature.publishYear" /></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>