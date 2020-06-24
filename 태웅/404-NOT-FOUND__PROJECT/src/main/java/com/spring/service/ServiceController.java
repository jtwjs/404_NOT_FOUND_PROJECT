package com.spring.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ServiceController {
    
    @RequestMapping(value ="/BoardNotice.sc")
	public String boardNotice() {
		
		return "ServiceCenter/board_notice";
	}
	
	@RequestMapping(value ="/BoardFaq.sc")
	public String boardFaq() {
		
		return "ServiceCenter/board_faq";
	}
	
	@RequestMapping(value ="/BoardQna.sc")
	public String boardQna() {
		
		return "ServiceCenter/board_qna";
	}
}
