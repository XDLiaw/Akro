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
		$(".btn-edit").click(function() {
			var url = $(this).siblings(".updateUrl").val();
			$("form").attr('action', url);
			$("form").submit();
			$("form").attr('action', '<s:url value="index.action"/>'); // 要把action改為原本的，否則如果使用者按下瀏覽器的上一頁回到目前這個列表頁再去按搜尋就會跑到已經被改變的action所指定的那一頁
		});
	}
</script>
<script>
	function paggingSetting() {
		$("ul.pagination > li > input").addClass("btn btn-default btn-sm");
		
		var pageIndex = parseInt('<s:property value="sysUserPagedList.pageIndex"/>');
		var pageNumber = parseInt('<s:property value="sysUserPagedList.pageNumber"/>');
		var pageCount = parseInt('<s:property value="sysUserPagedList.pageCount"/>');
		
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
</head>
<body>
	<input type="button" class="redBtn" value="新增系統使用者" onclick="window.location.href='<s:url value="create.action"/>'" />
	<div class="clear"></div>
	<br>
	
	<s:form action="index" method="post" validate="true" >
		<div class="">
			<ul class="row">
				<li class="quarter">
					<s:select name="searchCondition.sysRoleId" list="sysRoleList" listKey="id" listValue="name" headerKey="0" headerValue="--角色--" />
				</li>
				<li class="half">
					<s:textfield placeholder="帳號、姓名" name="searchCondition.searchText"/>
				</li>
				<li class="quarter">
					<input type="submit" value="查詢" class="btn btn-primary redBtn" id="btn-search"/>
					<input type="button" value="清除" class="btn btn-warning grayBtn" id="btn-reset"/>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
		
		<div class="page">
			<s:set var="pgList" value="sysUserPagedList"/>
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
		
		<table>
			<tr>
				<th width="2%" nowrap>No.</th>
				<th width="" nowrap>帳號</th>
				<th width="" nowrap>名稱</th>
				<th width="" nowrap>角色</th>
				<th width="">功能</th>
			</tr>
			<s:if test="sysUserPagedList != null">
				<s:iterator value="sysUserPagedList.list" status="stat">
				<tr>
					<td>
						<s:property value="#stat.count" />
					</td>
					<td><s:property value="account" /></td>
					<td><s:property value="name" /></td>
					<td><s:property value="sysRole.name" /></td>
					<td>
						<!-- 編輯 -->
						<s:if test='%{#session.sysUser.hasAuth(namespace, "update")}'>
							<s:url value="update.action" var="updateUrlTag">
								<s:param name="id" value="id" />
							</s:url>
							<s:hidden value="%{#updateUrlTag}" class="updateUrl" disabled="true"/>
							<input type="button" class="btn-info btn-func btn-edit" value="編輯" />
						</s:if>
					</td>
				</tr>
				</s:iterator>
			</s:if>	
		</table>
		
		<div class="page">
			<s:hidden id="pageIndex" name="searchCondition.pageIndex" />
			<s:hidden id="pageSize" name="searchCondition.pageSize" />
			
			<s:set var="pgList" value="sysUserPagedList"/>
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