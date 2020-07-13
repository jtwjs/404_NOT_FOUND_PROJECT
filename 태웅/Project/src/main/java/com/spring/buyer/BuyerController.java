package com.spring.buyer;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.config.Security.CurrentUser;
import com.spring.config.Security.CustomDetailService;

@Controller
public class BuyerController {
	
	@Autowired
	BuyerService buyerService;
	
	@Autowired
	CustomDetailService SecurityService;
	
    @RequestMapping(value = "/BuyerMyPage.by")  
    public String buyerMyPage(Model model, @CurrentUser BuyerVO account) {
  
    	model.addAttribute("name", account.getName());
    	model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
    	model.addAttribute("grade", account.getGrade());
    	model.addAttribute("savePoint", account.getSavePoint());
    	model.addAttribute("joinDate", account.getJoinDate().substring(0,10));
    	return "Buyer/mypage_main";
    }
    
    @RequestMapping(value = "/BuyerMyPageInfoModify.by")  // �봽濡쒗븘 - �닔�젙�븯湲�
    public String buyerMyPageInfoModify(Model model, @CurrentUser BuyerVO account) {
    	model.addAttribute("name",account.getName());
    	model.addAttribute("loginDate",account.getLoginDate().substring(0,10));
    	return "Buyer/mypage_infoModify";
    }
    
    @RequestMapping(value = "/BuyerMyPageDeliveryManager.by")  // �봽濡쒗븘 - 諛곗넚吏� 愿�由�
    public String buyerMyPageDeliveryManager(Model model, @CurrentUser BuyerVO account) {
    	ArrayList<deliveryVO> list = buyerService.deliveryListAll(account.getId());
    	model.addAttribute("list",list);
    	model.addAttribute("name",account.getName());
    	model.addAttribute("loginDate",account.getLoginDate().substring(0,10));
    	
    	return "Buyer/mypage_deliveryManager";
    }
    
    @RequestMapping(value = "/BuyerMyPageOrderList.by")  // �굹�쓽 �눥�븨 �솢�룞 - 二쇰Ц�궡�뿭
    public String buyerMyPageOrderList(Model model, @CurrentUser BuyerVO account) {
    	model.addAttribute("name",account.getName());
    	model.addAttribute("loginDate",account.getLoginDate().substring(0,10));
    	return "Buyer/mypage_orderList";
    }
    
    @RequestMapping(value = "/BuyerMyPageWishList.by")  // �굹�쓽 �눥�븨 �솢�룞 - 李쒕ぉ濡�
    public String buyerMyPageWishList(Model model, @CurrentUser BuyerVO account) {
    	model.addAttribute("name",account.getName());
    	model.addAttribute("loginDate",account.getLoginDate().substring(0,10));
    	return "Buyer/mypage_wishList";
    }
    
    @RequestMapping(value = "/BuyerMyPageRecentlyView.by")  // �굹�쓽 �눥�븨 �솢�룞 - 理쒓렐 蹂� �긽�뭹
    public String buyerMyPageRecentlyView(Model model, @CurrentUser BuyerVO account) {
    	model.addAttribute("name",account.getName());
    	model.addAttribute("loginDate",account.getLoginDate().substring(0,10));
    	return "Buyer/mypage_recentlyView";
    }
    
    @RequestMapping(value = "/BuyerMyPageReview.by")  // �굹�쓽 �눥�븨 �솢�룞 - 援щℓ�썑湲�
    public String buyerMyPageReview(Model model, @CurrentUser BuyerVO account) {
    	model.addAttribute("name",account.getName());
    	model.addAttribute("loginDate",account.getLoginDate().substring(0,10));
    	return "Buyer/mypage_review";
    }

    @RequestMapping(value = "/BuyerMyPageProductQna.by")  // Q&A - �긽�뭹臾몄쓽
    public String buyerMyPageProductQna(Model model, @CurrentUser BuyerVO account) {
    	model.addAttribute("name",account.getName());
    	model.addAttribute("loginDate",account.getLoginDate().substring(0,10));
    	return "Buyer/mypage_productQna";
    }
    
    @RequestMapping(value = "/BuyerMyPageServiceQna.by")  // Q&A - 1:1 臾몄쓽
    public String buyerMyPageServiceQna(Model model, @CurrentUser BuyerVO account) {
    	model.addAttribute("name",account.getName());
    	model.addAttribute("loginDate",account.getLoginDate().substring(0,10));
    	return "Buyer/mypage_serviceQna";
    }
    
    
    @GetMapping(value = "/AddWishList.by")  // 위시리스트 추가 (BoardProductView.jsp 연결)
    public void addWishList(HttpServletResponse response, String board_id) throws IOException {
    	
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
        if(buyerService.getWishListOverlapCheck(board_id, "test") == 1) {
        	
        	out.println("<script>alert('이미 위시리스트에 담긴 상품입니다.');history.go(-1);</script>");
        	
        }else {
        	WishListVO vo = new WishListVO();
        	
        	vo.setBoard_id(board_id);
        	
        	vo.setBuyer_id("test");  // 임시로 구매자 id test 설정 (세션값으로 받음)
        	
        	UUID uuid = UUID.randomUUID(); // 중복 방지를 위해 랜덤값 생성
        	long getl = ByteBuffer.wrap(uuid.toString().getBytes()).getLong();
        	
        	StringBuilder wish_id = new StringBuilder(
        			vo.getBuyer_id() + "-" + Long.toString(getl, 10));
        	
        	vo.setWish_id(wish_id.toString());
        	
    		
    		if(buyerService.insertWishList(vo) == 1) {
    			out.println("<script>alert('장바구니에 상품을 담았습니다.');history.go(-1);</script>");
    		}

        }
        
        out.flush();
    }
    
    
    
    
    @RequestMapping(value = "JoinBuyer.by" ,method = RequestMethod.POST)
    public String RegisterBuyerAccount(@ModelAttribute("buyer") BuyerVO buyer) {
    		String telCarrierNum = buyer.getTelCarrierNum();
    		String telAllocationNum = buyer.getTelAllocationNum();
    		String telDiscretionaryNum = buyer.getTelDiscretionaryNum();
    		String emailId = buyer.getEmailId();
    		String emailAddr = buyer.getEmailAddr();
    		String addrNum = buyer.getAddrNum();
    		String addrRoadName = buyer.getAddrRoadName();
    		String addrDetail = buyer.getAddrDetail();
    		
    		buyer.setTel(telCarrierNum, telAllocationNum, telDiscretionaryNum);
    		buyer.setEmail(emailId, emailAddr);
    		buyer.setAddress(addrNum, addrRoadName, addrDetail);
    		SecurityService.RegisterBuyerAccount(buyer);
    		
    		return "redirect:/JoinBuyerComplete.ad";
    	
    }
    
    @RequestMapping(value = "/duplicationCheck.by",
    		method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    @ResponseBody
    public HashMap<String, Object> idDuplicationCheck(BuyerVO buyer) {
    	HashMap<String, Object> result = new HashMap<String, Object>();
    	String id = buyer.getId();
		boolean isDuplication = buyerService.duplicateCheck(id);
			System.out.println("중복체크결과: "+isDuplication);
		if( isDuplication ) {
			result.put("result", "Fail");
		}else {
			result.put("result", "OK");
		}
		System.out.println("result값=" + result.get("result"));
		return result;
    	
    }

}
