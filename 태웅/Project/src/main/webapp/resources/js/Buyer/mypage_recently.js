var allCheck = document.getElementById('all-check'),
	checkBox = document.getElementsByName('ck_item'),
	checkBoxLength = document.getElementsByName('ck_item').length;

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
