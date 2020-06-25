package com.spring.seller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerController {

	@RequestMapping(value = "/SellerMyPage.se")
	public String sellerMyPage() {
		
		return "Seller/mypage_main";
	}
	
}
