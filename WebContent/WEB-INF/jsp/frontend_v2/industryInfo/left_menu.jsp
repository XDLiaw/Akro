<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<script>
	$(document).ready(function(){
		$("#left-categoryList-form .categoryList li").click(function(){
			var category = $(this).find("input").val();
			$("#left-categoryList-form input[name='searchCondition.category']").val(category);
			$("#left-categoryList-form").submit();
		});
		
		{
			var category = '<s:property value="searchCondition.category"/>';
			$("#left-categoryList-form .categoryList li input[value='"+category+"']").parents("li").addClass("active");
			$("#left-categoryList-form input[name='searchCondition.category']").val(category);
		}

	});
</script>

<s:form action="index" method="post" validate="true" id="left-categoryList-form">
	<s:hidden name="searchCondition.category"/>
	<s:hidden id="pageIndex" name="searchCondition.pageIndex" value="0"/>
	<s:hidden id="pageSize" name="searchCondition.pageSize"/>
	
	<div>
		<ul class="list-group categoryList">
			<s:iterator value="categoryList" status="stat">
				<li class="list-group-item">
					<i class="fa fa-cube right10" aria-hidden="true"></i> 
					<s:property value="name"/>
					<input type="text" style="display:none;" value='<s:property value="name"/>'/>
				</li>
			</s:iterator>
		</ul>
	</div>
</s:form>