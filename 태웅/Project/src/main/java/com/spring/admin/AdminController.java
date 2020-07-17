package com.spring.admin;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.buyer.BuyerVO;
import com.spring.seller.SellerVO;

@Controller
public class AdminController {

	@Autowired 
	AdminServiceImpl service;
	
    @RequestMapping(value = "/Login.ad")  
    public String login() throws Exception {
    	
    	return "Admin/login_buyer";
    }
    
    
    @RequestMapping(value = "/logout.ad")
    public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	if (auth != null) {
    		new SecurityContextLogoutHandler().logout(request, response, auth);
    	}
    	return "redirect:/";
    }
    
    @RequestMapping(value = "/LoginBuyer.ad")
    public String loginBuyer() throws Exception {
    	
    	return "Admin/login_buyer";
    }
    
    @RequestMapping(value = "/LoginSeller.ad")  // �뙋留ㅼ옄 濡쒓렇�씤
    public String loginSeller() throws Exception{
    	
    	return "Admin/login_seller";
    }
    
    @RequestMapping(value = "/JoinSelect.ad")  // �쉶�썝媛��엯 �쑀�삎 �꽑�깮
    public String joinSelect() {
    	
    	return "Admin/join_select";
    }
    
    @RequestMapping(value = "/JoinBuyer.ad")  // 援щℓ�옄 �쉶�썝媛��엯
    public String joinBuyer(BuyerVO buyer) {
    	
    	
    	return "Admin/join_buyer";
    }
    
    @RequestMapping(value = "/JoinBuyerComplete.ad")  // 援щℓ�옄 �쉶�썝媛��엯 �셿猷�
    public String joinBuyerComplete() {
    	
    	return "Admin/join_buyer_complete";
    }
    
    @RequestMapping(value = "/JoinSeller.ad")  // �뙋留ㅼ옄 �쉶�썝媛��엯
    public String joinSeller(SellerVO seller) {

    	
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
    
    
    @RequestMapping(value = "/duplicationCheck.ad",
    		method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public HashMap<String, Object> idDuplicationCheck(AccountVO account) {
    	HashMap<String, Object> result = new HashMap<String, Object>();
    	String id = account.getId();
		boolean isDuplication = service.duplicateCheck(id);
			System.out.println("중복체크결과: "+isDuplication);
		if( isDuplication ) {
			result.put("result", "Fail");
		}else {
			result.put("result", "OK");
		}
		System.out.println("result값=" + result.get("result"));
		return result;
    	
    }
    
    
    
}
