$(function() {	
		$('#startDate').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '-5y',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+0d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
//		    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
//		    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
//		    title: "테스트",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		    
		});//datepicker end
	});//ready end	

$(function() {	
	$('#endDate').datepicker({
	    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	    startDate: '-5y',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
	    endDate: '+0d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
	    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
	    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
	    datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
//	    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
//	    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
	    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
	    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
	    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
	    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
	    templates : {
	        leftArrow: '&laquo;',
	        rightArrow: '&raquo;'
	    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
	    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
//	    title: "테스트",	//캘린더 상단에 보여주는 타이틀
	    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
	    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
	    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
	    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	    
	});//datepicker end
});//ready end	



$(document).ready(function(){

var startCalenderImg = document.getElementById('start_calender');
var endCalenderImg = document.getElementById('end_calender');
var startCalenderInput = document.getElementById('startDate');
var endCalenderInput = document.getElementById('endDate');
var date = new Date(); 
var year = date.getFullYear(); 
var month = new String(date.getMonth()+1); 
var day = new String(date.getDate()); 

// 한자리수일 경우 0을 채워준다. 
if(month.length == 1){ 
  month = "0" + month; 
} 
if(day.length == 1){ 
  day = "0" + day; 
} 

var today = (year + "-" + month + "-" + day);

startCalenderImg.addEventListener('click',function(){
	startCalenderInput.focus();
	
});


endCalenderImg.addEventListener('click',function(){
	endCalenderInput.focus();
	
});


$("#startDate").on("change", function(){
	if(startCalenderInput.value > endCalenderInput.value && endCalenderInput.value != ''){
		endCalenderInput.value = startCalenderInput.value;
		}
	startDateValue = startCalenderInput.value;
});

$("#endDate").on("change", function(){
	if(startCalenderInput.value == ''){
		startCalenderInput.value = endCalenderInput.value;
	}
	endDateValue = endCalenderInput.value;
	
});



document.getElementById('1week').addEventListener('click',function(){
	var date = new Date();
	var dayofMonth = date.getDate();
	date.setDate(dayofMonth -7)
	
	var beforeDate = date.getDate();
	var beforeMonth = date.getMonth()+1;
	
	if(beforeDate <10){ 
		  beforeDate = "0" + beforeDate; 
		} 
	
	
	if(beforeMonth < 10 ){
		beforeMonth = "0" + beforeMonth;
	}
	var ago = (year + "-" + beforeMonth + "-" + beforeDate);

	startCalenderInput.value = ago;
	endCalenderInput.value = today; 
});

document.getElementById('1month').addEventListener('click',function(){
	var beforeMonth = new String(date.getMonth()); 
	if(beforeMonth.length == 1){ 
		beforeMonth = "0" + beforeMonth; 
		} 
		
	var ago = (year + "-" + beforeMonth + "-" + day);
	
	startCalenderInput.value = ago;
	endCalenderInput.value = today;
});

document.getElementById('3month').addEventListener('click',function() {
	var beforeMonth = new String(date.getMonth()-2);
	if(beforeMonth.length == 1){ 
		beforeMonth = "0" + beforeMonth; 
		} 
		
	var ago = (year + "-" + beforeMonth + "-" + day);
	startCalenderInput.value = ago;
	endCalenderInput.value = today;
});

document.getElementById('all_date').addEventListener('click',function(){
	startCalenderInput.value = '';
	endCalenderInput.value = '';
});

document.getElementById('all_date').addEventListener('click',function(){
	startCalenderInput.value = '';
	endCalenderInput.value = '';
});

document.getElementById('1week_label').addEventListener('click',function(){
	(this).classList.add('checked');
	document.getElementById('1month_label').classList.remove('checked');
	document.getElementById('3month_label').classList.remove('checked');
	document.getElementById('all_label').classList.remove('checked');
	
});

document.getElementById('1month_label').addEventListener('click',function(){
	(this).classList.add('checked');
	document.getElementById('1week_label').classList.remove('checked');
	document.getElementById('3month_label').classList.remove('checked');
	document.getElementById('all_label').classList.remove('checked');
	
});

document.getElementById('3month_label').addEventListener('click',function(){
	(this).classList.add('checked');
	document.getElementById('1month_label').classList.remove('checked');
	document.getElementById('1week_label').classList.remove('checked');
	document.getElementById('all_label').classList.remove('checked');
	
});

document.getElementById('all_label').addEventListener('click',function(){
	(this).classList.add('checked');
	document.getElementById('1month_label').classList.remove('checked');
	document.getElementById('3month_label').classList.remove('checked');
	document.getElementById('1week_label').classList.remove('checked');
	
});


var str = document.location.href;
var index = str.indexOf('.by');
var href = str.substring(0,index+3);
dateSubmit.addEventListener('click',function(){
	location.href= href+'?startDate='+startCalenderInput.value+'&endDate='+endCalenderInput.value+'&page=0&perPageNum=10';
});



});


