


var qna_title = document.querySelectorAll('.qna');
var qna_desc = document.querySelectorAll('.qna_desc');
var qna_answer = document.querySelectorAll('.qna_answer');



function active(thisTd, i){
	var answer = thisTd.parentNode.parentNode.getElementsByClassName("index-" + i)[0];
	var desc = thisTd.parentNode.parentNode.getElementsByClassName("qna_desc")[i];
	
	if(desc.style.display == 'table-row') {
		desc.style.display = 'none';
		answer.style.display = 'none';
	}else {
		desc.style.display = 'table-row';
		answer.style.display = "table-row";
	}
}