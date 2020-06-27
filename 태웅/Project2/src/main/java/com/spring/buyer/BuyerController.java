package com.spring.buyer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BuyerController {
	
    @RequestMapping(value = "/BuyerMyPage.by")
    public String buyerMyPage() {
    	
    	return "Buyer/mypage_main";
    }
    
    @RequestMapping(value = "/BuyerMyPageOrderCheck.by")
    public String buyerMyPageOrderCheck() {
    	
    	return "Buyer/mypage_orderCheck";
    }
    
    @RequestMapping(value = "/BuyerMyPageCancleList.by")
    public String buyerMyPageCancleList() {
    	
    	return "Buyer/mypage_cancleList";
    }
    
    @RequestMapping(value = "/BuyerMyPageInfoModify.by")
    public String buyerMyPageInfoModify() {
    	
    	return "Buyer/mypage_infoModify";
    }

}
