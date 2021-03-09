function setWindow(){
	window.scrollTo(0, 380);
	setChart();
}

function setChart(){
	
	$.ajax({
	    type: 'GET',
	    url: "JoinChartData.ad",
	    contentType: 'application/json; charset=UTF-8',
	    cache: false,
	    success: function(data){
	    	
	    	var obj;
	    	
	    	if(IsJsonString(data) == true){
	    		obj = JSON.parse(data);
	    	}
	    	
	    	var join_3monthAgo = Number(obj.join_3monthAgo);
	    	var join_1monthAgo = Number(obj.join_1monthAgo);
	    	var join_7daysAgo = Number(obj.join_7daysAgo);
	    	var join_3daysAgo = Number(obj.join_3daysAgo);
	    	var join_yesterday = Number(obj.join_yesterday);
	    	
	    	joinChart(join_3monthAgo, join_1monthAgo, join_7daysAgo, 
	    			join_3daysAgo, join_yesterday);
	    	
	    },
	    error: function(){
	    	
	    }
	});
	
	
	$.ajax({
	    type: 'GET',
	    url: "RegistChartData.bo",
	    contentType: 'application/json; charset=UTF-8',
	    cache: false,
	    success: function(data){
	    	
	    	var obj;
	    	
	    	if(IsJsonString(data) == true){
	    		obj = JSON.parse(data);
	    	}
	    	
	    	var regist_3monthAgo = Number(obj.regist_3monthAgo);
	    	var regist_1monthAgo = Number(obj.regist_1monthAgo);
	    	var regist_7daysAgo = Number(obj.regist_7daysAgo);
	    	var regist_3daysAgo = Number(obj.regist_3daysAgo);
	    	var regist_yesterday = Number(obj.regist_yesterday);
	    	
	    	registChart(regist_3monthAgo, regist_1monthAgo, regist_7daysAgo, 
	    			regist_3daysAgo, regist_yesterday);
	    	
	    },
	    error: function(){
	    	
	    }
	});

	
	
	$.ajax({
	    type: 'GET',
	    url: "MemberChartData.or",
	    contentType: 'application/json; charset=UTF-8',
	    cache: false,
	    success: function(data){
	    	
	    	var obj;
	    	
	    	if(IsJsonString(data) == true){
	    		obj = JSON.parse(data);
	    	}
	    	
	    	var member = Number(obj.member);
	    	var nonMember = Number(obj.nonMember);
	    	
	    	memberChart(member, nonMember);
	    	
	    },
	    error: function(){
	    	
	    }
	});
   
}

function joinChart(join_3monthAgo, join_1monthAgo, join_7daysAgo, 
		join_3daysAgo, join_yesterday){
	
    var joinData = document.getElementById("join-data__chart");
	
	var joinChart = new Chart(joinData, {
		type: 'line',
		data: {
			labels: ['3개월 전', '1개월 전', '일주일 전', '3일 전', '하루 전'],
			datasets: [{
				label: '가입자 수',
				data: [join_3monthAgo, join_1monthAgo, join_7daysAgo, 
					join_3daysAgo, join_yesterday],
				backgroundColor: [
					'rgba(0, 0, 0, 0.5)',
					'rgba(0, 0, 0, 0.5)',
					'rgba(0, 0, 0, 0.5)',
					'rgba(0, 0, 0, 0.5)',
					'rgba(0, 0, 0, 0.5)'
				],
				borderColor: [
					'rgba(0, 0, 0, 0.5)',
					'rgba(0, 0, 0, 0.5)',
					'rgba(0, 0, 0, 0.5)',
					'rgba(0, 0, 0, 0.5)',
					'rgba(0, 0, 0, 0.5)'
				],
				borderWidth: 1,
				fill:false
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
	
}

function registChart(regist_3monthAgo, regist_1monthAgo, regist_7daysAgo, 
		regist_3daysAgo, regist_yesterday){
	
var registData = document.getElementById("regist-data__chart");
	
	var registChart = new Chart(registData, {
		type: 'line',
		data: {
			labels: ['3개월 전', '1개월 전', '일주일 전', '3일 전', '하루 전'],
			datasets: [{
				label: '판매글 등록수',
				data: [regist_3monthAgo, regist_1monthAgo, regist_7daysAgo, 
					regist_3daysAgo, regist_yesterday],
				borderColor: [
					'rgba(0, 0, 0, 0.5)',
					'rgba(0, 0, 0, 0.5)',
					'rgba(0, 0, 0, 0.5)',
					'rgba(0, 0, 0, 0.5)',
					'rgba(0, 0, 0, 0.5)'
				],
				borderWidth: 1,
				fill:false
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
}

function memberChart(member, nonMember){
	
	var memberData = document.getElementById("member-data__chart");
		
    var memberChart = new Chart(memberData, {
			type: 'pie',
			data: {
				labels: ['회원', '비회원'],
				datasets: [{
					label: '이용 회원',
					data: [member, nonMember],
					backgroundColor: [
						'#FFCE56',
						'#D2D2D2'
					],
					hoverColor: [
						'rgba(0, 0, 0, 0.8)',
						'rgba(0, 0, 0, 0.8)'
					],
				}]
			},
			options: {
				responsive: false
			}
		});
}

function IsJsonString(str) {
	
    try {
        var json = JSON.parse(str);
        return (typeof json === 'object');
    } catch (e) {
        return false;
    }
}