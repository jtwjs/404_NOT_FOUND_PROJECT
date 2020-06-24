package com.spring.buyer;

import java.util.Date;

public class BuyerVO {         // 구매자 (일반회원)

    private String buyer_id;   // 구매자 ID (기본키)
    private String password;   // 비밀번호
    private String name;       // 이름
    private String tel;        // 연락처
    private String email;      // 이메일
    private String address;    // 주소
    private int buyer_num;     // 구매자 등록번호
    private char grade;        // 구매자 등급
    private char member_type;   // 멤버타입 (1, 구매자)
    private char del_flag;     // 탈퇴여부 (Y,N으로 구분)
    private Date join_date;    // 회원가입일
    private Date wthdr_date;   // 회원탈퇴일
    private int save_point;    // 적립금
	
    public String getBuyer_id() {
        return buyer_id;
    }
    public void setBuyer_id(String buyer_id) {
        this.buyer_id = buyer_id;
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
	public int getBuyer_num() {
		return buyer_num;
	}
	public void setBuyer_num(int buyer_num) {
		this.buyer_num = buyer_num;
	}
	public char getGrade() {
		return grade;
	}
	public void setGrade(char grade) {
		this.grade = grade;
	}
	public char getMember_type() {
		return member_type;
	}
	public void setMember_type(char member_type) {
		this.member_type = member_type;
	}
	public char getDel_flag() {
		return del_flag;
	}
	public void setDel_flag(char del_flag) {
		this.del_flag = del_flag;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public Date getWthdr_date() {
		return wthdr_date;
	}
	public void setWthdr_date(Date wthdr_date) {
		this.wthdr_date = wthdr_date;
	}
	public int getSave_point() {
		return save_point;
	}
	public void setSave_point(int save_point) {
		this.save_point = save_point;
	}
}
