package com.spring.buyer;

public class deliveryVO {
	
	private int num;
	private String id; // 회원 아이디
	private String deliveryName; // 배송지명
	private String addrNum; // 우편번호
	private String addrRoadName; // 도로명주소
	private String addrDetail; // 상세주소
	private String address;
	private String defaultaddress; // 기본배송지 구분
	private String receiverName; // 수령인 이름
	private String telCarrierNum; // 첫번째 번호 3자리
	private String telAllocationNum;// 가운데 번호 4자리
	private String telDiscretionaryNum;// 끝 4자리
	private String receiverPhone;
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDeliveryName() {
		return deliveryName;
	}

	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}

	public String getAddrNum() {
		return addrNum;
	}

	public void setAddrNum(String addrNum) {
		this.addrNum = addrNum;
	}

	public String getAddrRoadName() {
		return addrRoadName;
	}

	public void setAddrRoadName(String addrRoadName) {
		this.addrRoadName = addrRoadName;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String addrNum, String addrRoadName, String addrDetail) {
		this.address = addrNum + "+" + addrRoadName + "/" + addrDetail;
	}
	
	public String getDefaultaddress() {
		return defaultaddress;
	}

	public void setDefaultaddress(String defaultaddress) {
		this.defaultaddress = defaultaddress;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}


	public String getTelCarrierNum() {
		return telCarrierNum;
	}

	public void setTelCarrierNum(String telCarrierNum) {
		this.telCarrierNum = telCarrierNum;
	}

	public String getTelAllocationNum() {
		return telAllocationNum;
	}

	public void setTelAllocationNum(String telAllocationNum) {
		this.telAllocationNum = telAllocationNum;
	}

	public String getTelDiscretionaryNum() {
		return telDiscretionaryNum;
	}

	public void setTelDiscretionaryNum(String telDiscretionaryNum) {
		this.telDiscretionaryNum = telDiscretionaryNum;
	}
	
	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String telCarrierNum, String telAllocationNum, String telDiscretionaryNum) {
		this.receiverPhone = telCarrierNum + telAllocationNum + telDiscretionaryNum;
	}





}
