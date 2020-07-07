package com.spring.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
    @RequestMapping(value = "/OrderLogin.or")  // 주문배송 로그인 (회원)
    public String orderLogin() {
    	
    	return "Order/order_login";
    }
    
    @RequestMapping(value = "/OrderNonMember.or")  // 주문배송 로그인 (비회원)
    public String orderNonMember() {
    	
    	return "Order/order_nonMember";
    }
    
    @RequestMapping(value = "/OrderCheck.or")  // 주문내역
    public String orderCheck() {
    	
    	return "Order/order_check";
    }

    @RequestMapping(value = "/CartView.or")  // 장바구니
    public String cartView() {
    	
    	return "Order/order_cart";
    }
    
    @RequestMapping(value = "/OrderSheet.or")  // 주문서
    public String orderSheet() {
    	
    	return "Order/order_sheet";
    }
    
    @RequestMapping(value = "/OrderComplete.or")  // 주문완료
    public String orderComplete() {
    	
    	return "Order/order_complete";
    }
}
