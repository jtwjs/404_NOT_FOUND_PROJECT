var allCheck = document.getElementById('all-check'),
	checkBox = document.getElementsByName('ck_item'),
	checkBoxLength = document.getElementsByName('ck_item').length
	deleteBtn = document.getElementById('view-delete'),
	wishBtn = document.getElementById('view-wish'),
	form = document.getElementById('recentView_form'),
	separation = document.getElementById('separation');

for(var i = 0; i < checkBoxLength; i++){
	checkBox[i].addEventListener('click',function(){
		if(this.checked == false && allcheck.checked == true){
			allCheck.checked = false;
			return;
		}
	});
}

allCheck.addEventListener('click',function(){
	if(allCheck.checked){
		check_all();
	}else {
		uncheck_all();
	} 
})

function check_all() {
	for(var i = 0; i < checkBoxLength; i++){
		checkBox[i].checked = true;
	}
}

function uncheck_all() {
	for(var i = 0; i < checkBoxLength; i++) {
		checkBox[i].checked = false;
	}
}

deleteBtn.addEventListener('click',function() {
	separation.value = '삭제';
	form.submit();
	
});

wishBtn.addEventListener('click',function() {
	separation.value = '관심';
	form.submit();
});