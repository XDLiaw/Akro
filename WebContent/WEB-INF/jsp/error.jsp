<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head><title>Error page</title></head>
<body>

	<div class="alert alert-danger">
	    <h1><s:property value="exceptionName"/> : <s:property value="exceptionMessage"/></h1>
	    <br/>
	
		<s:if test="exceptionStack != null">
			<s:iterator value="exceptionStack" status="stat">
			    <pre>
			        <s:property />
			    </pre>
		    </s:iterator>
	    </s:if>	
	</div>

</body>
</html>