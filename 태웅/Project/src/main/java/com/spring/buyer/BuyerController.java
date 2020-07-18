package com.spring.buyer;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.admin.AccountVO;
import com.spring.boardproduct.BoardProductService;
import com.spring.boardproduct.BoardProductVO;
import com.spring.config.Security.CurrentUser;
import com.spring.config.Security.CustomDetailService;

@Controller
public class BuyerController {
	
	@Autowired
	BuyerService buyerService;
	
	@Autowired
	CustomDetailService SecurityService;
	
	@Autowired
	BoardProductService productService;
	
    @RequestMapping(value = "/BuyerMyPage.by")  
    public String buyerMyPage(Model model, @CurrentUser AccountVO account) {
    	BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
    	buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0,10));
    	buyerAccount.setJoinDate(buyerAccount.getJoinDate().substring(0,10));
  
    	model.addAttribute("user",buyerAccount);    	
    	return "Buyer/mypage_main";
    }
    
    @RequestMapping(value = "/BuyerMyPageOrderList.by")  // �굹�쓽 �눥�븨 �솢�룞 - 二쇰Ц�궡�뿭
    public String buyerMyPageOrderList(Model model, @CurrentUser AccountVO account) {
    	BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
    	buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0,10));
    	model.addAttribute("user",buyerAccount);
    	return "Buyer/mypage_orderList";
    }
    
    @RequestMapping(value = "/BuyerMyPageWishList.by")  // �굹�쓽 �눥�븨 �솢�룞 - 李쒕ぉ濡�
    public String buyerMyPageWishList(Model model, @CurrentUser AccountVO account) {
    	BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
    	buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0,10));
    	
    	model.addAttribute("user",buyerAccount);
    	return "Buyer/mypage_wishList";
    }
    
    @RequestMapping(value = "/BuyerMyPageRecentlyView.by")  // �굹�쓽 �눥�븨 �솢�룞 - 理쒓렐 蹂� �긽�뭹
    public String buyerMyPageRecentlyView(Model model,@CookieValue(value="AccountRecentlyProduct",
					required=false)Cookie cookie, @CurrentUser AccountVO account) {
      	BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
    	buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0,10));
    	ArrayList<BoardProductVO> recentList = new ArrayList<>();
    	int index1 = cookie.getValue().indexOf("/");
    	String str = cookie.getValue().substring(index1+1);
    	String[] recentArray = str.split("/");
    	
    	for(int i=0; i<recentArray.length; i++) {
    		recentList.add(productService.getBoardProductVO(recentArray[i]));
    	}
    	
    	model.addAttribute("list",recentList);
    	model.addAttribute("user",buyerAccount);
    	return "Buyer/mypage_recentlyView";
    }
    
    @RequestMapping(value = "/BuyerMyPageReview.by")  // �굹�쓽 �눥�븨 �솢�룞 - 援щℓ�썑湲�
    public String buyerMyPageReview(Model model, @CurrentUser AccountVO account) {
      	BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
    	buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0,10));
    	
    	model.addAttribute("user",buyerAccount);

    	return "Buyer/mypage_review";
    }

    @RequestMapping(value = "/BuyerMyPageProductQna.by")  // Q&A - �긽�뭹臾몄쓽
    public String buyerMyPageProductQna(Model model, @CurrentUser AccountVO account) {
      	BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
    	buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0,10));
    	
    	model.addAttribute("user",buyerAccount);
    	return "Buyer/mypage_productQna";
    }
    
    @RequestMapping(value = "/BuyerMyPageServiceQna.by")  // Q&A - 1:1 臾몄쓽
    public String buyerMyPageServiceQna(Model model, @CurrentUser AccountVO account) {
      	BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
    	buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0,10));
    	
    	model.addAttribute("user",buyerAccount);
    	return "Buyer/mypage_serviceQna";
    }


    //+게시판 목록 조회
    @RequestMapping(value = "/BuyerMyPageSavePoint.by") //적립금
    public String buyerMyPageSavePoint(Model model,@CurrentUser AccountVO account,@RequestParam("status")String status,
    		CriteriaVO cri) throws Exception {
    
		String id = account.getId();
		int rowStart = cri.getRowStart();
		int rowEnd = cri.getRowEnd();
    	ArrayList<SavePointVO> pointList = buyerService.savePointListAll(id,status,rowStart,rowEnd);
    	BuyerVO buyerAccount = buyerService.selectOneById(id);
    	buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0,10));
    	PageMaker pageMaker = new PageMaker();
    	pageMaker.setCri(cri);
    	pageMaker.setTotalCount(buyerService.listCount(id, status));
    	
    	for(int i = 0; i <pointList.size(); i++) {
    		int contentIndex = pointList.get(i).getContent().indexOf('+');
    		pointList.get(i).setContentTitle(pointList.get(i).getContent().substring(0,contentIndex));
    		pointList.get(i).setContentDetail(pointList.get(i).getContent().substring(contentIndex+1));
    		pointList.get(i).setApplicationDate(pointList.get(0).getApplicationDate().substring(0,11));
    	}
    	model.addAttribute("currentPage",cri.getPage());
    	model.addAttribute("pageMaker",pageMaker);
    	model.addAttribute("pointList",pointList);
    	model.addAttribute("condition",status);
    	model.addAttribute("user",buyerAccount);
    	return "Buyer/mypage_savePoint";
    	
    }
    
    @RequestMapping(value = "/BuyerMyPageMyGrade.by") //나의 등급
    public String buyerMyPageMyGrade(Model model, @CurrentUser AccountVO account) { 	
      	BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
    	buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0,10));
    	
    	model.addAttribute("user",buyerAccount);
    	return "Buyer/mypage_grade";
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
    
    @RequestMapping(value = "/UpdateBuyerAccountForm.by")  // 프로필 - 수정하기
    public String UpdateBuyerAccountForm(Model model, @CurrentUser AccountVO buyer) {
    	
    	BuyerVO vo = buyerService.selectOneById(buyer.getId());
    	
    	int mailIndex = vo.getEmail().indexOf("@");
    	
    	vo.setEmailId(vo.getEmail().substring(0,mailIndex));
    	vo.setEmailAddr(vo.getEmail().substring(mailIndex + 1));
    	vo.setTelCarrierNum(vo.getTel().substring(0,3));
    	vo.setTelAllocationNum(vo.getTel().substring(3,7));
    	vo.setTelDiscretionaryNum(vo.getTel().substring(7));
    	vo.setLoginDate(vo.getLoginDate().substring(0,10));
    	model.addAttribute("user",vo);
    	
    	
    	return "Buyer/mypage_infoModify";
    }
    
    @RequestMapping(value = "/UpdateBuyerAccount.by")
    public String UpdateBuyerAccount(BuyerVO buyer) {
    	
    	String telCarrierNum = buyer.getTelCarrierNum();
		String telAllocationNum = buyer.getTelAllocationNum();
		String telDiscretionaryNum = buyer.getTelDiscretionaryNum();
		
		String emailId = buyer.getEmailId();
		String emailAddr = buyer.getEmailAddr();
		
		buyer.setTel(telCarrierNum, telAllocationNum, telDiscretionaryNum);
		
		buyer.setEmail(emailId, emailAddr);
    	
		buyerService.UpdateBuyerAccount(buyer);
    	
    	return "redirect:/BuyerMyPage.by";
    	    	
    }

    @RequestMapping(value = "/UpdateBuyerPasswordForm.by")
    public String UpdateBuyerPasswordForm(Model model, @CurrentUser AccountVO buyer) {
    	
    	BuyerVO vo = buyerService.selectOneById(buyer.getId());
    	vo.setLoginDate(vo.getLoginDate().substring(0,10));
    	model.addAttribute("user",vo);

    	
    	System.out.println("11buyer.getId() : " + vo.getId());
    	System.out.println("11buyer.getPassword() : " + vo.getPassword());
    	
    	return "Buyer/mypage_passwordModify";
    }
    
    @RequestMapping(value = "/UpdateBuyerPassword.by")
    public String UpdateBuyerPassword(BuyerVO buyer) {
		
		System.out.println("22buyer.getId() : " + buyer.getId());
    	System.out.println("22buyer.getPassword() : " + buyer.getPassword());
		
		SecurityService.BuyerConfirmPassword(buyer);
  		
		return "redirect:/BuyerMyPage.by";
    }    
    
    @RequestMapping(value = "/BuyerMyPageDeliveryManager.by") // �봽濡쒗븘 - 諛곗넚吏� 愿�由�
	public String buyerMyPageDeliveryManager(Model model, @CurrentUser AccountVO account) {
    	BuyerVO BuyerAccount = buyerService.selectOneById(account.getId());
    	BuyerAccount.setLoginDate(BuyerAccount.getLoginDate().substring(0,10));
		ArrayList<deliveryVO> list = buyerService.deliveryListAll(account.getId());
		
		model.addAttribute("list", list);
		model.addAttribute("user",BuyerAccount);

		

		return "Buyer/mypage_deliveryManager";
	}

	@RequestMapping(value = "/ListDeliveryWriteForm.by")
	public String listdeliverywriteForm(Model model, @CurrentUser AccountVO account) {
      	BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
    	buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0,10));
		
    	model.addAttribute("user",buyerAccount);

		return "Buyer/mypage_deliveryManager_write";
	}

	
