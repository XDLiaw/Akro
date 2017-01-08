<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function () {			
		paggingSetting();
		funcBtnSetting();
	});
</script>
<script>
	function funcBtnSetting() {
		$(".a-showDetail").click(function(event) {
			event.preventDefault();
			var url = $(this).siblings(".detail-url").val();
			$("form").attr('action', url);
			$("form").submit();
			$("form").attr('action', '<s:url value="index.action"/>'); // 要把action改為原本的，否則如果使用者按下瀏覽器的上一頁回到目前這個列表頁再去按搜尋就會跑到已經被改變的action所指定的那一頁
		});
	}
</script>
<script>	
	function paggingSetting() {
		$("ul.pagination > li > input").addClass("btn btn-default btn-sm");
		
		var pageIndex = parseInt('<s:property value="patentPagedList.pageIndex"/>');
		var pageNumber = parseInt('<s:property value="patentPagedList.pageNumber"/>');
		var pageCount = parseInt('<s:property value="patentPagedList.pageCount"/>');
		
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
		
		// 每頁筆數
		$(".select-pageSize").change(function() {
			var pageSize = $(this).find(":checked").val();
			$("#pageSize").val(pageSize);
			$("#pageIndex").val(0);
			$("form").submit();
		});
		$(".select-pageSize").val($("#pageSize").val());
					
		// 注意: 在此頁面的搜尋按鈕記得要加上id
	    $("#btn-search").click(function(){
	        $("#pageIndex").val(0);
	        return true;
	    });
	 	// 注意: 在此頁面的重置按鈕記得要加上id
		$("#btn-reset").click(function(){
			$("input.form-control:text").val("");
			$("select").prop('selectedIndex', 0);
		});
	}
