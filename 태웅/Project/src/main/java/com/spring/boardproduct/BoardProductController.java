package com.spring.boardproduct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardProductController {

    @RequestMapping(value = "/BoardProductList.bo") // 판매글 리스트
	public String boardProductList() {
		
		return "BoardProduct/boardProductList";
	}
	
	@RequestMapping(value = "/BoardProductView.bo") // 판매글 보기
	public String boardProductView() {
		
		return "BoardProduct/boardProductView";
	}
	
	@RequestMapping(value = "/BoardLocalIntroduce.bo") // 지역특산물
	public String boardLocalIntroduce() {
		
		return "BoardProduct/localIntroduce";
	}
}
