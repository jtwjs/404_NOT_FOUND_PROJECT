

function searchCheck(){
	
	var date_check = document.getElementById("content__search-box--date").value;
	
	if(date_check == ""){
		alert("검색할 날짜를 선택해주십시오");
		return false;
	}
	
	var local_check = document.getElementById("select__search-box--local");
	
	if(local_check.options[local_check.selectedIndex].value == "1"){
		alert("검색할 지역을 선택해주십시오");
		return false;
	}
	
	document.getElementById("content__search-box--local").value = 
		local_check.options[local_check.selectedIndex].value;
	
	var classification_check = document.getElementById("select__search-box--classification");
	
	if(classification_check.options[classification_check.selectedIndex].value == "1"){
		alert("검색할 품목을 선택해주십시오");
		return false;
	}
	
	document.getElementById("content__search-box--classification").value = 
		classification_check.options[classification_check.selectedIndex].value;
	
	return true;
}