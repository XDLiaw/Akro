<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$('ul.categoryList li:contains("隱私權宣告")').addClass("active");
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
				<div class="large_title_03">隱私權宣告</div>
				<div class="content_01 top10">
					<table>
						<tr>
							<td width="5%" valign="top"><span class="service-txt-15px">壹、</span></td>
							<td colspan="2" valign="top"><span class="service-txt-15px">告知事項 本站為了蒐集、處理及利用，基於本服務之相關事由您所提供，或未來基於各種事由將提供的個人資料（下稱個資），謹先告知下列事項： </span></td>
						</tr>
						<tr>
							<td valign="top">&nbsp;</td>
							<td width="5%" valign="top"><span class="service-txt-15px">一、</span></td>
							<td width="90%" valign="top"><span class="service-txt-15px">蒐集目的：008基於中小企業及其他產業之輔導；013公共關係；040行銷；063非公務機關依法定義務所進行個人資料之蒐集處理及利用；073政 府資訊公開、檔案管理及應用；075科技行政；090消費者、客戶管理與服務；
									098商業與技術資訊；109教育或訓練行政；110產學合作；118智慧財產權、光碟管理及其他相關行政；123貿易推廣及管理；132經營傳播業 務；135資（通）訊服務；136（通）訊業務與資料庫管理；137資通安全業務與管理；148網路購物及其他電子商務服務；152廣告和商業行為管
									理；157調查、統計與研究分析；181其他經營合於營業登記項目或組織章程所定之業務；069其他契約、類似契約或法律關係管理之事務或業務；182其 他諮詢與顧問服務；036存款與匯款。 </span></td>
						</tr>
						<tr>
							<td valign="top">&nbsp;</td>
							<td valign="top"><span class="service-txt-15px">二、</span></td>
							<td valign="top"><span class="service-txt-15px">個資類別：辨識個人者、辨識財務者、政府資料中之辨識者、個人描述、職業、現行之受僱情形等個人資料。 </span></td>
						</tr>
						<tr>
							<td valign="top">&nbsp;</td>
							<td valign="top"><span class="service-txt-15px">三、</span></td>
							<td valign="top"><span class="service-txt-15px">利用期間：至蒐集目的消失為止。</span></td>
						</tr>
						<tr>
							<td valign="top">&nbsp;</td>
							<td valign="top"><span class="service-txt-15px">四、</span></td>
							<td valign="top"><span class="service-txt-15px">利用地區：中華民國地區及本站國外之駐點及辦事處所在地區。</span></td>
						</tr>
						<tr>
							<td valign="top">&nbsp;</td>
							<td valign="top"><span class="service-txt-15px">五、</span></td>
							<td valign="top"><span class="service-txt-15px">利用者：本站及其他與本站有業務往來之公務及非公務機關。 </span></td>
						</tr>
						<tr>
							<td valign="top">&nbsp;</td>
							<td valign="top"><span class="service-txt-15px">六、</span></td>
							<td valign="top"><span class="service-txt-15px">利用方式：在不違反蒐集目的的前提下，以網際網路、電子郵件、書面、傳真及其他合法方式利用之。</span></td>
						</tr>
						<tr>
							<td valign="top">&nbsp;</td>
							<td valign="top"><span class="service-txt-15px">七、</span></td>
							<td valign="top"><span class="service-txt-15px">您得以書面主張下列權利： （一）查詢或請求閱覽。 （二）請求製給複製本。 （三）請求補充或更正。 （四）請求停止蒐集、處理或利用。 （五）請求刪除。 </span></td>
						</tr>
						<tr>
							<td valign="top">&nbsp;</td>
							<td valign="top"><span class="service-txt-15px">八、</span></td>
							<td valign="top"><span class="service-txt-15px">對本站所持有您的個資，本院會按照政府相關法規保密並予以妥善保管。</span></td>
						</tr>
						<tr>
							<td valign="top"><span class="service-txt-15px">貳、</span></td>
							<td colspan="2" valign="top"><span class="service-txt-15px">同意事項 您已閱讀並瞭解上述告知事項，並同意本站在符合上述告知事項範圍內，蒐集、處理及利用您的個資。</span></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>