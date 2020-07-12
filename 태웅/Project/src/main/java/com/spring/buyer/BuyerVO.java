package com.spring.buyer;



public class BuyerVO {         

    private String id;   
    private String password;   
    private String name;       
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
    private String profileImg;
    private String joinDate;    
    private String wthdrDate;   
    private String loginDate;
    private String memberType;  
    private int buyerNum;     
    private char grade;        
    private char delFlag;     

    private int savePoint;    
    
	
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
    public String getName() {
        return name;
    }
	public void setName(String name) {
		this.name = name;
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
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public void setAddress(String addrNum, String addrRoadName, String addrDetail) {
		this.address = addrNum + "+" + addrRoadName + "/" + addrDetail;
	}
	
	public String getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getWthdrDate() {
		return wthdrDate;
	}
	public void setWthdrDate(String wthdrDate) {
		this.wthdrDate = wthdrDate;
	}
	public int getBuyerNum() {
		return buyerNum;
	}
	public void setBuyerNum(int buyerNum) {
		this.buyerNum = buyerNum;
	}
	public char getGrade() {
		return grade;
	}
	public void setGrade(char grade) {
		this.grade = grade;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public char getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(char delFlag) {
		this.delFlag = delFlag;
	}

	
	public int getSavePoint() {
		return savePoint;
	}
	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}
	

	@Override
	public String toString() { 
		return "BuyerVO [id = " + id + ", pw = " + password + ", name = " + name
				+ ", tel = " + tel + ", email = " + email + ", addr = " + address
				+ "]";
	}
}
