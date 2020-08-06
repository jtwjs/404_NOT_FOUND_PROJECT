$(document).ready(function(){

	var category1 = document.getElementById('product_type');
	switch(category1.value){
	case "1": grain.classList.add('selected'); break;
	case "2": vegetable.classList.add('selected'); break;
	case "3": fruit.classList.add('selected'); break;
	case "4": liveStock.classList.add('selected'); break;
	case "5": aquatic.classList.add('selected'); break;
	case "6": processedFood.classList.add('selected'); break;
	case "7": kimchi.classList.add('selected'); break;
	case "8": jang.classList.add('selected'); break;
	case "9": health.classList.add('selected'); break;
	case "10": tea.classList.add('selected'); break;
	}


	var refImg = document.getElementById('repImg').value,
		Img2 = document.getElementById('productThumbImg2').value,
		Img3 = document.getElementById('productThumbImg3').value,
		Img4 = document.getElementById('productThumbImg4').value;
	
	document.getElementById('representImgLabel').style.backgroundImage = "url("+refImg+")";
	document.getElementById('representImgLabel').style.backgroundSize = "cover";
	document.getElementById('representImgLabel').style.backgroundPosition = "center";
	document.getElementById('representImgLabel').innerHTML= '';

	document.getElementById('productImg1Label').style.backgroundImage = "url("+Img2+")";
	document.getElementById('productImg1Label').style.backgroundSize = "cover";
	document.getElementById('productImg1Label').style.backgroundPosition = "center";
	document.getElementById('productImg1Label').innerHTML= '';

	document.getElementById('productImg2Label').style.backgroundImage = "url("+Img3+")";
	document.getElementById('productImg2Label').style.backgroundSize = "cover";
	document.getElementById('productImg2Label').style.backgroundPosition = "center";
	document.getElementById('productImg2Label').innerHTML= '';

	document.getElementById('productImg3Label').style.backgroundImage = "url("+Img4+")";
	document.getElementById('productImg3Label').style.backgroundSize = "cover";
	document.getElementById('productImg3Label').style.backgroundPosition = "center";
	document.getElementById('productImg3Label').innerHTML= '';
			    	
if(document.getElementById('product_type').value == 1){
	if(category_2 == null) {
		return;
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
	
	var select_index = document.getElementById('category2').value.slice(-1) -1;
	addOption[select_index].selected = "selected";
}

if(document.getElementById('product_type').value == 2){
	if(category_2 == null) {
		return;
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
	
	var select_index = document.getElementById('category2').value.slice(-1) -1;
	addOption[select_index].selected = "selected";
	
}
if(document.getElementById('product_type').value == 3){
	if(category_2 == null) {
		return;
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
	
	var select_index = document.getElementById('category2').value.slice(-1) -1;
	addOption[select_index].selected = "selected";
}
if(document.getElementById('product_type').value == 4){
	if(category_2 == null) {
		return;
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
	var select_index = document.getElementById('category2').value.slice(-1) -1;
	addOption[select_index].selected = "selected";
}
if(document.getElementById('product_type').value == 5){

	if(category_2 == null) {
		return;
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
	var select_index = document.getElementById('category2').value.slice(-1) -1;
	addOption[select_index].selected = "selected";
}
if(document.getElementById('product_type').value == 6){
	if(category_2 == null) {
		return;
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
	var select_index = document.getElementById('category2').value.slice(-1) -1;
	addOption[select_index].selected = "selected";
}
if(document.getElementById('product_type').value == 7){

	if(category_2 == null) {
		return;
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
	var select_index = document.getElementById('category2').value.slice(-1) -1;
	addOption[select_index].selected = "selected";
}
if(document.getElementById('product_type').value == 8){
	if(category_2 == null) {
		return;
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
	var select_index = document.getElementById('category2').value.slice(-1) -1;
	addOption[select_index].selected = "selected";
}
if(document.getElementById('product_type').value == 9){
	if(category_2 == null) {
		return;
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
	var select_index = document.getElementById('category2').value.slice(-1) -1;
	addOption[select_index].selected = "selected";
}
if(document.getElementById('product_type').value == 10){
	if(category_2 == null) {
		return;
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
	var select_index = document.getElementById('category2').value.slice(-1) -1;
	addOption[select_index].selected = "selected";
}
	var local = document.getElementById('categoryLocal').value;
	document.getElementById('code03_idx').options[local].selected = 'selected';		
	
	var strWeight = document.getElementById('strWeight').value;
	for(var i =0; i<6; i++){
		if(document.getElementById('pd_symbol').options[i].value == strWeight){
			document.getElementById('pd_symbol').options[i].selected = 'selected';
		}
	}
	
});


var grain =  document.getElementById('grain'),
	vegetable = document.getElementById('vegetable'),
	fruit = document.getElementById('fruit'),
	liveStock = document.getElementById('liveStock'),
	aquatic = document.getElementById('aquatic'),
	processedFood = document.getElementById('processedFood'),
	kimchi = document.getElementById('kimchi'),
	jang = document.getElementById('jang'),
	health = document.getElementById('health'),
	tea = document.getElementById('tea');
var category_2 = document.getElementById("code02_idx");
var product_type = document.getElementById('product_type').value;

grain.addEventListener('click',function(){
	grain.classList.add('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
	product_type = 1;
	
	select_grain();
	
});


vegetable.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.add('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
	product_type = 2;
	
	select_vegetable();
	
});


fruit.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.add('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
	product_type = 3;
	
	select_fruit();
});



liveStock.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.add('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
	product_type = 4;
	
	select_liveStock();
	
});


aquatic.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.add('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
	product_type = 5;
	
	select_aquatic();
});


processedFood.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.add('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
	product_type = 6;
	
	select_processedFood();
});


kimchi.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.add('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
	product_type = 7;
	
	select_kimchi();
});


jang.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.add('selected');
	health.classList.remove('selected');
	tea.classList.remove('selected');
	product_type = 8;
	
	select_jang();
	
	
});

health.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.add('selected');
	tea.classList.remove('selected');
	product_type = 9;
	
	select_health();

});


tea.addEventListener('click',function(){
	grain.classList.remove('selected');
	vegetable.classList.remove('selected');
	fruit.classList.remove('selected');
	liveStock.classList.remove('selected');
	aquatic.classList.remove('selected');
	processedFood.classList.remove('selected');
	kimchi.classList.remove('selected');
	jang.classList.remove('selected');
	health.classList.remove('selected');
	tea.classList.add('selected');
	product_type = 10;
	
	select_tea();
});



function select_grain(){
	if(category_2 == null) {
		return;
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

function select_vegetable() {
	if(category_2 == null) {
		return;
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

function select_fruit(){
	if(category_2 == null) {
		return;
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

function select_liveStock(){
	if(category_2 == null) {
		return;
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

function select_auqatic(){

	if(category_2 == null) {
		return;
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

function select_processedFood(){
	if(category_2 == null) {
		return;
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


function select_kimchi(){

	if(category_2 == null) {
		return;
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


function select_jang(){
	if(category_2 == null) {
		return;
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

function select_health(){
	if(category_2 == null) {
		return;
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

function select_tea(){

	if(category_2 == null) {
		return;
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




//업로드하는 파일 확장자와 크기 체크 ==================================================
function checkExtension(file, code){
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|7z)$"); // 검사할 확장자 추가하면 됨
	var maxSize = 10000000; // 10MB 조금 안됨
	
	var getFile = document.getElementById(file.id);
	var fileSize = getFile.files[0].size; // 업로드 파일 사이즈
	var fileName = getFile.files[0].name; // 업로드 파일 이름
	
	if(fileSize >= maxSize){
		alert("파일 사이즈를 초과하셧습니다");
		getFile.value = "";
		return false;
	}
	
	if(regex.test(fileName)){
		alert("지원하지 않는 파일 형식입니다.");
		getFile.value = "";
		return false;
	}
	
	if(getTextLength(fileName) > 50){
		alert("업로드할 이미지 이름이 50자를 초과하였습니다.(한글은 2자씩 소모)");
		getFile.value = "";
		return false;
	}
	
	LoadImg(event, code);
	
	return true;
}
//업로드하는 파일 확장자와 크기 체크  end ==============================================


//글자 이미지 수 체크 (한글은 2byte) =================================================
var getTextLength = function(str) {
 var len = 0;
 for (var i = 0; i < str.length; i++) {
     if (escape(str.charAt(i)).length == 6) {
         len++;
     }
     len++;
 }
 return len;
}
//글자 이미지 수 체크 (한글은 2byte) end =============================================


//선택된 파일 이미지 보여주기 ========================================================
function LoadImg(event, code) { 
	
	var reader = new FileReader();
	reader.onload = function(event){
		
		switch(code){
		    case 1:
		    	document.getElementById('representImgLabel').style.backgroundImage = "url("+event.target.result+")";
		    	document.getElementById('representImgLabel').style.backgroundSize = "250px";
		    	document.getElementById('representImgLabel').style.backgroundPosition = "center";
		    	document.getElementById('representImgLabel').innerHTML= '';
			break;
		    case 2:
		    	document.getElementById('productImg1Label').style.backgroundImage = "url("+event.target.result+")";
		    	document.getElementById('productImg1Label').style.backgroundSize = "200px";
		    	document.getElementById('productImg1Label').style.backgroundPosition = "center";
		    	document.getElementById('productImg1Label').innerHTML= '';
		    	
			break;
		    case 3:
		    	document.getElementById('productImg2Label').style.backgroundImage = "url("+event.target.result+")";
		    	document.getElementById('productImg2Label').style.backgroundSize = "200px";
		    	document.getElementById('productImg2Label').style.backgroundPosition = "center";
		    	document.getElementById('productImg2Label').innerHTML= '';
		    	
			break;
		    case 4:
		    	document.getElementById('productImg3Label').style.backgroundImage = "url("+event.target.result+")";
		    	document.getElementById('productImg3Label').style.backgroundSize = "200px";
		    	document.getElementById('productImg3Label').style.backgroundPosition = "center";
		    	document.getElementById('productImg3Label').innerHTML= '';
		    	
			break;
		}
	}
	
	reader.readAsDataURL(event.target.files[0]);

}
//선택된 파일 이미지 보여주기 end =====================================================
function registCheck(){
	
	var title_check= document.getElementById("board_name");
	
	if(title_check.value == ""){
		title_check.focus();
		alert("제목을 입력해주십시오");
		return false;
	}
	
	
	var category2_check = document.getElementById("code02_idx");
	if(category2_check.options[category2_check.selectedIndex].value == ""){
		category2_check.focus();
		alert("카테고리를 선택해주십시오");
		return false;
	}
	
	var price_check = document.getElementById("product_amount");
	if(price_check.value == ""){
		price_check.focus();
		alert("판매가격을 입력해주십시오");
		return false;
	}
	
	var deliveryPrice_check = document.getElementById("delivery_amount");
	if(deliveryPrice_check.value == ""){
		deliveryPrice_check.focus();
		alert("배송비를 입력해주십시오");
		return false;
	}
	
	var quantity_check = document.getElementById("totalStock");
	if(quantity_check.value == ""){
		quantity_check.focus();
		alert("판매수량(재고량)을 입력해주십시오");
		return false;
	}
	
	var salesProducer_check = document.getElementById("salesProducer");
	if(salesProducer_check.value == ""){
		salesProducer_check.focus();
		alert("판매생산자를 입력해주십시오");
		return false;
	}
	
	var productName_check = document.getElementById("ProductName");
	if(productName_check.value == ""){
		productName_check.focus();
		alert("상품명을 입력해주십시오");
		return false;
	}
	
	var productWeight_check = document.getElementById("pd_unit");
	if(productWeight_check.value == ""){
		productWeight_check.focus();
		alert("중량을 입력해주십시오");
		return false;
	}
	
	var productWeight = document.getElementById("setProductWeight");
	productWeight.value = productWeight_check.value;
	var weightSymbol = document.getElementById("pd_symbol");
	productWeight.value += weightSymbol.options[weightSymbol.selectedIndex].value;
	
	var productSize_check = document.getElementById("productSize");
	if(productSize_check.value == ""){
		productSize_check.value = " - ";
	}
	
	var categoryLocal_check = document.getElementById("code03_idx");
	if(categoryLocal_check.options[categoryLocal_check.selectedIndex].value == ""){
		categoryLocal_check.focus();
		alert("원산지를 입력해주십시오");
		return false;
	}
	
	var categoryLocal2 = document.getElementById("code04_idx");
	var productCountry_check = document.getElementById("setProductCountry");
	productCountry_check.value = categoryLocal_check.options[categoryLocal_check.selectedIndex].text
	                      + " " + categoryLocal2.value;
	
	var dateManufacture_check = document.getElementById("manufacture-year");
	if(dateManufacture_check.value == ""){
		dateManufacture_check.focus();
		alert("제조년월일을 입력해주십시오");
		return false;
	}
	
	var bestBeforeDate_check = document.getElementById("expiration");
	if(bestBeforeDate_check.value == ""){
		bestBeforeDate_check.focus();
		alert("품질유지기한을 입력해주십시오");
		return false;
	}
	
	var transGenic_check = document.getElementById("transGenic");
	if(transGenic_check.value == ""){
		transGenic_check.focus();
		alert("유전자 변형 농수산물 표시를 입력해주십시오");
		return false;
	}
	
	var storageMethod_check = document.getElementById("storageMethod");
	if(storageMethod_check.value == ""){
		storageMethod_check.focus();
		alert("보관방법을 입력해주십시오");
		return false;
	}
	
	var consumerConsulation_check = document.getElementById("consumerConsulation");
	if(consumerConsulation_check.value == ""){
		consumerConsulation_check.focus();
		alert("소비자상담문의를 입력해주십시오");
		return false;
	}
	
	
	document.getElementById('product_type').value = product_type;

//		alert("제목: " + title_check.value + "\n" + 
//				"1차 카테고리: " +  + "\n" + product_type +  
//				"2차 카테고리: " + category2_check.options[category2_check.selectedIndex].value + "\n" + 
//				"원산지 지역 코드: " + categoryLocal_check.options[categoryLocal_check.selectedIndex].value + "\n" + 
//				"판매가격: " + price_check.value + "\n" + 
//				"배송비: " + deliveryPrice_check.value + "\n" + 
//				"재고량: " + quantity_check.value + "\n" + 
//				"판매생산자: " + salesProducer_check.value + "\n" + 
//				"상품명: " + productName_check.value + "\n" + 
//				"중량: " + productWeight.value + "\n" + 
//				"크기: " + productSize_check.value + "\n" + 
//				"원산지: " + productCountry_check.value + "\n" + 
//				"제조년월일: " + dateManufacture_check.value + "\n" + 
//				"품질유지기한: " + bestBeforeDate_check.value + "\n" + 
//				"유전자 변형 농수산물 표시: " + transGenic_check.value + "\n" + 
//				"보관방법: " + storageMethod_check.value + "\n" + 
//				"소비자 상담문의: " + consumerConsulation_check.value);


		return true;	

	

}
// submit check ==============================================================
