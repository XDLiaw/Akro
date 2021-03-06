<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">		
	$(document).ready(function () {
		//funcBtnSetting(); //要先暫時關閉
		paggingSetting();
		tabClickSetting();
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
		
		var pageIndex = parseInt('<s:property value="coopExPagedList.pageIndex"/>');
		var pageNumber = parseInt('<s:property value="coopExPagedList.pageNumber"/>');
		var pageCount = parseInt('<s:property value="coopExPagedList.pageCount"/>');
		
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
<script>
	function tabClickSetting() {
		$("ul.tabs li").click(function() {
			var type = $(this).html();
			$("input[name='searchCondition.type']").val(type);
			$(this).addClass('active').siblings('.active').removeClass('active');
			$("#btn-reset").trigger("click");
			$("form").submit();
		});
		
		var currentType = $("input[name='searchCondition.type']").val();
		if (currentType == null || currentType == "") {
			var type = $('ul.tabs li').eq(0).html();
			$("input[name='searchCondition.type']").val(type);
			$('ul.tabs li').eq(0).addClass('active').siblings('.active').removeClass('active');
		} else {
			$("ul.tabs li:contains("+currentType+")").addClass('active').siblings('.active').removeClass('active');
		}
	}
</script>
</head>
<body>
<div class="rightContent frontend">
	<s:form action="index" method="post" validate="true" >
		<div class="abgne_tab">
			<s:hidden name="searchCondition.type"/>
			<ul class="tabs">
				<li class="tabBg1">商品化</li>
				<li class="tabBg2">專利推廣</li>
				<li class="tabBg3">新創事業</li>
			</ul>
		</div>
		<div class="clear"></div>
		<div class="">
			<ul>
				<li class="half">
					<s:textfield name="searchCondition.searchText" placeholder="關鍵字"/>
				</li>
				<li class="quarter">
					<s:select name="searchCondition.year" list="#{'':'請選擇年度', '2014':'2014', '2015':'2015', '2016':'2016', '2017':'2017' }" />
				</li>
				<li class="quarter">
					<input type="submit" value="查詢" class="redBtn" id="btn-search"/>
					<input type="button" value="清除" class="grayBtn" id="btn-reset"/>
				</li>
			</ul>
		</div>
		<div class="search-btn-block">

		</div>
		<div class="clear"></div>
		
		<ul>
			<s:if test="coopExPagedList.list != null">
				<s:iterator value="coopExPagedList.list" status="stat">
					<li class="all">
						<div class="list-S">
							<img src="data:image;base64,<s:property value="base64Thumbnail"/>" />
						</div>					
						<div class="lisTitle">
							<s:url value="/f/coopEx/showDetail" var="detailUrlTag" escapeAmp="false">
								<s:param name="id" value="id" />
							</s:url>
							<s:hidden value="%{#detailUrlTag}" class="detail-url" disabled="true"/>
							<a href="#" class="a-showDetail">
								<s:property value="title"/>
							</a>
						</div>
						<div class="listInfo">
							研發團隊：<s:property value="rdTeam"/><br>輔導團隊：<s:property value="assisTeam"/>
						</div>
						<div class="listTxt">
							<s:property value="content"/>
						</div>
					</li>
				</s:iterator>
			</s:if>	
		</ul>
		
		<div class="page" hidden="true">
			<s:hidden id="pageIndex" name="searchCondition.pageIndex" />
			<s:hidden id="pageSize" name="searchCondition.pageSize" value="1000"/>
						
			<s:set var="pgList" value="coopExPagedList"/>
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