@RequestMapping(value = "/ListDeliveryWrite.by")
	public String InsertListDeliveryList(deliveryVO delivery, @CurrentUser AccountVO account) {
		BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
		buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0,10));

		String addrNum = delivery.getAddrNum();
		String addrRoadName = delivery.getAddrRoadName();
		String addrDetail = delivery.getAddrDetail();

		String telCarrierNum = delivery.getTelCarrierNum();
		String telAllocationNum = delivery.getTelAllocationNum();
		String telDiscretionaryNum = delivery.getTelDiscretionaryNum();

		System.out.println("delivery.getDefaultaddress() : " + delivery.getDefaultaddress());
		System.out.println("delivery.getAddrNum() : " + delivery.getAddrNum());
		System.out.println("delivery.getAddrRoadName() : " + delivery.getAddrRoadName());
		System.out.println("delivery.getAddrDetail() : " + delivery.getAddrDetail());

		System.out.println("delivery.getTelCarrierNum() : " + delivery.getTelCarrierNum());
		System.out.println("delivery.getTelAllocationNum() : " + delivery.getTelAllocationNum());
		System.out.println("delivery.getTelDiscretionaryNum() : " + delivery.getTelDiscretionaryNum());

		delivery.setAddress(addrNum, addrRoadName, addrDetail);
		delivery.setReceiverPhone(telCarrierNum, telAllocationNum, telDiscretionaryNum);
		delivery.setId(account.getId());
		
		if (delivery.getDefaultaddress().equals("Y"))
			buyerService.UpdateListDeliverList(delivery);

		int res = buyerService.InsertListDeliveryList(delivery);
		


		return "redirect:/BuyerMyPageDeliveryManager.by";
	}

	@RequestMapping(value = "/ListDeliveryDetail.by")
	public String getListDeliveryDetail(@RequestParam(value = "num", required = true) int num, Model model, @CurrentUser AccountVO account) {
		BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
		deliveryVO vo = buyerService.getListDeliveryDetail(num);
		
		model.addAttribute("vo", vo);
		model.addAttribute("user",buyerAccount);
		return "redirect:/BuyerMyPageDeliveryManager.by";
	}

	@RequestMapping(value = "/ListDeliveryModifyForm.by")
	public String ListDeliveryModifyForm(@RequestParam(value="num", required = true) int num, Model model, @CurrentUser BuyerVO account) {		
		
		deliveryVO vo = buyerService.getListDeliveryDetail(num);
				  
		  int addr1 = vo.getAddress().indexOf("+"); 
		  int addr2 = vo.getAddress().indexOf("/");
		  
		  model.addAttribute("num", vo.getNum());
		  System.out.println("vo.getNum=" + vo.getNum());	
		  
		  model.addAttribute("id", vo.getId());
		  System.out.println("vo.getId=" + vo.getId());	 

		  model.addAttribute("deliveryName", vo.getDeliveryName());
		  System.out.println("vo.getDeliveryName=" + vo.getDeliveryName());	  
		  
		  model.addAttribute("receiverName", vo.getReceiverName());
		  System.out.println("vo.getReceiverName()=" + vo.getReceiverName());
		  
		  System.out.println("vo.getAddress()=" + vo.getAddress());
		  model.addAttribute("addrNum", vo.getAddress().substring(0, addr1));	
		  System.out.println("vo.getAddress().substring(0, addr1)=" + vo.getAddress().substring(0, addr1));
		  
		  model.addAttribute("addrRoadName", vo.getAddress().substring(addr1 + 1, addr2));
		  System.out.println("vo.getAddress().substring(addr1 + 1, addr2)=" + vo.getAddress().substring(addr1 + 1, addr2));
		  
		  model.addAttribute("addrDetail", vo.getAddress().substring(addr2+ 1));
		  System.out.println("vo.getAddress().substring(addr2+ 1)=" + vo.getAddress().substring(addr2+ 1));
		  		  
		  model.addAttribute("telCarrierNum", vo.getReceiverPhone().substring(0, 3));		  
		  System.out.println("vo.getReceiverPhone().substring(0, 3)=" + vo.getReceiverPhone().substring(0, 3));
		  model.addAttribute("telAllocationNum", vo.getReceiverPhone().substring(3, 7));		
		  System.out.println("vo.getReceiverPhone().substring(3, 7)=" + vo.getReceiverPhone().substring(3, 7));
		  model.addAttribute("telDiscretionaryNum", vo.getReceiverPhone().substring(7));
		  System.out.println("vo.getReceiverPhone().substring(7)=" + vo.getReceiverPhone().substring(7));
		  
		  model.addAttribute("defaultaddress", vo.getDefaultaddress());
		  System.out.println("vo.getDefaultaddress=" + vo.getDefaultaddress());
		  
			model.addAttribute("name", account.getName());
			model.addAttribute("loginDate", account.getLoginDate().substring(0, 10));

		return "Buyer/mypage_deliveryManager_modify";

	}

	@RequestMapping(value = "/ListDeliveryModfy.by")
	public String ListDeliveryModify(deliveryVO delivery) {
		

		String addrNum = delivery.getAddrNum();		
		String addrRoadName = delivery.getAddrRoadName();
		String addrDetail = delivery.getAddrDetail();

		String telCarrierNum = delivery.getTelCarrierNum();
		String telAllocationNum = delivery.getTelAllocationNum();
		String telDiscretionaryNum = delivery.getTelDiscretionaryNum();

		System.out.println("delivery.getId() : " + delivery.getId());
		System.out.println("delivery.getId() : " + delivery.getId());
		System.out.println("delivery.getAddrNum() : " + delivery.getAddrNum());
		System.out.println("delivery.getAddrRoadName() : " + delivery.getAddrRoadName());
		System.out.println("delivery.getAddrDetail() : " + delivery.getAddrDetail());

		System.out.println("delivery.getTelCarrierNum() : " + delivery.getTelCarrierNum());
		System.out.println("delivery.getTelAllocationNum() : " + delivery.getTelAllocationNum());
		System.out.println("delivery.getTelDiscretionaryNum() : " + delivery.getTelDiscretionaryNum());

		delivery.setAddress(addrNum, addrRoadName, addrDetail);
		delivery.setReceiverPhone(telCarrierNum, telAllocationNum, telDiscretionaryNum);
		
		if (delivery.getDefaultaddress().equals("Y"))
			buyerService.UpdateListDeliverList(delivery);

		buyerService.ListDeliveryModify(delivery);

		return "redirect:/ListDeliveryDetail.by?num=" + delivery.getNum();

	}
	
	@RequestMapping("/ListDeliveryDeleteDelete.by")
	public String ListDeliveryDelete(@RequestParam(value = "num", required = true) int num, HttpSession session,
			HttpServletResponse response) throws Exception {

		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("num", Integer.toString(num));
		int res = buyerService.ListDeliveryDelete(hashmap);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res == 1) {
			writer.write("<script>alert('삭제 성공!!');" + "location.href='./BuyerMyPageDeliveryManager.by';</script>");
		} else {
			writer.write("<script>alert('삭제 실패!!');" + "location.href='./BuyerMyPageDeliveryManager.by';</script>");
		}
		return null;
	}


    
    
}
