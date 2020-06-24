package com.spring.seller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerController {

	@RequestMapping( value="seller_myPage.ad")
	public String seller_myPage() {
		return "Seller/mypage_main";
		
	}

}
