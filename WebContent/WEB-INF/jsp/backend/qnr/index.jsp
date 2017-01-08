<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	
</head>
<body>	
	<s:form action="index" method="post" validate="true" >
		<s:hidden name="qnrTableId"/>
		<s:hidden name="qnrTableName"/>
	
		<div class="container-fluid">
			<div class="col-md-11">
				<s:set var="sIndex" value="0"/>
				<s:iterator value="qnrTemplate.questionList" status="stat">
					<s:if test="%{inputType != 'INPUT_TYPE_HIDDEN' && searchCondition == true}">
						<div class="row">
							<div class="col-md-1">
								<s:if test="#sIndex > 0">
									<s:select class="" name="serachConditionSet.conditions[%{#sIndex}].operator" list="#{'AND':'AND', 'OR':'OR'}"/>
								</s:if>
							</div>						
							<div class="col-md-5">
								<label><s:property value="question"/></label>
								<s:hidden name="serachConditionSet.conditions[%{#sIndex}].tableColumnName" value="%{colName}"/>
							</div>
							<div class="col-md-1">
								<s:select class="" name="serachConditionSet.conditions[%{#sIndex}].searchType" list="qnrSearchTypeList" listKey="code" listValue="name"/>
							</div>
							<div class="col-md-5">
								<s:if test="%{inputType == 'INPUT_TYPE_TEXTFIELD_TEXT' || inputType == 'INPUT_TYPE_TEXTFIELD_NUM'}">
									<s:textfield name="serachConditionSet.conditions[%{#sIndex}].searchValue"/>
								</s:if>
								<s:elseif test="%{inputType == 'INPUT_TYPE_TEXTFIELD_DATE'}">
									<s:textfield name="serachConditionSet.conditions[%{#sIndex}].searchValue" class="calendarBox"/>
								</s:elseif>
								<s:elseif test="%{inputType == 'INPUT_TYPE_SELECT' || inputType == 'INPUT_TYPE_SELECT_OPTION' || inputType == 'INPUT_TYPE_CHECKBOX' || inputType == 'INPUT_TYPE_CHECKBOX_OPTION'}">
									<s:select name="serachConditionSet.conditions[%{#sIndex}].searchValue" list="optionList" listKey="code" listValue="name" headerKey="" headerValue=""/> 
								</s:elseif>
							</div>
						</div>
						<s:set var="sIndex" value="%{#sIndex+1}"/>
					</s:if>
				</s:iterator>
			</div>
			<div class="col-md-1">			
				<input type="submit" value="查詢" class="btn btn-primary" id="btn-search"/>
				<input type="button" value="清除" class="btn btn-warning" id="btn-reset"/>
			</div>
		</div>
		<p>
		<div class="">
			<table class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th>No.</th>
						<s:iterator value="qnrTemplate.questionList" status="stat">
							<s:if test="%{inputType != 'INPUT_TYPE_HIDDEN'}">
								<th><s:property value="question"/></th>
							</s:if>
						</s:iterator>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<s:if test="searchResult != null">
						<s:iterator value="searchResult.list" status="stat">
							<s:set var="resultRow"><s:property value="%{searchResult.list[#stat.index]}"/></s:set>
							<tr>
								<td>
									<s:property value="%{searchResult.itemStart + #stat.count -1}" />
<%-- 									<s:property value="%{#stat.index}" /> --%>
									<s:property value="ID" />
