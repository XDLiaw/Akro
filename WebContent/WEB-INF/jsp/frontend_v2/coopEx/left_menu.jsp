<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<script>
	$(document).ready(function(){
		$("#left-typeList-form .typeList li").click(function(){
			var type = $(this).find("input").val();
			$("#left-typeList-form input[name='searchCondition.type']").val(type);
			$("#left-typeList-form").submit();
		});
		
		{
			var type = '<s:property value="searchCondition.type"/>';
			$("#left-typeList-form .typeList li input[value='"+type+"']").parents("li").addClass("active");
			$("#left-typeList-form input[name='searchCondition.type']").val(type);
		}

	});
</script>

<s:form action="index" method="post" validate="true" id="left-typeList-form">
	<s:hidden name="searchCondition.type"/>
	<s:hidden id="pageIndex" name="searchCondition.pageIndex" value="0"/>
	<s:hidden id="pageSize" name="searchCondition.pageSize"/>
	
	<div>
		<ul class="list-group typeList">
			<s:iterator value="typeList" status="stat">
				<li class="list-group-item">
					<i class="fa fa-cube right10" aria-hidden="true"></i> 
					<s:property value="name"/>
					<input type="text" style="display:none;" value='<s:property value="name"/>'/>
				</li>
			</s:iterator>
		</ul>
	</div>
</s:form>