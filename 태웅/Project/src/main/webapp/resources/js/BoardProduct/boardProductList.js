function pageViewOption(url, category, category_code, sort_list, pageNum, val){
    var viewOption = document.getElementById("qty_view");
    for(var i = 0 ; i < viewOption.length; i++){
        if(viewOption.options[i].value == val){
        	viewOption.options[i].selected = true;
        	break;
        }
    }

    
   location.href= url + "?" + category + "=" + category_code + "&sort_list=" + sort_list +"&page_num=" + pageNum + "&page_amount=" + val;
}