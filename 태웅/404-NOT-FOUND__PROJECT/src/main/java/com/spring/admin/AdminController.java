package com.spring.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping(value = "/JoinMain.ad")
	public String JoinMainPage() {
		return "Join/join_main";
	}
	
	@RequestMapping(value = "/loginBuyer.ad")
	public String loginBuyerPage() {
		return "admin/login_buyer";
	}
}
