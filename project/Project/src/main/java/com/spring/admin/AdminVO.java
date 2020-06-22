package com.spring.admin;

public class AdminVO {        // 관리자

    private String admin_id;  // 관리자 ID (기본키)
    private String password;  // 비밀번호
    private String name;      // 이름
    private int admin_num;    // 관리자 번호
    private char member_type;  // 멤버타입 (3, 관리자)
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
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
	public int getAdmin_num() {
		return admin_num;
	}
	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}
	public char getMember_type() {
		return member_type;
	}
	public void setMember_type(char member_type) {
		this.member_type = member_type;
	}
}
