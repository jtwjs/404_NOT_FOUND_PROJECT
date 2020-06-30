function registCheck(){
	
	
	
	
	
	
	return true;
}

function selectedOption_1(){
	
	var category_1 = document.getElementById("code01_idx");
	var category_2 = document.getElementById("code02_idx");
	
	// 카테고리1 - 쌀/잡곡 ================================================================
	if(category_1.options[category_1.selectedIndex].value == 1){
		if(category_2 == null) {
			return;
		}else{
			for(var i = 1; i < category_2.options.length; i++){
				category_2.options[i] = null;
			}
		}
		category_2.options.length = 1;
		
		var addOption = new Array();
		
		for(var i = 0; i < 5; i++){
			addOption[i] = document.createElement("option");
		}
		
		addOption[0].text = "백미";
		addOption[0].value = 101;
		category_2.options.add(addOption[0]);
		
		addOption[1].text = "현미/찹쌀/흑미";
		addOption[1].value = 102;
		category_2.options.add(addOption[1]);
		
		addOption[2].text = "콩/팥/보리";
		addOption[2].value = 103;
		category_2.options.add(addOption[2]);
		
		addOption[3].text = "조/수수/깨/기타";
		addOption[3].value = 104;
		category_2.options.add(addOption[3]);
		
		addOption[4].text = "곡류선물세트";
		addOption[4].value = 105;
		category_2.options.add(addOption[4]);
	}
	// 카테고리1 - 쌀/잡곡 end ============================================================
	
	
	// 카테고리2 - 채소류 ================================================================
	if(category_1.options[category_1.selectedIndex].value == 2){
		if(category_2 == null) {
			return;
		}else{
			for(var i = 1; i < category_2.options.length; i++){
				category_2.options[i] = null;
			}
		}
		category_2.options.length = 1;
		
		var addOption = new Array();
		
		for(var i = 0; i < 6; i++){
			addOption[i] = document.createElement("option");
		}
		
		addOption[0].text = "감자/고구마";
		addOption[0].value = 201;
		category_2.options.add(addOption[0]);
		
		addOption[1].text = "더덕";
		addOption[1].value = 202;
		category_2.options.add(addOption[1]);
		
		addOption[2].text = "나물/잎줄기 채소";
		addOption[2].value = 203;
		category_2.options.add(addOption[2]);
		
		addOption[3].text = "건나물/건채소";
		addOption[3].value = 204;
		category_2.options.add(addOption[3]);
		
		addOption[4].text = "버섯류";
		addOption[4].value = 205;
		category_2.options.add(addOption[4]);
		
		addOption[5].text = "옥수수/단호박/기타";
		addOption[5].value = 206;
		category_2.options.add(addOption[5]);
	}
	// 카테고리2 - 채소류 end ============================================================
	
	
	// 카테고리3 - 과일 ================================================================
	if(category_1.options[category_1.selectedIndex].value == 3){
		if(category_2 == null) {
			return;
		}else{
			for(var i = 1; i < category_2.options.length; i++){
				category_2.options[i] = null;
			}
		}
		category_2.options.length = 1;
		
		var addOption = new Array();
		
		for(var i = 0; i < 4; i++){
			addOption[i] = document.createElement("option");
		}
		
		addOption[0].text = "사과/배";
		addOption[0].value = 301;
		category_2.options.add(addOption[0]);
		
		addOption[1].text = "감/홍시/곶감";
		addOption[1].value = 302;
		category_2.options.add(addOption[1]);
		
		addOption[2].text = "견과/건과";
		addOption[2].value = 303;
		category_2.options.add(addOption[2]);
		
		addOption[3].text = "참다래/기타과일";
		addOption[3].value = 304;
		category_2.options.add(addOption[3]);
		
	}
	// 카테고리3 - 과일 end ============================================================
	
	
	// 카테고리4 - 축산물 ================================================================
	if(category_1.options[category_1.selectedIndex].value == 4){
		if(category_2 == null) {
			return;
		}else{
			for(var i = 1; i < category_2.options.length; i++){
				category_2.options[i] = null;
			}
		}
		category_2.options.length = 1;
		
		var addOption = new Array();
		
		for(var i = 0; i < 7; i++){
			addOption[i] = document.createElement("option");
		}
		
		addOption[0].text = "소고기";
		addOption[0].value = 401;
		category_2.options.add(addOption[0]);
		
		addOption[1].text = "돼지고기";
		addOption[1].value = 402;
		category_2.options.add(addOption[1]);
		
		addOption[2].text = "닭";
		addOption[2].value = 403;
		category_2.options.add(addOption[2]);
		
		addOption[3].text = "계란/알류/가공란";
		addOption[3].value = 404;
		category_2.options.add(addOption[3]);
		
		addOption[4].text = "축산선물세트";
		addOption[4].value = 405;
		category_2.options.add(addOption[4]);
		
		addOption[5].text = "유제품";
		addOption[5].value = 406;
		category_2.options.add(addOption[5]);
		
		addOption[6].text = "기타";
		addOption[6].value = 407;
		category_2.options.add(addOption[6]);
		
	}
	// 카테고리4 - 축산물 end ============================================================
	
	
	// 카테고리5 - 수산물/건어물 ================================================================
	if(category_1.options[category_1.selectedIndex].value == 5){
		if(category_2 == null) {
			return;
		}else{
			for(var i = 1; i < category_2.options.length; i++){
				category_2.options[i] = null;
			}
		}
		category_2.options.length = 1;
		
		var addOption = new Array();
		
		for(var i = 0; i < 3; i++){
			addOption[i] = document.createElement("option");
		}
		
		addOption[0].text = "황태/진미채";
		addOption[0].value = 501;
		category_2.options.add(addOption[0]);
		
		addOption[1].text = "수산물선물세트";
		addOption[1].value = 502;
		category_2.options.add(addOption[1]);
		
		addOption[2].text = "기타";
		addOption[2].value = 503;
		category_2.options.add(addOption[2]);
		
	}
	// 카테고리5 - 수산물/건어물 end ============================================================
	
	
	// 카테고리6 - 가공식품/떡류 ================================================================
	if(category_1.options[category_1.selectedIndex].value == 6){
		if(category_2 == null) {
			return;
		}else{
			for(var i = 1; i < category_2.options.length; i++){
				category_2.options[i] = null;
			}
		}
		category_2.options.length = 1;
		
		var addOption = new Array();
		
		for(var i = 0; i < 7; i++){
			addOption[i] = document.createElement("option");
		}
		
		addOption[0].text = "떡";
		addOption[0].value = 601;
		category_2.options.add(addOption[0]);
		
		addOption[1].text = "한과";
		addOption[1].value = 602;
		category_2.options.add(addOption[1]);
		
		addOption[2].text = "면";
		addOption[2].value = 603;
		category_2.options.add(addOption[2]);
		
		addOption[3].text = "음료";
		addOption[3].value = 604;
		category_2.options.add(addOption[3]);
		
		addOption[4].text = "냉장냉동간편조리";
		addOption[4].value = 605;
		category_2.options.add(addOption[4]);
		
		addOption[5].text = "기름";
		addOption[5].value = 606;
		category_2.options.add(addOption[5]);
		
		addOption[6].text = "기타";
		addOption[6].value = 607;
		category_2.options.add(addOption[6]);
		
	}
	// 카테고리6 - 가공식품/떡류 end ============================================================
	
	
	// 카테고리7 - 김치/반찬/젓갈 ================================================================
	if(category_1.options[category_1.selectedIndex].value == 7){
		if(category_2 == null) {
			return;
		}else{
			for(var i = 1; i < category_2.options.length; i++){
				category_2.options[i] = null;
			}
		}
		category_2.options.length = 1;
		
		var addOption = new Array();
		
		for(var i = 0; i < 4; i++){
			addOption[i] = document.createElement("option");
		}
		
		addOption[0].text = "김치/절임배추";
		addOption[0].value = 601;
		category_2.options.add(addOption[0]);
		
		addOption[1].text = "반찬/절임";
		addOption[1].value = 602;
		category_2.options.add(addOption[1]);
		
		addOption[2].text = "젓갈";
		addOption[2].value = 603;
		category_2.options.add(addOption[2]);
		
		addOption[3].text = "기타";
		addOption[3].value = 604;
		category_2.options.add(addOption[3]);
		
	}
	// 카테고리7 - 김치/반찬/젓갈 end ============================================================
	
	
	// 카테고리8 - 장/조청/식초 ================================================================
	if(category_1.options[category_1.selectedIndex].value == 8){
		if(category_2 == null) {
			return;
		}else{
			for(var i = 1; i < category_2.options.length; i++){
				category_2.options[i] = null;
			}
		}
		category_2.options.length = 1;
		
		var addOption = new Array();
		
		for(var i = 0; i < 8; i++){
			addOption[i] = document.createElement("option");
		}
		
		addOption[0].text = "간장";
		addOption[0].value = 801;
		category_2.options.add(addOption[0]);
		
		addOption[1].text = "고추장";
		addOption[1].value = 802;
		category_2.options.add(addOption[1]);
		
		addOption[2].text = "된장";
		addOption[2].value = 803;
		category_2.options.add(addOption[2]);
		
		addOption[3].text = "청국장";
		addOption[3].value = 804;
		category_2.options.add(addOption[3]);
		
		addOption[4].text = "장류선물세트";
		addOption[4].value = 805;
		category_2.options.add(addOption[4]);
		
		addOption[5].text = "식초/액젓";
		addOption[5].value = 806;
		category_2.options.add(addOption[5]);
		
		addOption[6].text = "조청";
		addOption[6].value = 807;
		category_2.options.add(addOption[6]);
		
		addOption[7].text = "기타";
		addOption[7].value = 808;
		category_2.options.add(addOption[7]);
		
	}
	// 카테고리8 - 장/조청/식초 end ============================================================
	
	
	// 카테고리9 - 건강식품 ================================================================
	if(category_1.options[category_1.selectedIndex].value == 9){
		if(category_2 == null) {
			return;
		}else{
			for(var i = 1; i < category_2.options.length; i++){
				category_2.options[i] = null;
			}
		}
		category_2.options.length = 1;
		
		var addOption = new Array();
		
		for(var i = 0; i < 7; i++){
			addOption[i] = document.createElement("option");
		}
		
		addOption[0].text = "유산균";
		addOption[0].value = 901;
		category_2.options.add(addOption[0]);
		
		addOption[1].text = "홍삼/인삼";
		addOption[1].value = 902;
		category_2.options.add(addOption[1]);
		
		addOption[2].text = "건강즙";
		addOption[2].value = 903;
		category_2.options.add(addOption[2]);
		
		addOption[3].text = "영양식/선식";
		addOption[3].value = 904;
		category_2.options.add(addOption[3]);
		
		addOption[4].text = "꿀/로얄젤리";
		addOption[4].value = 905;
		category_2.options.add(addOption[4]);
		
		addOption[5].text = "건강분말/건강환";
		addOption[5].value = 906;
		category_2.options.add(addOption[5]);
		
		addOption[6].text = "기타";
		addOption[6].value = 907;
		category_2.options.add(addOption[6]);
		
	}
	// 카테고리9 - 건강식품 end ============================================================
	
	
	// 카테고리10 - 차류 ================================================================
	if(category_1.options[category_1.selectedIndex].value == 10){
		if(category_2 == null) {
			return;
		}else{
			for(var i = 1; i < category_2.options.length; i++){
				category_2.options[i] = null;
			}
		}
		category_2.options.length = 1;
		
		var addOption = new Array();
		
		for(var i = 0; i < 4; i++){
			addOption[i] = document.createElement("option");
		}
		
		addOption[0].text = "커피";
		addOption[0].value = 1001;
		category_2.options.add(addOption[0]);
		
		addOption[1].text = "전통차/허브차/꽃차";
		addOption[1].value = 1002;
		category_2.options.add(addOption[1]);
		
		addOption[2].text = "커피/차 선물세트";
		addOption[2].value = 1003;
		category_2.options.add(addOption[2]);
		
		addOption[3].text = "기타";
		addOption[3].value = 1004;
		category_2.options.add(addOption[3]);
		
	}
	// 카테고리10 - 차류 end ============================================================
}