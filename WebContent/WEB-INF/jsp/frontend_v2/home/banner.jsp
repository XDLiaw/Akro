<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<!-- Banner -->
<div id="carousel1" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#carousel1" data-slide-to="0" class="active"></li>
		<li data-target="#carousel1" data-slide-to="1"></li>
		<li data-target="#carousel1" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img src="<s:url value="/images/frontend-v2/banner_index_01.jpg"/>" alt="First slide image" class="center-block">
		</div>
		<div class="item">
			<img src="<s:url value="/images/frontend-v2/banner_index_02.jpg"/>" alt="First slide image" class="center-block">
		</div>
		<div class="item">
			<img src="<s:url value="/images/frontend-v2/banner_index_03.jpg"/>" alt="First slide image" class="center-block">
		</div>
	</div>
	<a class="left carousel-control" href="#carousel1" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span></a>
	<a class="right carousel-control" href="#carousel1" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span></a>
</div>