package com.spring.admin;

public class AdminVO {        // 관리자

    private String id;  // 관리자 ID (기본키)
    private String password;  // 비밀번호
    private String name;      // 이름
    private String memberType;  // 멤버타입 (3, 관리자)
    private int adminNum;    // 관리자 번호
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
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public int getAdminNum() {
		return adminNum;
	}
	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
	}
    
	

}