<%-- 									<s:property value="%{searchResult.list[#stat.index].ID}"/> --%>
								</td>
								
								<s:iterator value="qnrTemplate.questionList" status="qStat">
									<s:if test="%{inputType != 'INPUT_TYPE_HIDDEN'}">
										<td>
											<s:property value="%{searchResult(#stat.index, colName)}"/>
										</td>
									</s:if>
								</s:iterator>								

								<td class="col-md-1">
									<!-- 檢視 -->
									<s:url value="showDetail.action" var="detailUrlTag" escapeAmp="false">
										<s:param name="id" value="ID" />
										<s:param name="qnrTableId" value="qnrTableId" />
										<s:param name="qnrTableName" value="qnrTableName" />
									</s:url>
									<input type="button" class="btn-info" value="檢視" 
										onclick="window.location.href='<s:property value="detailUrlTag" />'" />								
								</td>
							</tr>
						</s:iterator>
					</s:if>	
				</tbody>
			</table>
		</div>

		<div>
			<s:hidden id="pageIndex" name="serachConditionSet.pageIndex" />
			<s:hidden id="pageSize" name="serachConditionSet.pageSize" value="5" />
			
			<s:if test="searchResult != null && searchResult.pageCount > 0">
				<ul class="pagination">
					<li><input type="submit" value="First" class="btn-first-page" /></li>
					<li><input type="submit" value=&laquo; class="btn-previous-page" /></li>
					<s:if test="serachConditionSet.pageIndex >= 5">
						......
					</s:if>
					<s:iterator value="searchResult.pageNumberList" status="stat" 
						begin="%{serachConditionSet.pageIndex < 5 ? 0 : serachConditionSet.pageIndex - 5 }"
						end="%{serachConditionSet.pageIndex > searchResult.pageCount - 6 ? searchResult.pageCount -1 : serachConditionSet.pageIndex +5 }">
						<li><input type="submit" value=<s:property/> class="btn-page" /></li>
					</s:iterator>
					<s:if test="serachConditionSet.pageIndex <= searchResult.pageCount - 6">
						......
					</s:if>
					<li><input type="submit" value=&raquo;	class="btn-next-page" /></li>
					<li class="next"><input type="submit" value="Last" class="btn-last-page" /></li>
				</ul>
			
				<p>Displaying <s:property value="searchResult.itemStart"/> - <s:property value="searchResult.itemEnd"/> of <s:property value="searchResult.totatlItemCount"/> item(s)</p> 
			</s:if>
		</div>
	</s:form>
	
	<script type="text/javascript">		
		$(document).ready(function () {
			paging();
			
			$("#btn-reset").click(function(){
				$("input.form-control:text").val("");
				$("select").prop('selectedIndex', 0);
			});

		});		
		
		function paging() {
			$("ul.pagination > li > input").addClass("btn btn-default btn-sm");
			
			var pageIndex = parseInt('<s:property value="searchResult.pageIndex"/>');
			var pageNumber = parseInt('<s:property value="searchResult.pageNumber"/>');
			var pageCount = parseInt('<s:property value="searchResult.pageCount"/>');
			
			$("ul > li > input.btn-page").click(function() {
				$("#pageIndex").val($(this).attr("value") - 1);
				return true;
			});
			$("ul.pagination > li > input.btn-page[value='"+pageNumber+"']").addClass("active");
	
			//第一頁按鈕
			$("ul > li > input.btn-first-page").click(function() {
				$("#pageIndex").val(0);
			});
			
			//最後一頁按鈕
			$("ul > li > input.btn-last-page").click(function() {
				$("#pageIndex").val(pageCount-1);
			});
			
			//上一頁按鈕
			if (pageIndex == 0) {
				$("ul > li > input.btn-previous-page").addClass("disabled");
			}
			$("ul > li > input.btn-previous-page").click(function() {
				if (pageIndex > 0) {
					$("#pageIndex").val(pageIndex - 1);
					return true;
				} else {
					return false;
				}
			});
			
			//下一頁按鈕
			if (pageIndex == pageCount - 1) {
				$("ul > li > input.btn-next-page").addClass("disabled");
			}
			$("ul > li > input.btn-next-page").click(function() {
				if (pageIndex < (pageCount - 1)) {
					$("#pageIndex").val(pageIndex + 1);
					return true;
				} else {
					return false;
				}
			});
						
			// 注意: 在include此頁面的頁面的搜尋按鈕記得要加上id
		    $("#btn-search").click(function(){
		        $("#pageIndex").val(0);
		        return true;
		    });
		}
	</script>
</body>
</html>

