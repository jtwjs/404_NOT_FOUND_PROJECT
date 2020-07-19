function pageViewOption(url, category, category_code, sort_list, pageNum, val){
    var viewOption = document.getElementById("qty_view");
    
    
    location.href= url + "?" + category + "=" + category_code + "&sort_list=" + sort_list +"&page_num=" + pageNum + "&page_amount=" + val;
}

function setStyle(amount, sort_list, category){
	
	var categoryCode = "";
	
	if(category.length == 3){
		categoryCode = document.getElementById("category-2--" + String(category));
	}else{
		categoryCode = document.getElementById("category-local--" + String(category));
	}
	
//	categoryCode.style.color = "#0bbf0b";
	/*categoryCode.style.fontSize = "17px";
	categoryCode.style.fontWeight = "bold";*/
	
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
//	nowPage.style.color = "#0bbf0b";
}