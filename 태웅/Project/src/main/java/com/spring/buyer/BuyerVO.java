package com.spring.buyer;

import java.util.Date;

public class BuyerVO {         

    private String id;   
    private String password;   
    private String name;       
    private String tel;        
    private String email;      
    private String address;    
    private int buyerNum;     
    private char grade;        
    private char memberType;  
    private char delFlag;     
    private Date joinDate;    
    private Date wthdrDate;   
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public Date getWthdrDate() {
		return wthdrDate;
	}
	public void setWthdrDate(Date wthdrDate) {
		this.wthdrDate = wthdrDate;
	}
	public int getSavePoint() {
		return savePoint;
	}
	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}
}
