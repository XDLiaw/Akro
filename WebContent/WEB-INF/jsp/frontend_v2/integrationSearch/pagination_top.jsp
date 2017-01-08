<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
		
<div class="col-sm-12 col-xs-12 pagination">
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