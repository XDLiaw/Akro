<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<div id="item01">
		<h3 class="intro">
			重點研發成果推介 <a href="<s:url value="/f/researchPlan/init"/>" class="more"></a>
		</h3>
		<div class="item01-L">
			<s:if test="technologyList != null && technologyList.size() > 0">
				<s:url value="/f/researchPlan/showDetail" var="urlTag" escapeAmp="false">
					<s:param name="id" value="%{technologyList[0].researchPlan.id}" />
					<s:param name="fromHomePage" value="true"/>
				</s:url>
				<a href="<s:property value="#urlTag" />" class="headline"> 
					<img src="data:image;base64,<s:property value="%{technologyList[0].getResearchPlan().getBase64DomainImg()}"/>">
					<div class="itemTxt"> 
						<s:property	value="technologyList[0].name" />
					</div>
				</a>
			</s:if>
		</div>
		<div class="item01-S">
			<s:if test="technologyList != null && technologyList.size() > 1">
				<s:url value="/f/researchPlan/showDetail" var="urlTag" escapeAmp="false">
					<s:param name="id" value="%{technologyList[1].researchPlan.id}" />
					<s:param name="fromHomePage" value="true"/>
				</s:url>
				<a href="<s:property value="#urlTag" />"> 
					<img src="data:image;base64,<s:property value="%{technologyList[1].getResearchPlan().getBase64DomainImg()}"/>">
					<div class="itemTxt-S">
						<s:property value="technologyList[1].name" />
					</div>
				</a>
			</s:if>
		</div>
		<div class="item01-S">
			<s:if test="technologyList != null && technologyList.size() > 2">
				<s:url value="/f/researchPlan/showDetail" var="urlTag" escapeAmp="false">
					<s:param name="id" value="%{technologyList[2].researchPlan.id}" />
					<s:param name="fromHomePage" value="true"/>
				</s:url>
				<a href="<s:property value="#urlTag" />"> 
					<img src="data:image;base64,<s:property value="%{technologyList[2].getResearchPlan().getBase64DomainImg()}"/>">
					<div class="itemTxt-S">
						<s:property value="technologyList[2].name" />
					</div>
				</a>
			</s:if>
		</div>
		<div class="clear"></div>
	</div>
	<div id="item02">
		<div class="con">
			<h3 class="service">平台服務與查詢</h3>
			<div class="item02-L">
				<a href="<s:url value="/f/researchPlan/init"/>"> 
					<label class="itemTxt02">研發成果查詢</label> 
					<img src="<s:url value="/images/home_Pic-04.jpg"/>">
				</a>
			</div>
			<div class="item02-L">
				<a href="<s:url value="/f/patent/init"/>"> 
					<label class="itemTxt02">專利資料查詢</label> 
					<img src="<s:url value="/images/home_Pic-05.jpg"/>">
				</a>
			</div>
			<div class="item02-L" style="margin-right: 0;">
				<a href="<s:url value="/f/talentedPeople/init"/>"> 
					<label class="itemTxt02">產學人才查詢</label> 
					<img src="<s:url value="/images/home_Pic-06.jpg"/>">
				</a>
			</div>
			<div class="clear"></div>
			<div class="item02-S">
				<a href="<s:url value="/f/consulting/create"/>"> 
					<label class="itemTxt02">諮詢服務</label> 
					<img src="<s:url value="/images/home_Pic-07.jpg"/>">
				</a>
			</div>
			<div class="item02-S">
				<s:url value="/f/policy/init" var="urlTag" escapeAmp="false">
					<s:param name="searchCondition.category" value="%{'法規政策'}" />
				</s:url> 				
				<a href='<s:property value="#urlTag" />'> 
					<label class="itemTxt02">法規政策</label> 
					<img src="<s:url value="/images/home_Pic-08.jpg"/>">
				</a>
			</div>
			<div class="item02-S">
				<s:url value="/f/literature/init" var="urlTag" escapeAmp="false">
					<s:param name="searchCondition.category" value="%{'文獻'}" />
				</s:url> 				
				<a href='<s:property value="#urlTag" />'> 
					<label class="itemTxt02">文獻</label> 
					<img src="<s:url value="/images/home_Pic-09.jpg"/>">
				</a>
			</div>
			<div class="item02-S" style="margin-right: 0;">
				<a href="<s:url value="/f/incubationCenter/init"/>"> 
					<label class="itemTxt02">育成中心</label> 
					<img src="<s:url value="/images/home_Pic-10.jpg"/>">
				</a>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div id="item03">
		<div class="con">
			<h3 class="case">
				<strong>產學合作案例</strong> 
				<a href="<s:url value="/f/coopEx/init"/>" class="more"></a>
			</h3>
			<ul>
				<s:iterator value="coopExList" status="stat" begin="0" end="4">
					<li>
<%-- 						<s:url value="/f/coopEx/showDetail" var="urlTag"> --%>
<%-- 							<s:param name="id" value="%{id}" /> --%>
<%-- 						</s:url> --%>
						<s:url value="/f/coopEx/index" var="urlTag" escapeAmp="false">
							<s:param name="searchCondition.projName" value="%{projName}" />
							<s:param name="searchCondition.type" value="%{type}" />
						</s:url> 
						<a href="<s:property value="#urlTag" />">
							<div class="caseimg">
								<img src="data:image;base64,<s:property value="base64Thumbnail"/>" />
							</div> 
							<br> <s:property value="projName" />
						</a>
					</li>
				</s:iterator>
			</ul>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>