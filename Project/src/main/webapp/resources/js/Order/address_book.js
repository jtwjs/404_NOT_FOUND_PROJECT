var regBtn = document.getElementById('regBtn');

$('.regBtn').on('click',(e)=>{

	var addrIndex1 = e.target.value.indexOf('+');
	var addrIndex2 = e.target.value.indexOf('/');
var addrNum = e.target.value.substring(0,addrIndex1);
var addrRoadName = e.target.value.substring(addrIndex1+1,addrIndex2);
var addrDetail = e.target.value.substring(addrIndex2+1);

opener.document.getElementById('sample4_postcode').value = addrNum;
opener.document.getElementById('sample4_roadAddress').value = addrRoadName;
opener.document.getElementById('sample4_detailAddress').value = addrDetail;

	self.close();
})

