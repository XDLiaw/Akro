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
		$(".btn-view").click(function() {
			var url = $(this).siblings(".detailUrl").val();
			$("form").attr('action', url);
			$("form").submit();
			$("form").attr('action', '<s:url value="index.action"/>'); // 要把action改為原本的，否則如果使用者按下瀏覽器的上一頁回到目前這個列表頁再去按搜尋就會跑到已經被改變的action所指定的那一頁
		});
		
		$("select[name=beenHandled]").change(function() {
			var beenHandled = $(this).val(); 
			var url = $(this).parents("tr").find(".updateUrl").val() + "&beenHandled="+beenHandled;
			$("form").attr('action', url);
			$("form").submit();
			$("form").attr('action', '<s:url value="index.action"/>'); // 要把action改為原本的，否則如果使用者按下瀏覽器的上一頁回到目前這個列表頁再去按搜尋就會跑到已經被改變的action所指定的那一頁
		});
	
	}
</script>
<script>	
	function paggingSetting() {
		$("ul.pagination > li > input").addClass("btn btn-default btn-sm");
		
		var pageIndex = parseInt('<s:property value="contactUsPagedList.pageIndex"/>');
		var pageNumber = parseInt('<s:property value="contactUsPagedList.pageNumber"/>');
		var pageCount = parseInt('<s:property value="contactUsPagedList.pageCount"/>');
		
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
			$("input[type=checkbox]").prop("checked", false);
			displaySelectedGrbDomains();
		});
	}
</script>
<meta name="funcPathText" content="編輯管理 " />
</head>
<body>
	<s:form action="index" method="post" validate="true" >
		<div>
			<ul>
				<li class="half">
					<s:textfield placeholder="姓名, Email" name="searchCondition.searchText" maxlength="100" />
				</li>
				<li class="quarter">
					<s:select name="searchCondition.beenHandled" list="#{'':'--處理狀態--', 'true':'已處理', 'false':'待處理'}"/>
				</li>
				<li class="quarter">
					<input type="submit" value="查詢" class="redBtn" id="btn-search"/>
					<input type="button" value="清除" class="grayBtn" id="btn-reset"/>
				</li>
			</ul>
		</div>
		<div class="clear"></div>

		<div class="page">
			<s:set var="pgList" value="contactUsPagedList"/>
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
					<th nowrap width="3%">No.</th>
					<th nowrap width="">姓名</th>
					<th nowrap width="">單位名稱</th>
					<th nowrap width="">聯絡電話</th>
					<th nowrap width="">E-MAIL</th>
					<th>處理狀態</th>
					<th nowrap width="">功能</th>
				</tr>
				<s:if test="contactUsPagedList != null">
					<s:iterator value="contactUsPagedList.list" status="stat">
						<tr>
							<td>
								<s:property value="%{contactUsPagedList.itemStart + #stat.count -1}" />
								<%-- <s:property value="id" /> --%>
							</td>
							<td><s:property value="name" /></td>
							<td><s:property value="companyName" /></td>
							<td><s:property value="phone" /></td>
							<td><s:property value="email" /></td>
							<td>
								<s:if test='%{#session.sysUser.hasAuth(namespace, "update")}'>
									<s:select name="beenHandled" list="#{'true':'已處理', 'false':'待處理'}" class="horizontalList"/>
								</s:if>
								<s:else>
									<s:select name="beenHandled" list="#{'true':'已處理', 'false':'待處理'}" class="horizontalList" disabled="true"/>
								</s:else>
							</td>
							<td>
								<!-- 檢視 -->
								<s:if test='%{#session.sysUser.hasAuth(namespace, "showDetail")}'>
									<s:url value="showDetail.action" var="detailUrlTag">
										<s:param name="id" value="id" />
									</s:url>
									<s:hidden value="%{#detailUrlTag}" class="detailUrl" disabled="true"/>
									<input type="button" class="btn-info btn-func btn-view" value="檢視" />	
								</s:if>
								<!-- 編輯 -->
								<s:if test='%{#session.sysUser.hasAuth(namespace, "update")}'>
									<s:url value="update.action" var="updateUrlTag" escapeAmp="false">
										<s:param name="id" value="id" />
									</s:url>
									<s:hidden value="%{#updateUrlTag}" class="updateUrl" disabled="true"/>
								</s:if>
							</td>
						</tr>
					</s:iterator>
				</s:if>
			</table>
		</div>
		
		<div class="page">
			<s:hidden id="pageIndex" name="searchCondition.pageIndex" />
			<s:hidden id="pageSize" name="searchCondition.pageSize" />
			
			<s:set var="pgList" value="contactUsPagedList"/>
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
</body>
</html>

