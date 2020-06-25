package com.spring.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
    @RequestMapping(value = "/OrderLogin.or")
    public String orderLogin() {
    	
    	return "Order/order_login";
    }

    @RequestMapping(value = "/CartView.or")
    public String cartView() {
    	
    	return "Order/order_cart";
    }
    
    @RequestMapping(value = "/OrderSheet.or")
    public String orderSheet() {
    	
    	return "Order/order_sheet";
    }
    
    @RequestMapping(value = "/OrderComplete.or")
    public String orderComplete() {
    	
    	return "Order/order_complete";
    }
}
