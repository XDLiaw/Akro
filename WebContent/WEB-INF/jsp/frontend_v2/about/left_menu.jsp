<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<script>
	$(document).ready(function(){
		$("#left-menu-form .menu li").click(function(){
			var id = $(this).find("input").val();
			$("#left-menu-form input[name='id']").val(id);
			$("#left-menu-form").submit();
		});
		
		{
			var id = '<s:property value="about.id"/>';
			$("#left-menu-form .menu li input[value='"+id+"']").parents("li").addClass("active");
			$("#left-menu-form input[name='id']").val(id);
		}

	});
</script>

<s:form action="showDetail" method="post" validate="true" id="left-menu-form">
	<s:hidden name="id"/>
	
	<div>
		<ul class="list-group menu">
			<s:iterator value="aboutMenuList" status="stat">
				<li class="list-group-item">
					<i class="fa fa-cube right10" aria-hidden="true"></i> 
					<s:property value="name"/>
					<input type="text" style="display:none;" value='<s:property value="code"/>'/>
				</li>
			</s:iterator>
		</ul>
	</div>
</s:form>