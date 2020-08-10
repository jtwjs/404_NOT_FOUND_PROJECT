function pageViewOption(url, sort_list, pageNum, val, category_1, category_2, category_local, 
		min_price, max_price, searchCase){
	
	var keyword = document.getElementById("search-box__keyword").value;
    
    location.href= url + "?sort_list=" + sort_list + "&keyword=" + keyword + 
        "&page_num=" + pageNum + "&page_amount=" + val + "&category_1=" + category_1 + 
        "&category_2=" + category_2 + "&category_local=" + category_local + 
	    "&min_price=" + min_price + "&max_price=" + max_price + "&priceSelect=" + searchCase;
}

function setStyle(amount, sort_list, keyword, category_1, category_2, category_local, 
		min_price, max_price, searchCase){
	
	var keywordInput = document.getElementById("search-box__keyword");
	var category_1Input = document.getElementById("search-box__category-1");
	var category_2Input = document.getElementById("search-box__category-2");
	var category_localInput = document.getElementById("search-box__category-local");
	
	keywordInput.value = keyword;
	
	for(var i = 0 ; i < category_1Input.length; i++){
        if(category_1Input.options[i].value == category_1){
        	category_1Input.options[i].selected = true;
        	break;
        }
    }
	
	categoryChange();
	
	for(var i = 0 ; i < category_2Input.length; i++){
        if(category_2Input.options[i].value == category_2){
        	category_2Input.options[i].selected = true;
        	break;
        }
    }
	
	for(var i = 0 ; i < category_localInput.length; i++){
        if(category_localInput.options[i].value == category_local){
        	category_localInput.options[i].selected = true;
        	break;
        }
    }
	
	if(searchCase == 1){
		min_price = "";
		document.getElementById("price-search-box__search-1").style.backgroundColor = "#fff";
	}else if(searchCase == 2){
		document.getElementById("price-search-box__search-2").style.backgroundColor = "#fff";
	}else if(searchCase == 3){
		document.getElementById("price-search-box__search-3").style.backgroundColor = "#fff";
	}else if(searchCase == 4){
		document.getElementById("price-search-box__search-4").style.backgroundColor = "#fff";
	}else if(searchCase == 5){
		document.getElementById("price-search-box__search-5").style.backgroundColor = "#fff";
		max_price = "";
	}else{
		
		if(min_price == 0){
			min_price = "";
		}
		
		if(max_price == 9999999){
			max_price = "";
		}
		
	}
	
	var min_priceInput = document.getElementById("search-box__min-price");
	var max_priceInput = document.getElementById("search-box__max-price");
	
	min_priceInput.value = min_price;
	max_priceInput.value = max_price;
	
	
	var sortList1 = document.getElementById("sort-list--" + sort_list);
	sortList1.style.color = "#0bbf0b";
	sortList1.style.fontSize = "17px";
	sortList1.style.fontWeight = "bold";
	
	var viewOption = document.getElementById("qty_view");

	for(var i = 0 ; i < viewOption.length; i++){
        if(viewOption.options[i].value == amount){
        	viewOption.options[i].selected = true;
        	break;
        }
    }
	
	var nowPage = document.getElementById("now-page");
	nowPage.style.color = "#0bbf0b";
}

function categoryChange(){
	
	var category_1 = document.getElementById("search-box__category-1");
	var category_2 = document.getElementById("search-box__category-2");
	
	// 카테고리1 - 쌀/잡곡 ================================================================
	if(category_1.options[category_1.selectedIndex].value == 1){
		category_2.options.length = 2;
		
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
		
		category_2.options.length = 2;
		
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
		
		category_2.options.length = 2;
		
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

		category_2.options.length = 2;
		
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

		category_2.options.length = 2;
		
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

		category_2.options.length = 2;
		
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

		category_2.options.length = 2;
		
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
		
		category_2.options.length = 2;
		
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
		
		category_2.options.length = 2;
		
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
		
		category_2.options.length = 2;
		
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

function searchBoardProductList(searchCase){
	
    var keyword = document.getElementById("search-box__keyword").value;
	
	if(keyword == ""){
		alert("검색어를 입력해주세요");
		return false;
	}
	
	var category_1 = document.getElementById("search-box__category-1").value;
	var category_2 = document.getElementById("search-box__category-2").value;
	var category_local = document.getElementById("search-box__category-local").value;
	var min_price = document.getElementById("search-box__min-price").value;
	var max_price = document.getElementById("search-box__max-price").value;
	
	if(searchCase == 1){
		max_price = 10000;
	}else if(searchCase == 2){
		min_price = 10000;
		max_price = 50000;
	}else if(searchCase == 3){
		min_price = 50000;
		max_price = 150000;
	}else if(searchCase == 4){
		min_price = 150000;
		max_price = 300000;
	}else if(searchCase == 5){
		min_price = 300000;
	}
	
	location.href = "BoardProductSearch.bo?keyword=" + keyword + "&category_1=" + category_1 + 
	    "&category_2=" + category_2 + "&category_local=" + category_local + 
	    "&min_price=" + min_price + "&max_price=" + max_price + "&priceSelect=" + searchCase;
}


var min_saveVal = "";
var max_saveVal = "";

function minPriceText(thisTxt){
	
	var maxPrice = document.getElementById("search-box__max-price");
	
	if(thisTxt.value != ""){
		if (!(new RegExp(/^[0-9]+$/)).test(thisTxt.value)) {
			thisTxt.value = min_saveVal;
		}
		
		if(maxPrice == ""){
			maxPrice.value = 0;
		}
		
		if(thisTxt.value >= Number(maxPrice.value)){
			maxPrice.value = thisTxt.value;
		}else if(thisTxt.value < 0){
			thisTxt.value = 0;
		}
		
		min_saveVal = thisTxt.value;
    }
	
}

function maxPriceText(thisTxt){
	
	var minPrice = document.getElementById("search-box__min-price").value;
	
	if(thisTxt.value != ""){
		if (!(new RegExp(/^[0-9]+$/)).test(thisTxt.value)) {
			thisTxt.value = max_saveVal;
		}
		
		if(minPrice == ""){
			minPrice = 0;
		}
		
		if(thisTxt.value <= Number(minPrice)){
			thisTxt.value = Number(minPrice);
		}else if(thisTxt.value == 0){
			thisTxt.value = 0;
		}
		
		max_saveVal = thisTxt.value;
    }
	
}