<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	
</head>
<body>	
	<s:form action="index" method="post" validate="true" >
		<div class="container-fluid">
			<div class="col-md-3">
				<s:textfield placeholder="問卷名稱" name="searchQnrName" maxlength="500" cssClass="form-control" />
			</div>			
			<div class="col-md-2">			
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
						<th>問卷名稱</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<s:if test="qnrTableList != null">
						<s:iterator value="qnrTableList.list" status="stat">
							<tr>
								<td class="col-md-1">
									<s:property value="%{qnrTableList.itemStart + #stat.count -1}" />
									<s:property value="id" />
								</td>						
								<td><s:property value="name" /></td>																
								<td class="col-md-3">
									<s:url value="showDetail.action" var="detailUrlTag" escapeAmp="false">
										<s:param name="id" value="id" />
									</s:url>
									<input type="button" class="btn-info" value="檢視" 
										onclick="window.location.href='<s:property value="detailUrlTag" />'" />
								
									<s:url value="copy.action" var="copyUrlTag" escapeAmp="false">
										<s:param name="id" value="id" />
									</s:url>
									<input type="button" class="btn-primary" value="複製" 
										onclick="window.location.href='<s:property value="copyUrlTag" />'" />
								
									<s:url value="update.action" var="updateUrlTag" escapeAmp="false">
										<s:param name="id" value="id" />
									</s:url>
									<input type="button" class="btn-info btn-update" value="編輯" 
										url="<s:property value="updateUrlTag" />" />
										
									<s:url value="delete.action" var="deleteUrlTag" escapeAmp="false">
										<s:param name="id" value="id" />
									</s:url>
									<input type="button" class="btn-danger btn-delete" value="刪除" 
										url="<s:property value="#deleteUrlTag" />" />								
								</td>
							</tr>
						</s:iterator>
					</s:if>	
				</tbody>
			</table>
		</div>

		<div>
			<s:hidden id="pageIndex" name="pageIndex" />
			<s:hidden id="pageSize" name="pageSize" value="5" />
			
			<s:if test="qnrTableList != null && qnrTableList.pageCount > 0">
				<ul class="pagination">
					<li><input type="submit" value="First" class="btn-first-page" /></li>
					<li><input type="submit" value=&laquo; class="btn-previous-page" /></li>
					<s:if test="pageIndex >= 5">
						......
					</s:if>
					<s:iterator value="qnrTableList.pageNumberList" status="stat" 
						begin="%{pageIndex < 5 ? 0 : pageIndex - 5 }"
						end="%{pageIndex > qnrTableList.pageCount - 6 ? qnrTableList.pageCount -1 : pageIndex +5 }">
						<li><input type="submit" value=<s:property/> class="btn-page" /></li>
					</s:iterator>
					<s:if test="pageIndex <= qnrTableList.pageCount - 6">
						......
					</s:if>
					<li><input type="submit" value=&raquo;	class="btn-next-page" /></li>
					<li class="next"><input type="submit" value="Last" class="btn-last-page" /></li>
				</ul>
			
				<p>Displaying <s:property value="qnrTableList.itemStart"/> - <s:property value="qnrTableList.itemEnd"/> of <s:property value="qnrTableList.totatlItemCount"/> item(s)</p> 
			</s:if>
		</div>
	</s:form>
	
	<script type="text/javascript">	
		
		$(document).ready(function () {			
			paginSetting();
			$("#btn-reset").click(btnResetClick);
			$("input[type='button'].btn-update").click(isQnrHasDataAjax);
			$("input[type='button'].btn-delete").click(isQnrHasDataAjax);
		});
		
		function btnResetClick(){
			$("input.form-control:text").val("");
			$("select").prop('selectedIndex', 0);
		}

		function isQnrHasDataAjax() {
			var url = $(this).attr("url");
			var id = url.substring(url.indexOf("id=")+3);
			//TODO ajax
			$.ajax({
				type:"post",
				url: '<s:url value="/qnrTemplate/isQnrHasDataAjax"/>',
				data:{
                    id:id
                },
                dataType:"json",
                success:function(data){
                	if (typeof data.error != 'undefined') {
                		alert(data.error);
                	} else {
                		if (data.isQnrHasData) {
                			alert("此問卷已有資料，不可變更或刪除");
                		} else {
//                 			window.open(url);
            				window.location.href=url;
                		}
                	}
                },
                error:function(){
                    alert("系統異常，請聯繫管理員！");
                }
			});			
		}
		
		function paginSetting() {
 			$("ul.pagination > li > input").addClass("btn btn-default btn-sm");
			
			var pageIndex = parseInt('<s:property value="qnrTableList.pageIndex"/>');
			var pageNumber = parseInt('<s:property value="qnrTableList.pageNumber"/>');
			var pageCount = parseInt('<s:property value="qnrTableList.pageCount"/>');
			
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

