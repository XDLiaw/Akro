<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<s:url namespace="/captcha" action="generateCaptchaImage" var="captchaImgUrl"/>
<script>
	$(function(){
		$("#CaptchaCodeImg").click(function(){
			$(this).attr("src","<s:property value='#captchaImgUrl'/>?timestamp="+new Date().getTime());
		});	
	});
</script>

<img src="<s:property value="#captchaImgUrl"/>" id="CaptchaCodeImg" title="看不清? 點擊換一張" style="cursor:pointer;"/>
<s:textfield name="captchaCode" placeholder="輸入圖片中的文字" class="form-control" value="" autocomplete="off"/>
(點選驗證碼圖片更新驗證碼)