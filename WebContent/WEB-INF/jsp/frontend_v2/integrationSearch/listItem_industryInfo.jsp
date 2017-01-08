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
							<span class="label label-pink">產業情報</span>
						</h4>
						<h4>
							<span class="label label-default">
								<i class="fa fa-cube right5" aria-hidden="true"></i>
								<s:property value="industryInfo.category"/>
							</span>
						</h4>
					</td>
					<td width="10%" style="border: none;" class="date_01">主題</td>
					<td style="border: none;">
						<a href="<s:property value="industryInfo.link"/>" class="list_link_01" target="_blank">
							<s:property value="industryInfo.title"/>
						</a>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">資料來源</td>
					<td><s:property value="industryInfo.source"/></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="date_01">發布日期</td>
					<td><s:date name="postDate" format="yyyy/M/d"/></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>