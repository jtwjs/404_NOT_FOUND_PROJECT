function pageViewOption(url, sort_list, pageNum, val){
    var viewOption = document.getElementById("qty_view");
    
    
    location.href= url + "?" + "&sort_list=" + sort_list +"&page_num=" + pageNum + "&page_amount=" + val;
}

function setStyle(amount, sort_list){
	
	var categoryCode = "";
	
	var sortList1 = document.getElementById("sort-list--" + sort_list);
	
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