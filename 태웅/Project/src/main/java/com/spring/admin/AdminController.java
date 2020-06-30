package com.spring.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping(value = "/LoginBuyer.ad")  // 구매자 로그인
    public String loginBuyer() {
    	
    	return "Admin/login_buyer";
    }
    
    @RequestMapping(value = "/LoginSeller.ad")  // 판매자 로그인
    public String loginSeller() {
    	
    	return "Admin/login_seller";
    }
    
    @RequestMapping(value = "/JoinSelect.ad")  // 회원가입 유형 선택
    public String joinSelect() {
    	
    	return "Admin/join_select";
    }
    
    @RequestMapping(value = "/JoinBuyer.ad")  // 구매자 회원가입
    public String joinBuyer() {
    	
    	return "Admin/join_buyer";
    }
    
    @RequestMapping(value = "/JoinBuyerComplete.ad")  // 구매자 회원가입 완료
    public String joinBuyerComplete() {
    	
    	return "Admin/join_buyer_complete";
    }
    
    @RequestMapping(value = "/JoinSeller.ad")  // 판매자 회원가입
    public String joinSeller() {
    	
    	return "Admin/join_seller";
    }
    
    @RequestMapping(value = "/JoinSellerComplete.ad")  // 판매자 회원가입 완료
    public String joinSellerComplete() {
    	
    	return "Admin/join_seller_complete";
    }
	
}
