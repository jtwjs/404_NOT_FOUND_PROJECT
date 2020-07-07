package com.spring.seller;

import java.util.Date;

public class SellerVO {     

	private String id;
	private String password;
	private String shopName;
	private String represent;
	private String telCarrierNum;
    private String telAllocationNum;
    private String telDiscretionaryNum;
	private String tel;
	private String emailId;
    private String emailAddr;
	private String email;
	private String addrNum;
    private String addrRoadName;
    private String addrDetail;
    private String address;  
	private String name;
	private String orderReportNum;
	private String orderReportImg;
	private String bankName;
	private String bankAccountNum;
	private String profileImg;
	private int sellerNum;
	private char grade;
	private char memberType;
	private char delFlag;
	private Date joinDate;
	private Date wtdrDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getRepresent() {
		return represent;
	}
	public void setRepresent(String represent) {
		this.represent = represent;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String telCarrierNum,String telAllocationNum, String telDiscretionaryNum) {
		this.tel = telCarrierNum + telAllocationNum + telDiscretionaryNum;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getEmailAddr() {
		return emailAddr;
	}
	public void setEmailAddr(String emailAddr) {
		this.emailAddr = emailAddr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String emailId, String emailAddr) {
		this.email = emailId + "@" + emailAddr;
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
		this.address = addrNum + " " + addrRoadName + " " + addrDetail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrderReportNum() {
		return orderReportNum;
	}
	public void setOrderReportNum(String orderReportNum) {
		this.orderReportNum = orderReportNum;
	}
	public String getOrderReportImg() {
		return orderReportImg;
	}
	public void setOrderReportImg(String orderReportImg) {
		this.orderReportImg = orderReportImg;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankAccountNum() {
		return bankAccountNum;
	}
	public void setBankAccountNum(String bankAccountNum) {
		this.bankAccountNum = bankAccountNum;
	}

	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public int getSellerNum() {
		return sellerNum;
	}
	public void setSellerNum(int sellerNum) {
		this.sellerNum = sellerNum;
	}
	public char getGrade() {
		return grade;
	}
	public void setGrade(char grade) {
		this.grade = grade;
	}
	public char getMemberType() {
		return memberType;
	}
	public void setMemberType(char memberType) {
		this.memberType = memberType;
	}
	public char getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(char delFlag) {
		this.delFlag = delFlag;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Date getWtdrDate() {
		return wtdrDate;
	}
	public void setWtdrDate(Date wtdrDate) {
		this.wtdrDate = wtdrDate;
	}
	
              
    
}