var submitBtn = document.getElementById('submitBtn');
var form = document.getElementById('form');
submitBtn.addEventListener('click',function(){
	
	
	var $nameValue = $('#userIrum').val();
	var $telValue = $('#userPhon').val();
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
	
	$.ajax({
		url: '/project/non-orderCheck.or',
		type: 'POST',
		data: {name : $nameValue,tel : $telValue},
		beforeSend: function(xhr){
			  /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			  xhr.setRequestHeader(header, token);
		  },
	  dataType: 'json',
	  contentType: 'application/x-www-form-urlencoded; charset=utf-8',
	  success: function(data){
		  if($nameValue ==''||$telValue == ''){
			  alert("이름 또는 전화번호를 입력해주세요");
		  }else if(data.result == "Fail"){
			  alert("조회된 주문건이 없습니다.")
		  }else {
			  form.submit();
		  }
		  
	  },
	  error: function(xhr,status,error){
		  console.log('error:'+error);
	  }
	});
	
	
	
	
	
});