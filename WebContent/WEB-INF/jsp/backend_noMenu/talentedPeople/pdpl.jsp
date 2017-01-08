<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function(){
		$("input[type=submit]").click(function(event) {
			event.preventDefault();
			
			if ($("input[name='talentedPeoplePDPL.agreePDPL']:checked ").length == 1) {
				$("form").submit();
				return true;
			} else {
				alert("您尚未勾選");
				return false;
			}
		});
	});
</script>
<style type="text/css">
.subTitle {
	text-align: center;
	font-size: 1.3em;
	font-weight: bold;
	color: #666;
	padding: 0 0 20px 24px;
	margin-bottom: 10px;
	display: block;
	position: relative;
}
.top-desc {
	padding: 15px;
	margin-bottom: 10px;
	border: 1px solid transparent;
	border-radius: 3px;
	background-color: #F8F8FF;
	color: #0000a0;
	font-size: 1.1em;
}
.PDPL-detail-desc {
	padding: 15px;
	margin-bottom: 23px;
	border: 1px solid transparent;
	border-radius: 3px;
	background-color: #EEEEEE;
	border-color: #505050;
	color: #000000;
}
</style>	
</head>
<body>
<div class="rightContent frontend">
    <s:form namespace="/f/talentedPeople" action="PDPLSubmit" method="post" validate="true" >
		<s:hidden name="talentedPeoplePDPL.id"/>
		
		<h2 class="subTitle">個人資料蒐集、及利用之告知暨同意書</h2>
		<div class="top-desc">
			<p>請詳閱下列「個人資料蒐集、處理及利用之告知事項」後，於最下方「同意事項」中勾選是否同意後，按下「提交」鍵即可，謝謝。</p>
		</div>
		<div class="PDPL-detail-desc">
			<span>【告知事項】</span> <br>
			<br> 
			<span> 工業技術研究院(下稱本院)基於 執行科技部105年度「運用法人鏈結產學合作計畫」， 為建立產學合作人才資料庫事由，蒐集、處理及利用您所提供、或未來將提供、或由政府、學校等網站上蒐集到的個人資料（下稱個資），謹先告知下列事項：</span><br><br> 
			<span> 一、蒐集目的： </span><br> 
			<span style="padding-left: 32px">● 為執行科技部委託本院辦理之105年度「運用法人鏈結產學合作計畫」相關業務。</span><br>
			<span style="padding-left: 32px">● 為建立產學合作人才資料庫，並提供外界查詢。</span><br>
			<br> 
			<span> 二、個資類別： </span><br> 
			<span style="padding-left: 32px"> C001 辨識個人者。如：姓名、職稱、地址、電話、E-MAIL等。 </span><br> 
			<span style="padding-left: 32px"> C011 個人描述。如：性別、出生年等。 </span><br>
			<span style="padding-left: 32px"> C038 職業。如：學校校長、教授、或其他各種職務等。 </span><br> 
			<span style="padding-left: 32px"> C051 學校紀錄。如：大學、研究所或其他學校等學歷記錄。 </span><br>
			<span style="padding-left: 32px"> C052 資格或技術。如：學歷資格、專業技術、執照、專利、獲獎記錄等。 </span><br>
			<span style="padding-left: 32px"> C054 職業專長。例如：專家、學者、顧問等。 </span><br> 
			<span style="padding-left: 32px"> C056 著作。如：書籍、文章、報告、論文、視聽出版品及其他著作等。 </span><br>
			<span style="padding-left: 32px"> C060 受僱情形：如：目前之受僱情形、過去之僱用經過與工作經驗。 </span><br> 
			<span style="padding-left: 32px"> C132 其他未分類資料：校務執行經驗與相關資訊等。 </span><br>
			<br> 
			<span> 三、利用期間：至蒐集目的消失為止。 </span><br>
			<br> 
			<span> 四、利用地區：中華民國地區及本院北美公司及國外辦事處/室所在地區。 </span><br>
			<br> 
			<span> 五、利用者：本院及科技部「運用法人鏈結產學合作計畫」網站、「鏈結產學媒合平台」(Industry-Academia Catalyst E-Platform, I-ACE)之會員。 </span><br>
			<br> 
			<span> 六、利用方式：在不違反蒐集目的的前提下，將調查結果建置為統計資訊，以網際網路、電子郵件、書面、傳真及其他合法方式利用之。 </span><br>
			<br> 
			<span> 七、您得以書面主張下列權利： </span><br> 
			<span style="padding-left: 32px"> （一）查詢或請求閱覽。 </span><br> 
			<span style="padding-left: 32px"> （二）請求製給複製本。 </span><br> 
			<span style="padding-left: 32px"> （三）請求補充或更正。 </span><br> 
			<span style="padding-left: 32px"> （四）請求停止蒐集、處理或利用。 </span><br> 
			<span style="padding-left: 32px"> （五）請求刪除。 </span><br>
			<br> <span> 八、以上個資除由當事人本人提供外，有需要時，本院亦會透過網際網路，由政府、學校、及其他公開網站取得相關資訊。 </span><br>
			<br> <span> 九、您若不簽署本告知暨同意書，本院將無法對您提供產學合作人才庫相關服務。 </span><br>
			<br> <span> 十、對本院所持有您的個資，本院會按照政府相關法規予以保密並妥善保管。 </span><br>
			<br>
			<br> 
			<span> 財團法人工業技術研究院 </span><br>
			<span> 代理人 </span><br>
			<br> 
			<span style="padding-left: 32px"> 姓 名：蘇孟宗 </span><br>
			<span style="padding-left: 32px"> 職 稱：產業經濟與趨勢中心主任 </span><br>
			<br>
		</div>
		
		<div class="applicant-data">
			<span>【同意事項】</span><br>
			<span>本人已閱讀並瞭解上述告知事項，並同意貴院在符合上述告知事項範圍內，蒐集、處理及利用本人的個資。本項同意得以電子文件方式表達。</span><br>
			<br>
			<span>當事人：</span><span style="color:red;"><s:property value="talentedPeoplePDPL.talentedPeople.nameCh"/> (請確認是否本人)</span><br>
			<s:radio name="talentedPeoplePDPL.agreePDPL" list="#{'true': '同意', 'false': '不同意'}" class="horizontalList"/><br>
		</div>
    	<br>
    	<s:submit cssClass="btn btn-default redBtn" value="送出" />	
    </s:form>
</div>    
</body>
</html>