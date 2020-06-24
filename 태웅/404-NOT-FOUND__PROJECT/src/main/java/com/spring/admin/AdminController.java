package com.spring.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping(value = "/JoinMain.ad")
	public String JoinMainPage() {
		return "Join/join_main";
	}
	
	@RequestMapping(value = "/loginPage.ad")
	public String loginBuyerPage() {
		return "Admin/login_page_customer";
	}
}
