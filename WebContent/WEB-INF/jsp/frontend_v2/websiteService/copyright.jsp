<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$('ul.categoryList li:contains("版權宣告")').addClass("active");
	});
</script>
<style>
.service-txt-20px-B {
	font-family: "微軟正黑體";
	font-size: 20px;
	line-height: 30px;
	color: #47C0FF;
	font-weight: bold;
}
</style>
</head>
<body>
	<!-- Banner -->
	<s:include value="./banner.jsp" />

	<!-- Main -->
	<div class="container top50">
		<div class="row">
			<div class="col-sm-12 col-xs-12">
				<div>
					<div class="large_title_01">
						<i class="fa fa-calendar-check-o" aria-hidden="true" style="font-size: 18px; margin-right: 5px;"></i>網站服務
					</div>
					<div class="line_blue">&nbsp;</div>
					<div class="line_gray1px bottom20"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- 左選單 -->
			<div class="col-sm-3 col-xs-12 bottom20">
				<s:include value="./left_menu.jsp" />
			</div>
			<!-- 右列表 -->
			<div class="col-sm-9 col-xs-12 bottom20">
				<div class="large_title_03">版權宣告</div>
				<div class="content_01 top10">
					<p>
						閱覽或使用本站資料前，請詳讀本法律聲明所列之事項，您閱覽或使用本網站資料，即表示您同意遵守本法律聲明中所列之全部事項。<br> <br>
					</p>
					<h3>一、本網站內容受中華民國智慧財產權法保護</h3>
					本網站之內容及素材著作權歸財團法人工業技術研究院所有，使用本網站資料請注意下列原則：
					<ol>
						<li>非經工研院之允許，資料不得以任何形式、利用電子、機械、影印、錄音或其他方式，局部或全部予以重製或傳送，亦不得隨意修改網站資料。</li>
						<li>除網頁上有特殊聲明外，在合理的範圍內，您可以下載或列印本站的網頁作為研究或個人非營利目的之使用。</li>
						<li>為便於在電腦螢幕上瀏覽，您可以暫時將所需檔案備份在電腦中。</li>
						<li>下載或列印後的資料，不得隨意更動其中的內容與智權聲明。</li>
						<li>本網站內容所涉及的公司、產品、商標均為工研院所有。</li>
					</ol>
					<p>&nbsp;</p>
					<h3>二、採用本網站資訊之前，請對網頁內容再作進一步的確認</h3>
					<ol>
						<li>本網站所提供的資訊不應據為施行各種活動的依據。</li>
						<li>本網站所提供的資訊是工研院為執行其任務所傳播的產業、科技資訊。不是解決專業的、醫學的、科學的或技術的問題之建議。</li>
						<li>本網站所提供的資訊在尖端科技領域中，仍有極大的不確定性，不能保證資訊的正確性、時效性及完整性。</li>
						<li>本網站所提供的資訊時時會更動，無法一一週知。</li>
						<li>本網站因事實上無法就所提供之全部資料作有無侵權之審查，故不保證所提供之資料絕無侵害他人權利之可能。使用者應自行承擔因使用本站資料可能產生之任何損害。</li>
					</ol>
					<p>&nbsp;</p>
					<h3>三、對投稿者之聲明</h3>
					<p>
						若您欲投稿於本站時，請先確認並保證對投稿之著作享有著作權法上之正當權利，絕無侵害他人權益之情事，並同意不論營利與否本站對該著作皆享有公開、重製、改作、編輯及傳送等權利。 <br> <br>
					</p>
					<h3>四、網站連結(links)的聲明</h3>
					<p>
						本網站保留被連結或框置(framed)的權利，連結或框置需事先告知。 <br> 本網站在內容上連往其他網站僅是為方便使用，不代表工研院為其內容背書。<br> <br>
					</p>
					<h3>五、請注意網路安全性與電腦病毒</h3>
					<ol>
						<li>全球資訊網(WWW)仍有某些不安全因素，因此和本網站傳輸資料時，有可能會被第三者攔截或修改。</li>
						<li>我們會十分小心本站的安全性，但不能保證從本網站傳出的資料絕對不含電腦病毒。</li>
					</ol>
					<p>&nbsp;</p>
					<h3>六、線上資料之隱私保護</h3>
					<ol>
						<li>當您向我們的網站提供個人資料時，我們會負責地使用資料，這些個人資料只被用以協助我們對您提供更好的服務。</li>
						<li>為了更加瞭解您的需要，在網頁的服務熱線或某些功能下，本網站會請您提供更進一步的個人資料，包括姓名、地址和電話號碼。其次，您也會有機會可以選擇不從我們這裡獲取訊息。在您登錄訂閱電子新聞信或電子郵件後，所有本網站寄出的電子郵件都會詳列「取消訂閱」的方法。</li>
						<li>機密資料請勿傳入本站，本站收到的問題與疑難皆會經過內部相關技術部門的處理。</li>
						<li>在取得您的同意之前，本站不會向其他公司或人士提供您的個人資料。但是，為了向您傳遞特定服務時，例如您要求工研院提供客戶支援服務或要求印刷文件時，我們可能必須向貨運公司等第三者提供您的姓名和送貨地址。</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</body>
</html>