</script>
<meta name="funcPathText" content="編輯管理 "/>
</head>
<body>
<div class="rightContent frontend">
<!-- 	<h2 class="itemTitle">編輯管理</h2> -->
	<s:form action="index" method="post" validate="true" >
		<div>
			<ul>
				<li class="all">
					<s:textfield placeholder="專利名稱" name="searchCondition.name" maxlength="300" />
				</li>
				<li class="half">
					<s:textfield placeholder="專利權人" name="searchCondition.assignee" maxlength="500" />
				</li>				
				<li class="quarter">
					<s:textfield placeholder="申請日(起)" name="searchCondition.applicationDateS" maxlength="10" cssClass="calendarBox" />
				</li>
				<li class="quarter">
					<s:textfield placeholder="申請日(迄)" name="searchCondition.applicationDateE" maxlength="10" cssClass="calendarBox" />
				</li>
				<li class="quarter">
					<s:textfield placeholder="申請號" name="searchCondition.appliactionNo" maxlength="100" />
				</li>
				<li class="quarter">
					<s:select name="searchCondition.countryCode" list="optionCountryList" listKey="code" listValue="%{code+' - '+name}" headerKey="" headerValue="請選擇申請國" />
				</li>
				<li class="quarter">
					<s:select name="searchCondition.techFieldId" list="techFieldList" listKey="id" listValue="name" headerKey="-1" headerValue="請選擇專利技術領域" />
				</li>
				<li class="quarter">
					<input type="submit" value="查詢" class="redBtn" id="btn-search"/>
					<input type="button" value="清除" class="grayBtn" id="btn-reset"/>
				</li>
			</ul>
		</div>
		<div class="clear"></div>

		<div class="page">
			<s:set var="pgList" value="patentPagedList"/>
			<s:set var="pgIndex" value="searchCondition.pageIndex"/>
			<s:set var="pgCount" value="#pgList.pageCount"/>
			
			<ul class="pagination">
				<s:if test="#pgList != null && #pgCount > 0">					
					<li><input type="submit" value="First" class="btn-first-page" /></li>
					<li><input type="submit" value=&laquo; class="btn-previous-page" /></li>
					<s:if test="#pgIndex >= 5">
						<li>......</li>
					</s:if>
					<s:iterator value="#pgList.pageNumberList" status="stat" 
						begin="%{#pgIndex < 5 ? 0 : #pgIndex - 5 }"
						end="%{#pgIndex > #pgCount - 6 ? #pgCount -1 : #pgIndex +5 }">
						<li><input type="submit" value=<s:property/> class="btn-page" /></li>
					</s:iterator>
					<s:if test="#pgIndex <= #pgCount - 6">
						<li>......</li>
					</s:if>
					<li><input type="submit" value=&raquo;	class="btn-next-page" /></li>
					<li class="next"><input type="submit" value="Last" class="btn-last-page" /></li>					
				</s:if>
				<li>
					<p>共 <s:property value="#pgList.totatlItemCount"/> 筆資料</p>
				</li>
				<li>
					&nbsp;&nbsp;&nbsp;每頁筆數:
				</li>
				<li>
					<select class="select-pageSize">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>
				</li>				
			</ul>
		</div>

		<div class="">
			<table>
				<tr>
					<th nowrap width="2%">No.</th>
					<th nowrap width="">專利名稱</th>
					<th nowrap width="">專利權人</th>
					<th nowrap width="">申請國別</th>
					<th nowrap width="5%">申請號</th>
					<th nowrap width="5%">申請日</th>
					<th nowrap width="5%">狀態</th>
					<th nowrap width="5%">專利技術領域</th>
				</tr>
				<s:if test="patentPagedList != null">
					<s:iterator value="patentPagedList.list" status="stat">
						<tr>
							<td>
								<s:property value="%{patentPagedList.itemStart + #stat.count -1}" />
								<%-- <s:property value="id" /> --%>
							</td>						
							<td>
								<s:url value="/f/patent/showDetail" var="detailUrlTag" escapeAmp="false">
									<s:param name="id" value="id" />
								</s:url>
								<s:hidden value="%{#detailUrlTag}" class="detail-url" disabled="true"/>
								<a href="#" class="a-showDetail">
									<s:property value="name" />
								</a>
							</td>
							<td title='<s:property value="assignee" />'>
								<s:property value="assigneeShort" />
							</td>
							<td><s:property value="country.name" /></td>
							<td><s:property value="appliactionNo" /></td>
							<td><s:date name="applicationDate" format="yyyy/M/d"/></td>
							<td><s:property value="patentStatus" /></td>
							<td><s:property value="techField.name" /></td>
						</tr>
					</s:iterator>
				</s:if>
			</table>
		</div>
		
		<div class="page">
			<s:hidden id="pageIndex" name="searchCondition.pageIndex" />
			<s:hidden id="pageSize" name="searchCondition.pageSize" />
						
			<s:set var="pgList" value="patentPagedList"/>
			<s:set var="pgIndex" value="searchCondition.pageIndex"/>
			<s:set var="pgCount" value="#pgList.pageCount"/>
			
			<ul class="pagination">
				<s:if test="#pgList != null && #pgCount > 0">					
					<li><input type="submit" value="First" class="btn-first-page" /></li>
					<li><input type="submit" value=&laquo; class="btn-previous-page" /></li>
					<s:if test="#pgIndex >= 5">
						<li>......</li>
					</s:if>
					<s:iterator value="#pgList.pageNumberList" status="stat" 
						begin="%{#pgIndex < 5 ? 0 : #pgIndex - 5 }"
						end="%{#pgIndex > #pgCount - 6 ? #pgCount -1 : #pgIndex +5 }">
						<li><input type="submit" value=<s:property/> class="btn-page" /></li>
					</s:iterator>
					<s:if test="#pgIndex <= #pgCount - 6">
						<li>......</li>
					</s:if>
					<li><input type="submit" value=&raquo;	class="btn-next-page" /></li>
					<li class="next"><input type="submit" value="Last" class="btn-last-page" /></li>					
				</s:if>
				<li>
					<p>共 <s:property value="#pgList.totatlItemCount"/> 筆資料</p>
				</li>
				<li>
					&nbsp;&nbsp;&nbsp;每頁筆數:
				</li>
				<li>
					<select class="select-pageSize">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>
				</li>				
			</ul>
		</div>		
	</s:form>
</div>	
</body>
</html>

