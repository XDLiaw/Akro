<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<script type="text/javascript">
	$(document).ready(function () {	
		var pageIndex = parseInt('<s:property value="pagedList.pageIndex"/>');
		var pageNumber = parseInt('<s:property value="pagedList.pageNumber"/>');
		var pageCount = parseInt('<s:property value="pagedList.pageCount"/>');

		//分頁按鈕
		$(".pagination input.btn-page").click(function() {
			$("#pageIndex").val($(this).attr("value") - 1);
			return true;
		});
		$(".pagination input.btn-page[value='"+pageNumber+"']").removeClass("page_num").addClass("page_num_active");

		//第一頁按鈕
		$(".pagination input.btn-first-page").click(function() {
			$("#pageIndex").val(0);
		});
		
		//最後一頁按鈕
		$(".pagination input.btn-last-page").click(function() {
			$("#pageIndex").val(pageCount-1);
		});
		
		//上一頁按鈕
		if (pageIndex == 0) {
			$(".pagination input.btn-previous-page").addClass("disabled");
		}
		$(".pagination input.btn-previous-page").click(function() {
			if (pageIndex > 0) {
				$("#pageIndex").val(pageIndex - 1);
				return true;
			} else {
				return false;
			}
		});
		
		//下一頁按鈕
		if (pageIndex == pageCount - 1) {
			$(".pagination input.btn-next-page").addClass("disabled");
		}
		$(".pagination input.btn-next-page").click(function() {
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
			$(this).parents("form").submit();
		});
		$(".select-pageSize").val($("#pageSize").val());
		
		// 注意: 在此頁面的搜尋按鈕記得要加上id
		$("#btn-search").click(function(){
			$("#pageIndex").val(0);
			return true;
		});
	});
</script>
		
<div class="col-sm-12 col-xs-12 pagination">
	<s:hidden id="pageIndex" name="searchCondition.pageIndex" />
	<s:hidden id="pageSize" name="searchCondition.pageSize"/>

	<s:set var="pgList" value="pagedList"/>
	<s:set var="pgIndex" value="searchCondition.pageIndex"/>
	<s:set var="pgCount" value="#pgList.pageCount"/>
			
	<!-- 換頁 -->
	<s:if test="#pgList != null && #pgCount > 0">
		<div class="text-center top20">
			<input type="submit" value="First" class="btn-first-page page_prev" />
			<input type="submit" value=&laquo; class="btn-previous-page page_prev" />
		
			<s:iterator value="#pgList.pageNumberList" status="stat" 
				begin="%{#pgIndex < 5 ? 0 : #pgIndex - 5 }"
				end="%{#pgIndex > #pgCount - 6 ? #pgCount -1 : #pgIndex +5 }">
				<input type="submit" value=<s:property/> class="btn-page page_num" />
			</s:iterator>
		
			<input type="submit" value=&raquo;	class="btn-next-page page_next" />
			<input type="submit" value="Last" class="btn-last-page page_next" />
			
			<label>&nbsp;&nbsp;&nbsp;共 <s:property value="#pgList.totatlItemCount"/> 筆資料&nbsp;&nbsp;&nbsp;</label>
			<select class="select-pageSize">
				<option value="10">每頁10筆</option>
				<option value="20">每頁20筆</option>
				<option value="50">每頁50筆</option>
			</select>
		</div>
	</s:if>
</div>