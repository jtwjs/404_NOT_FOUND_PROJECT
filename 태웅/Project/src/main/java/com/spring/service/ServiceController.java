package com.spring.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ServiceController {

	@Autowired
	private ServiceService serviceService;

	
	


	
	@RequestMapping(value = "/BoardNotice.sc")
	public String getBoardNoticelist(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		int limit = 10;

		int listcount = serviceService.getBoardNoticeListCount();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<BoardNoticeVO> noticelist = serviceService.getBoardNoticeList(hashmap);

//총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림 처리
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		return "ServiceCenter/board_notice";
	}
	
	@RequestMapping(value = "/BoardNoticeWriteForm.sc") 
	public String boardnoticeInsertForm() {
		
		return "ServiceCenter/board_notice_write";
	}
	
	@RequestMapping("/BoardNoticeWrite.sc") 
	public String boardnoticeInsert(BoardNoticeVO vo) throws Exception {
		int res = serviceService.boardnoticeInsert(vo);
		
		return "redirect:/BoardNotice.sc";
	}

	
	@RequestMapping("/boardnoticedetail.sc")
	public String getBoardNoticeDetail(@RequestParam(value="num", required=true) int num, Model model) {
		BoardNoticeVO vo = serviceService.getBoardNoticeDetail(num);
		
		model.addAttribute("vo", vo);
		
		return "ServiceCenter/board_notice_view";
		
	}
	  
	 @RequestMapping( value = "/Boardnoticemodifyform.sc") public String
	  getBoardNoticeModifyForm(@RequestParam(value="num", required=true) int num,
	  Model model) { BoardNoticeVO vo =
			  serviceService.getBoardNoticeDetail(num);
	  
	  model.addAttribute("vo", vo);
	  
	  return "ServiceCenter/board_notice_modify";
	  
	  }
	  

	  
	 @RequestMapping(value = "/Boardnoticemodify.sc")
	 public String boardnoticeModify(BoardNoticeVO vo) { 
		 int res = serviceService.boardnoticeModify(vo);
	  
	  return "redirect:/boardnoticedetail.sc?num=" + vo.getNum(); 
	  
	  }
	 
		@RequestMapping("/BoardNoticeDelete.sc")
		public String BoardNoticeDelete(@RequestParam(value = "num", required = true) int num, HttpSession session,
				HttpServletResponse response) throws Exception {

			HashMap<String, String> hashmap = new HashMap<String, String>();
			hashmap.put("num", Integer.toString(num));
			int res = serviceService.boardnoticeDelete(hashmap);
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			if (res == 1) {
				writer.write("<script>alert('삭제 성공!!');" + "location.href='./BoardNotice.sc';</script>");
			} else {
				writer.write("<script>alert('삭제 실패!!');" + "location.href='./BoardNotice.sc';</script>");
			}
			return null;
		}
	
	
	
	
	
	

	@RequestMapping(value = "/BoardFaq.sc")
	public String getFaqBoardList(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		int limit = 10;

		int listcount = serviceService.getFaqListCount();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<BoardFaqVO> faqboardlist = serviceService.getFaqBoardList(hashmap);

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림 처리
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1) endpage = startpage + 10 - 1;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("faqboardlist", faqboardlist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		return "ServiceCenter/board_faq";
	}

	@RequestMapping("/FaqBoardWriteForm.sc")
	public String faqBoardInsertForm() {

		return "ServiceCenter/board_faq_write";
	}

	@RequestMapping("/FaqBoardWrite.sc")
	public String faqBoardInsert(BoardFaqVO vo) throws Exception {
		int res = serviceService.faqBoardInsert(vo);

		return "redirect:/BoardFaq.sc";
	}

	@RequestMapping("/FaqBoardDelete.sc")
	public String faqBoardDelete(@RequestParam(value = "num", required = true) int num, HttpSession session,
			HttpServletResponse response) throws Exception {

		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("num", Integer.toString(num));
		int res = serviceService.faqBoardDelete(hashmap);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res == 1) {
			writer.write("<script>alert('삭제 성공!!');" + "location.href='./BoardFaq.sc';</script>");
		} else {
			writer.write("<script>alert('삭제 실패!!');" + "location.href='./BoardFaq.sc';</script>");
		}
		return null;
	}
	
	@RequestMapping("/FaqBoardDetail.sc")
	public String getFaqDetail(@RequestParam(value="num", required=true) int num, Model model) {
		System.out.println("33num=" + num);
		BoardFaqVO vo = serviceService.getFaqDetail(num);
		System.out.println("33vo.getNum()=" + vo.getNum());
		model.addAttribute("vo", vo);
		
		return "redirect:/BoardFaq.sc";
	}
	
	@RequestMapping("/FaqBoardModifyform.sc") 
	public String faqBoardModifyForm(@RequestParam(value="num", required=true) int num, Model model) {
		BoardFaqVO vo = serviceService.getFaqDetail(num);
		
		model.addAttribute("vo", vo);
		
		return "ServiceCenter/board_faq_modify";
	}

	@RequestMapping("/FaqBoardModify.sc") 
	public String faqBoardModify(@RequestParam(value="num", required=true) int num, BoardFaqVO vo) {
		System.out.println("num=" + num);
		System.out.println("11vo.getNum()=" + vo.getNum());
		vo.setNum(num);
		System.out.println("22vo.getNum()=" + vo.getNum());
		int res = serviceService.faqBoardModify(vo);
		
		return "redirect:/FaqBoardDetail.sc?num=" + vo.getNum();
	} 

}
