<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<script src="https://d3js.org/d3.v4.min.js"></script>

<style>
.chart div {
	font: 10px sans-serif;
	background-color: steelblue;
	text-align: right;
	padding: 3px;
	margin: 1px;
	color: white;
}
</style>
<script>
	$(document).ready(function(){
		var data = [4, 8, 15, 16, 23, 42];
		
		d3.select(".chart")
		  .selectAll("div")
		    .data(data)
		  .enter().append("div")
		    .style("width", function(d) { return d * 10 + "px"; })
		    .text(function(d) { return d; });
	});
</script>



<div class="row">
	<s:if test="searchCondition.className == iace.entity.researchPlan.Technology">

		<p></p>

	</s:if>
	
	<div class="chart">
	</div>
</div>