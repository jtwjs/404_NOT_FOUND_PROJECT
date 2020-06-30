package com.spring.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping(value = "/LoginBuyer.ad")
    public String loginBuyer() {
    	
    	return "Admin/login_buyer";
    }
    
    @RequestMapping(value = "/LoginSeller.ad")
    public String loginSeller() {
    	
    	return "Admin/login_seller";
    }
    
    @RequestMapping(value = "/JoinSelect.ad")
    public String joinSelect() {
    	
    	return "Admin/join_select";
    }
    
    @RequestMapping(value = "/JoinBuyer.ad")
    public String joinBuyer() {
    	
    	return "Admin/join_buyer";
    }
    
    @RequestMapping(value = "/JoinBuyerComplete.ad")
    public String joinBuyerComplete() {
    	
    	return "Admin/join_buyer_complete";
    }
    
    @RequestMapping(value = "/JoinSeller.ad")
    public String joinSeller() {
    	
    	return "Admin/join_seller";
    }
    
    @RequestMapping(value = "/JoinSellerComplete.ad")
    public String joinSellerComplete() {
    	
    	return "Admin/join_seller_complete";
    }
	
}
