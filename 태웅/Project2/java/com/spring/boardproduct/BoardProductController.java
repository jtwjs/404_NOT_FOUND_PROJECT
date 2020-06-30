package com.spring.boardproduct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardProductController {

    @RequestMapping(value = "/BoardProductList.bo")
	public String boardProductList() {
		
		return "BoardProduct/boardProductList";
	}
	
	@RequestMapping(value = "/BoardProductView.bo")
	public String boardProductView() {
		
		return "BoardProduct/boardProductView";
	}
}
