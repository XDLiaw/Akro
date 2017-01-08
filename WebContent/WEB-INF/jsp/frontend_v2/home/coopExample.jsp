<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<!-- 產學合作案例 -->
<div class="container">
	<div class="row">
		<div class="col-sm-12 col-xs-12 top50">
			<div>
				<div class="large_title_01">
					<i class="fa fa-handshake-o" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>產學合作案例
					<div class="pull-right">
						<s:url value="/f2/coopEx/init" var="urlTag" escapeAmp="false">
							<s:param name="searchCondition.type" value="@iace.entity.coopExample.CoopEx@getTypeList()[0].code" />
						</s:url>
						<a href="<s:property value="urlTag"/>"> 
							<img src="<s:url value="/images/frontend-v2/more_blue.png"/>" alt="" height="30" />
						</a>
					</div>
				</div>
				<div class="line_blue">&nbsp;</div>
				<div class="line_gray1px"></div>
			</div>
		</div>
	</div>
	<div class="row">
		<s:iterator value="coopExList" status="stat" begin="0" end="2">
			<div class="col-sm-4 col-xs-12 top20">
				<div class="center-cropped1 img_radius">
					<img src="data:image;base64,<s:property value="base64Thumbnail"/>" class="img-responsive" alt="" />
				</div>
				<div class="text-center top10">
					<s:url value="/f2/coopEx/showDetail" var="detailUrlTag" escapeAmp="false">
						<s:param name="id" value="id" />
						<s:param name="searchCondition.type" value="type" />
					</s:url> 
					<a href="<s:property value="%{#detailUrlTag}"/>" class="list_link_01"><s:property value="title" /></a>
				</div>
				<div class="text-center date_01">
					<s:date name="createTime" format="yyyy/MM/dd" />
				</div>
			</div>
		</s:iterator>
	</div>
	<div class="row">
		<s:iterator value="coopExList" status="stat" begin="3" end="5">
			<div class="col-sm-4 col-xs-12 top20">
				<div class="center-cropped1 img_radius">
					<img src="data:image;base64,<s:property value="base64Thumbnail"/>" class="img-responsive" alt="" />
				</div>
				<div class="text-center top10">
					<s:url value="/f2/coopEx/showDetail" var="detailUrlTag" escapeAmp="false">
						<s:param name="id" value="id" />
						<s:param name="searchCondition.type" value="type" />
					</s:url> 
					<a href="<s:property value="%{#detailUrlTag}"/>" class="list_link_01"><s:property value="title" /></a>
				</div>
				<div class="text-center date_01">
					<s:date name="createTime" format="yyyy/MM/dd" />
				</div>
			</div>
		</s:iterator>
		<div class="col-sm-12 col-xs-0 top20">
			<div class="line_gray1px"></div>
		</div>
	</div>
</div>
