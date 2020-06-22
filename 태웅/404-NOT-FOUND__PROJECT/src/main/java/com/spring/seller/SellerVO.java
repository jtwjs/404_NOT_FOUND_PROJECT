package com.spring.seller;

import java.util.Date;

public class SellerVO {              // 판매자 (개인사업자)
	
    private String seller_id;        // 판매자 ID (기본키)
    private String password;         // 비밀번호
    private String license;          // 사업자등록번호
    private String shop_name;        // 상호명
    private String representative;   // 대표자
    private String manager_phone;    // 담당자 연락처
    private String manager_email;    // 담당자 이메일
    private String manager_name;     // 담당자 이름
    private String corp_reg_num;     // 법인등록번호
    private String sales_ref_num;    // 통신판매신고번호
    private String method_payment;   // 정산대금수령방법
    private String bank_account;     // 정산대금입금계좌
    private int seller_reg_num;      // 판매자 등록번호
    private char seller_grade;       // 판매자 등급
    private char member_type;         // 멤버타입 (2, 판매자)
    private char del_flag;           // 탈퇴여부 (Y,N으로 구분)
    private Date join_date;          // 회원가입일
    private Date wdf_date;           // 회원탈퇴일
    
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getRepresentative() {
		return representative;
	}
	public void setRepresentative(String representative) {
		this.representative = representative;
	}
	public String getManager_phone() {
		return manager_phone;
	}
	public void setManager_phone(String manager_phone) {
		this.manager_phone = manager_phone;
	}
	public String getManager_email() {
		return manager_email;
	}
	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getCorp_reg_num() {
		return corp_reg_num;
	}
	public void setCorp_reg_num(String corp_reg_num) {
		this.corp_reg_num = corp_reg_num;
	}
	public String getSales_ref_num() {
		return sales_ref_num;
	}
	public void setSales_ref_num(String sales_ref_num) {
		this.sales_ref_num = sales_ref_num;
	}
	public String getMethod_payment() {
		return method_payment;
	}
	public void setMethod_payment(String method_payment) {
		this.method_payment = method_payment;
	}
	public String getBank_account() {
		return bank_account;
	}
	public void setBank_account(String bank_account) {
		this.bank_account = bank_account;
	}
	public int getSeller_reg_num() {
		return seller_reg_num;
	}
	public void setSeller_reg_num(int seller_reg_num) {
		this.seller_reg_num = seller_reg_num;
	}
	public char getSeller_grade() {
		return seller_grade;
	}
	public void setSeller_grade(char seller_grade) {
		this.seller_grade = seller_grade;
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
	public Date getWdf_date() {
		return wdf_date;
	}
	public void setWdf_date(Date wdf_date) {
		this.wdf_date = wdf_date;
	}
    
    
}
