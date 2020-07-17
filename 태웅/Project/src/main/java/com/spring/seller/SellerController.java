package com.spring.seller;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.AccountVO;
import com.spring.boardproduct.BoardProductVO;
import com.spring.config.Security.CurrentUser;
import com.spring.config.Security.CustomDetailService;
import com.spring.order.OrderRecordVO;

@Controller
public class SellerController {
	
	@Autowired
	SellerServiceImpl Sellerservice;
	
	@Autowired
	CustomDetailService SecurityService;
	
	@RequestMapping(value = "/SellerMyPage.se")  
	public String sellerMyPage(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
    	if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
    		sellerAccount.setProfileImg("profile-basic.png");
    	}
    	model.addAttribute("user",sellerAccount);
    	
    	
		return "Seller/mypage_main";
	}
	
//	@RequestMapping(value = "/SellerInfoModify.se")  // �봽濡쒗븘 �닔�젙
//	public String sellerInfoModify(Model model, @CurrentUser AccountVO account) {
//		
//		String id = account.getId();
//		SellerVO sellerAccount =  Sellerservice.selectOneById(id);
//		
//		int mailIndex = sellerAccount.getEmail().indexOf("@");
//		model.addAttribute("loginDate", sellerAccount.getLoginDate().substring(0,10));
//		model.addAttribute("represent", sellerAccount.getRepresent());
//		model.addAttribute("reportNum", sellerAccount.getOrderReportNum());
//		model.addAttribute("shopName", sellerAccount.getShopName());
//		model.addAttribute("name", sellerAccount.getName());
//		model.addAttribute("id", sellerAccount.getId());
//		model.addAttribute("tel1", sellerAccount.getTel().substring(0,3));
//		model.addAttribute("tel2", sellerAccount.getTel().substring(3,7));
//		model.addAttribute("tel3", sellerAccount.getTel().substring(7,11));
//	
//		model.addAttribute("mailId", sellerAccount.getEmail().substring(0,mailIndex));
//		model.addAttribute("mailAddr", sellerAccount.getEmail().substring(mailIndex+1));
//		model.addAttribute("addr", sellerAccount.getAddress());
//		model.addAttribute("bankName", sellerAccount.getBankName());
//		model.addAttribute("bankAccount", sellerAccount.getBankAccountNum());
//		
//		
//		
//		if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
//    		model.addAttribute("profileImg", "profile-basic.png");
//    	}else {
//    		model.addAttribute("profileImg", sellerAccount.getProfileImg());
//    	}
//		
//		return "Seller/mypage_infoModify";
//	}
	
	
	@RequestMapping(value = "/SellerProductRegister.se")  // �긽�뭹�궡�뿭 - �긽�뭹�벑濡�
	public String sellerProductRegister(Model model, @CurrentUser AccountVO account) {
		
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
    		sellerAccount.setProfileImg("profile-basic.png");
    	}
		
		model.addAttribute("user",sellerAccount);
		
		
		return "Seller/mypage_productRegister";
	}
	
	@RequestMapping(value = "/SellerProductList.se")    // �긽�뭹�궡�뿭 - �긽�뭹�궡�뿭
	public String sellerProductList(Model model, @CurrentUser AccountVO account, BoardProductVO board) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		board.setSeller_id(account.getId());
		ArrayList<BoardProductVO> productList = Sellerservice.selectProductListById(board.getSeller_id());

		if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
    		sellerAccount.setProfileImg("profile-basic.png");
    	}
		
		model.addAttribute("productList", productList);
		model.addAttribute("user",sellerAccount);
		
		return "Seller/mypage_productList";
	}
	
	@RequestMapping(value = "/SellerProductModifyForm.se")    // �긽�뭹�궡�뿭 - �뙋留ㅺ� �닔�젙
	public String sellerProductModifyForm(Model model, @CurrentUser AccountVO account,
			@RequestParam(value = "board_id", required= true) String board_id) {
		
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		BoardProductVO product = Sellerservice.BoardSelectOneByBoardId(board_id);
		if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
    		sellerAccount.setProfileImg("profile-basic.png");
    	}
		
		model.addAttribute("product", product);
		model.addAttribute("user",sellerAccount);
		return "Seller/mypage_productModify";
	}
	
	@RequestMapping(value = "/SellerProductModify.se")
	public String sellerProductModify() {
		return "redirect:/Seller/mypage_productList";
	}
	
	@RequestMapping(value = "/SellerOrderStatus.se")    // 嫄곕옒�궡�뿭 - 二쇰Ц愿�由�
	public String sellerOrderStatus(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
    		sellerAccount.setProfileImg("profile-basic.png");
    	}
		
		model.addAttribute("user",sellerAccount);
		return "Seller/mypage_orderStatus";
	}
	

	
	@RequestMapping(value = "/SellerCalculateManager.se")    // 嫄곕옒�궡�뿭 - 嫄곕옒紐⑸줉
	public String sellerCalculateManager(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
    		sellerAccount.setProfileImg("profile-basic.png");
    	}
		
		model.addAttribute("user",sellerAccount);
		return "Seller/mypage_calculateManager";
	}
	
	@RequestMapping(value = "/SellerMarketPriceInfo.se")  // �긽�뭹 �떆�꽭�젙蹂�
	public String sellerMarketPriceInfo(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
    		sellerAccount.setProfileImg("profile-basic.png");
    	}
		
		model.addAttribute("user",sellerAccount);
		return "Seller/mypage_marketPriceInfo";
	}
	
	// �상품시세정보조히
	
	@RequestMapping(value = "/SellerMarketPriceInfoSearch.se", method = RequestMethod.GET)
	public String sellerMarketPriceInfoSearch(Model model, String regday, String countycode, String itemcategorycode) {
		
		String url = "https://www.kamis.or.kr/customer/price/wholesale/catalogue.do?action=daily&regday=" 
		    + regday + "&countycode=" + countycode + "&itemcategorycode=" + itemcategorycode + "&convert_kg_yn=N";
		
		// 건들지말것
		// =================================================================================
		// �크롤링할 해당 사이트의 인증시 유효성 체크 비활성화
		
		TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {

			@Override
			public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
				// TODO Auto-generated method stub
				
			}

			@Override
			public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
				// TODO Auto-generated method stub
				
			}

			@Override
			public X509Certificate[] getAcceptedIssuers() {
				// TODO Auto-generated method stub
				return null;
			}
			
		}
				
		};
		
		// Install the all-trusting trust manager
		SSLContext sc = null;
		
		try {
			sc = SSLContext.getInstance("SSL");
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			sc.init(null, trustAllCerts, new java.security.SecureRandom());
		} catch (KeyManagementException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
		// Create all-trusting host name verifier
		HostnameVerifier allHostsValid = new HostnameVerifier() {

			@Override
			public boolean verify(String hostname, SSLSession session) {
				// TODO Auto-generated method stub
				return true;
			}
			
		};
		
		// Install the all-trusting host verifier
		HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
		
		// ===========================================================================
		
		
		
		Document doc = null;
		
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
       
        
		Elements element = doc.select("div.content");
		
		
       String table = element.select("section > table > tbody").html();
		
       model.addAttribute("table", table);
		
		return "Seller/mypage_marketPriceInfo";
	}
	
	
	@RequestMapping(value = "/SellerProductQNA.se")  // Q&A - �긽�뭹臾몄쓽
	public String sellerProductQNA(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
    		sellerAccount.setProfileImg("profile-basic.png");
    	}
		
		model.addAttribute("user",sellerAccount);
		return "Seller/mypage_productQNA";
	}
	
	@RequestMapping(value = "/SellerProductReview.se")  // Q&A - �긽�뭹�썑湲�
	public String sellerProductReview(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
    		sellerAccount.setProfileImg("profile-basic.png");
    	}
		
		model.addAttribute("user",sellerAccount);
		return "Seller/mypage_productReview";
	}
	
   @RequestMapping(value = "JoinSeller.se" ,method = RequestMethod.POST)
    public String RegisterSellerAccount(@ModelAttribute("seller") SellerVO seller) {
    		String telCarrierNum = seller.getTelCarrierNum();
    		String telAllocationNum = seller.getTelAllocationNum();
    		String telDiscretionaryNum = seller.getTelDiscretionaryNum();
    		String emailId = seller.getEmailId();
    		String emailAddr = seller.getEmailAddr();
    		String addrNum = seller.getAddrNum();
    		String addrRoadName = seller.getAddrRoadName();
    		String addrDetail = seller.getAddrDetail();
 
    		
    		seller.setTel(telCarrierNum, telAllocationNum, telDiscretionaryNum);
    		seller.setEmail(emailId, emailAddr);
    		seller.setAddress(addrNum, addrRoadName, addrDetail);
    		SecurityService.RegisterSellerAccout(seller);
    		
    		return "redirect:/JoinSellerComplete.ad";
    	
    }
   
   
   
   @RequestMapping(value =" /profile_defaultImg.se",
		   method = RequestMethod.POST, produces = "application/json;charset=utf-8")
   @ResponseBody
   public void defultImg(@CurrentUser AccountVO account) {
	   SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		
	   sellerAccount.setProfileImg("");
	   Sellerservice.UpdateProfileImg(sellerAccount);
   }
   
 
   

	@RequestMapping(value = "/UpdateSellerAccountForm.se")  // 프로필 수정
	public String UpdateSellerAccountForm(Model model, @CurrentUser AccountVO seller) {
		
		SellerVO sellerAccount = Sellerservice.selectOneById(seller.getId());
		int mailIndex = sellerAccount.getEmail().indexOf("@");
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		sellerAccount.setEmailId(sellerAccount.getEmail().substring(0,mailIndex));
		sellerAccount.setEmailAddr(sellerAccount.getEmail().substring(mailIndex+1));
		sellerAccount.setTelCarrierNum(sellerAccount.getTel().substring(0,3));
		sellerAccount.setTelAllocationNum(sellerAccount.getTel().substring(3,7));
		sellerAccount.setTelDiscretionaryNum(sellerAccount.getTel().substring(7,11));
	 	if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
			sellerAccount.setProfileImg("profile-basic.png");
		}
	 	model.addAttribute("user",sellerAccount);
	 	
   		return "Seller/mypage_infoModify";
	}
	
	
	
	@RequestMapping(value = "/UpdateSellerAccount.se")
   public String UpdateSellerAccount(SellerVO seller) {

   	String telCarrierNum = seller.getTelCarrierNum();
		String telAllocationNum = seller.getTelAllocationNum();
		String telDiscretionaryNum = seller.getTelDiscretionaryNum();
		
		String emailId = seller.getEmailId();
		String emailAddr = seller.getEmailAddr();

		
		seller.setTel(telCarrierNum, telAllocationNum, telDiscretionaryNum);
		seller.setEmail(emailId, emailAddr);

		Sellerservice.UpdateSellerAccount(seller);
   	
   	return "redirect:/SellerMyPage.se";
   	    	
   }
	
	@RequestMapping(value = "/UpdateSellerPasswordFrom.se")
   public String UpdateSellerPasswordFrom(Model model, @CurrentUser AccountVO seller) {
		
		SellerVO sellerAccount = Sellerservice.selectOneById(seller.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		
   
	   	System.out.println("11seller.getId() : " + sellerAccount.getId());
	   	System.out.println("11seller.getPassword() : " + sellerAccount.getPassword());
	   	
	   	if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
			sellerAccount.setProfileImg("profile-basic.png");
		}
	   	model.addAttribute("user",sellerAccount);
   	
	   	return "Seller/mypage_passwordModify";
   }
   
   @RequestMapping(value = "/UpdateSellerPassword.se")
   public String UpdateSellerPassword(SellerVO seller) {
		
		System.out.println("22seller.getId() : " + seller.getId());
   	System.out.println("22seller.getPassword() : " + seller.getPassword());
		
		SecurityService.SellerConfirmPassword(seller);
 		
		return "redirect:/SellerMyPage.se";
   }    
   
   @RequestMapping(value = "/SellerTransactionList.se")    // 거래내역 - 거래목록
	public String sellerTransactionList(Model model, @CurrentUser AccountVO account,
										OrderRecordVO orderRecordVo,
		@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		System.out.println("test");
		System.out.println("listCount : " + Sellerservice.getOrderRecordOneByIdListCount(account.getId()));
		String id = account.getId();
		SellerVO sellerAccount = Sellerservice.selectOneById(id);
		int limit = 10;

		int listcount = Sellerservice.getOrderRecordOneByIdListCount(account.getId());
		
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;

		List<OrderRecordVO> orderRecordList = Sellerservice.getOrderRecordOneByIdList(account.getId(), startrow, endrow);
		
		//총 페이지 수
  		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리
  		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
  		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
  		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
  		int endpage = maxpage;
  		
  		if (endpage>startpage+10-1) endpage=startpage+10-1;
  		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("orderRecordList", orderRecordList);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		
		
		model.addAttribute("orderRecordlist", orderRecordList);		
		System.out.println("orderRecordlist222 : " + orderRecordList);
				
		//주문번호
		model.addAttribute("order_id", orderRecordVo.getOrder_id());
		//상품명
		model.addAttribute("board_title", orderRecordVo.getBoard_title());
		
		//가격
		model.addAttribute("amount", orderRecordVo.getAmount());
		model.addAttribute("price", orderRecordVo.getPrice());
	
		//구매일
		model.addAttribute("order_date", orderRecordVo.getOrder_date());
			
		//회원 구분
		model.addAttribute("non_member_flag", orderRecordVo.getNon_member_flag());
		
		//사이드메뉴 프로필 정보
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
    	if(sellerAccount.getProfileImg() == null || sellerAccount.getProfileImg() == "") {
    		sellerAccount.setProfileImg("profile-basic.png");
    	}
    	model.addAttribute("user",sellerAccount);
		
		return "Seller/mypage_transactionList";
	}
 
	
}
