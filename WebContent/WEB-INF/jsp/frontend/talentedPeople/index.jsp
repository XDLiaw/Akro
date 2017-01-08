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
		dropDownBoxSetting();
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
		
		var pageIndex = parseInt('<s:property value="talentedPeoplePagedList.pageIndex"/>');
		var pageNumber = parseInt('<s:property value="talentedPeoplePagedList.pageNumber"/>');
		var pageCount = parseInt('<s:property value="talentedPeoplePagedList.pageCount"/>');
		
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
<script>
	function dropDownBoxSetting() {
		$(".dropDownBox").mouseleave(function(){
			$(this).css("display","none")
			toggleDropDownBox();
		});
		displaySelectedGrbDomains();
	}

	var expanded = false;
	function toggleDropDownBox() {
		if (!expanded) {
			$(".dropDownBox").css("display","block")
			expanded = true;
		} else {
			$(".dropDownBox").css("display","none")
			expanded = false;
			displaySelectedGrbDomains();
		}
	}
	
	function displaySelectedGrbDomains() {
		var selectedGrbDomains = "";
		$("[name='searchCondition.grbDomainIdList']:checked").each(function(index){
			selectedGrbDomains += $(this).parents("li.third").find(".grbDomainName").val()+"; \r\n";
		});
		var selectCount = $("[name='searchCondition.grbDomainIdList']:checked").length;
		if (selectCount > 0) {
			$(".selectBox select option").html(selectedGrbDomains);
			$(".selectBox").attr("title", selectedGrbDomains);
		} else {
			$(".selectBox select option").html("選擇領域");
			$(".selectBox").removeAttr("title");
		}
	}
</script>
<style>
.selectBox { position: relative; width: 100%; }
.overSelect { position: absolute; left: 0; right: 13px; top: 0; bottom: 0; }
.dropDownBox { width:30%; background-color:rgba(255, 255, 255, 1.0) ; display:none; border:#e6eff5 1px solid; position:absolute; }
.dropDownBox label { display: block; font-size: 0.7em; }
.dropDownBox label:hover { background-color: #1e90ff; color:#ffffff; }
.dropDownBox li { margin:0; padding:0;}
</style>
<meta name="funcPathText" content="編輯管理 " />
</head>
<body>
<div class="rightContent frontend">
	<s:form action="index" method="post" validate="true" >
		<s:hidden name="searchCondition.agreePDPL" value="true"/>
		<div>
			<ul>
				<li class="quarter">
					<s:textfield placeholder="姓名" name="searchCondition.name" maxlength="100" />
				</li>
				<li class="quarter">
					<s:select name="searchCondition.gender" list="#{ '男':'男', '女':'女' }" headerKey="" headerValue="選擇性別"/>
				</li>
				<li class="quarter">
					<s:textfield placeholder="產學經驗(起)" name="searchCondition.expYearS" maxlength="3" />
				</li>
				<li class="quarter">
					<s:textfield placeholder="產學經驗(迄)" name="searchCondition.expYearE" maxlength="3" />
				</li>				
				<li class="quarter">
					<s:textfield placeholder="現職單位" name="searchCondition.workOrg" maxlength="100" />
				</li>
				<li class="quarter">
					<div class="multiselect">
						<div class="selectBox" onclick="toggleDropDownBox()">
							<select><option>選擇領域</option></select>
							<div class="overSelect"></div>
						</div>
						<div class="dropDownBox">
							<ul>
								<s:iterator value="mainDomainList" status="stat">
									<li class="all"><b><s:property value="name"/></b></li>
									
									<s:iterator value="subDomainList" status="stat">
									<li class="third">
										<s:checkbox id="%{'chkbox_'+id}" label="%{name}" name="searchCondition.grbDomainIdList" value="%{searchCondition.grbDomainIdList.contains(id)}" fieldValue="%{id}"/>  
										<input type="hidden" class="grbDomainName" value="<s:property value="name"/>" />
									</li>
									</s:iterator>
								</s:iterator>										
							</ul>
						</div>
					</div>
				</li>
				<li class="quarter">
					<s:textfield placeholder="合作專長" name="searchCondition.specialty" maxlength="1000" />
				</li>				
				<li class="quarter">
					<input type="submit" value="查詢" class="redBtn" id="btn-search"/>
					<input type="button" value="清除" class="grayBtn" id="btn-reset"/>
				</li>
			</ul>
		</div>
		<div class="clear"></div>

		<div class="page">
			<s:set var="pgList" value="talentedPeoplePagedList"/>
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
<!-- 					<th nowrap width="10%">照片</th> -->
					<th nowrap width="15%">姓名</th>
					<th nowrap width="3%">性別</th>
					<th nowrap width="">現職單位</th>
					<th nowrap width="">現職職位</th>
					<th nowrap width="">合作專長</th>
				</tr>
				<s:if test="talentedPeoplePagedList != null">
					<s:iterator value="talentedPeoplePagedList.list" status="stat">
						<tr>
							<td>
								<s:property value="%{talentedPeoplePagedList.itemStart + #stat.count -1}" />
								<%-- <s:property value="id" /> --%>
							</td>
<!-- 							<td> -->
<%-- 								<img src="data:image;base64,<s:property value="base64HeadShot"/>" style="max-width:100px; max-height:100px;" /> --%>
<!-- 							</td> -->
							<td>
								<s:url value="/f/talentedPeople/showDetail" var="detailUrlTag" escapeAmp="false">
									<s:param name="id" value="id" />
								</s:url>
								<s:hidden value="%{#detailUrlTag}" class="detail-url" disabled="true"/>
								<a href="#" class="a-showDetail">
									<span style="font-weight:bold;">
										<s:property value="nameCh" />
									</span>
									<br>
									<s:property value="nameEn" />
								</a>
							</td>
							<td><s:property value="gender" /></td>
							<td><s:property value="workOrg" /></td>
							<td><s:property value="job" /></td>
							<td><s:property value="specialty" /></td>
						</tr>
					</s:iterator>
				</s:if>
			</table>
		</div>
		
		<div class="page">
			<s:hidden id="pageIndex" name="searchCondition.pageIndex" />
			<s:hidden id="pageSize" name="searchCondition.pageSize" />
						
			<s:set var="pgList" value="talentedPeoplePagedList"/>
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

