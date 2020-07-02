package com.spring.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping(value = "/LoginBuyer.ad")  // 援щℓ�옄 濡쒓렇�씤
    public String loginBuyer() {
    	
    	return "Admin/login_buyer";
    }
    
    @RequestMapping(value = "/LoginSeller.ad")  // �뙋留ㅼ옄 濡쒓렇�씤
    public String loginSeller() {
    	
    	return "Admin/login_seller";
    }
    
    @RequestMapping(value = "/JoinSelect.ad")  // �쉶�썝媛��엯 �쑀�삎 �꽑�깮
    public String joinSelect() {
    	
    	return "Admin/join_select";
    }
    
    @RequestMapping(value = "/JoinBuyer.ad")  // 援щℓ�옄 �쉶�썝媛��엯
    public String joinBuyer() {
    	
    	return "Admin/join_buyer";
    }
    
    @RequestMapping(value = "/JoinBuyerComplete.ad")  // 援щℓ�옄 �쉶�썝媛��엯 �셿猷�
    public String joinBuyerComplete() {
    	
    	return "Admin/join_buyer_complete";
    }
    
    @RequestMapping(value = "/JoinSeller.ad")  // �뙋留ㅼ옄 �쉶�썝媛��엯
    public String joinSeller() {
    	
    	return "Admin/join_seller";
    }
    
    @RequestMapping(value = "/JoinSellerComplete.ad")  // �뙋留ㅼ옄 �쉶�썝媛��엯 �셿猷�
    public String joinSellerComplete() {
    	
    	return "Admin/join_seller_complete";
    }
	
    @RequestMapping(value = "/termsUse.ad")
    public String termsUse() {
    	
    	return "Admin/terms_use";
    }
    
    @RequestMapping(value = "/privacyPolicy.ad")
    public String privacyPolicy() {
    	
    	return "Admin/privacy_policy";
    }
    
}
