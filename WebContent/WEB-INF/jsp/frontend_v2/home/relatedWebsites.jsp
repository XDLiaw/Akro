<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<link rel="stylesheet" type="text/css" href="<s:url value="/css/swiper.css"/>" />
<script type="text/javascript" src="<s:url value="/scripts/swiper/swiper.min.js"/>"></script>

<style>
.swiper-container {
	width: 100%;
	height: 80px;
	margin: 10px auto;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}
</style>

<!-- Initialize Swiper -->
<script>
	$(document).ready(function(){
		var swiper = new Swiper('.swiper-container', {
			paginationClickable: true,
			slidesPerView: 6,
			spaceBetween: 20,
			autoplay: 3000,
			nextButton: '.swiper-button-next',
			prevButton: '.swiper-button-prev',
			breakpoints: {
				1024: {
					slidesPerView: 5,
					spaceBetween: 40
				},
				768: {
					slidesPerView: 4,
					spaceBetween: 30
				},
				640: {
					slidesPerView: 3,
					spaceBetween: 20
				},
				320: {
					slidesPerView: 2,
					spaceBetween: 10
				}
			}
		});
	});
</script>


<!-- 相關網站 -->
<div class="container top30">
	<div class="row">
		<div class="col-sm-12 col-xs-12 text-center">
			<div class="large_title_01">
				<i class="fa fa-calendar-check-o" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>相關網站
			</div>
			<div>
				<img src="<s:url value="/images/frontend-v2/line_index.jpg"/>" class="img-responsive" alt="" />
			</div>
		</div>
	</div>

	<div class="swiper-container">
		<div class="swiper-wrapper">
			<s:iterator value="relatedWebsiteList" status="stat">
				<div class="swiper-slide">
					<a href="<s:property value="url"/>" target="_blank">
						<s:url namespace="/relatedWebsite" action="getImageByName" escapeAmp="false" var="ImgUrl">
							<s:param name="fileName" value="picName" />
						</s:url>
						<img src="<s:property value="#ImgUrl"/>" class="img-thumbnail" alt=""/>
					</a>
				</div>
			</s:iterator>
		</div>
		<!-- Add Arrows -->
		<div class="swiper-button-next" style="right: 0; opacity: 0.3"></div>
		<div class="swiper-button-prev" style="left: 0; opacity: 0.3"></div>
	</div>
</div>