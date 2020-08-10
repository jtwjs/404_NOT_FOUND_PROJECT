package com.spring.home;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.boardproduct.BoardProductService;
import com.spring.boardproduct.BoardProductVO;

@Controller
public class HomeController {
	
	@Autowired
	private BoardProductService boardProductService;
	
	@RequestMapping(value = "/")
    public String home(Model model) {

        return "redirect:/Index.in";
    }
	
	@RequestMapping(value = "/Index.in")
    public String index(Model model) {
		
        ArrayList<BoardProductVO> vo_list = boardProductService.getBestBoardProductList();
        String indexRedirect = "1";
        
        
		model.addAttribute("vo_list", vo_list);
		model.addAttribute("indexRedirect", indexRedirect);
		
        return "index";
    }
	
}