package com.spring.seller;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.HashMap;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.config.Security.CurrentUser;
import com.spring.config.Security.SellerDetailService;

@Controller
public class SellerController {
	
	@Autowired
	SellerServiceImpl service;
	
	@Autowired
	SellerDetailService Securityservice; 

	@RequestMapping(value = "/SellerMyPage.se")  
	public String sellerMyPage(Model model, @CurrentUser SellerVO account) {
		model.addAttribute("name", account.getName());
    	model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
    	model.addAttribute("grade", account.getGrade());
    	if(account.getProfileImg() == null || account.getProfileImg() == "") {
    		model.addAttribute("profileImg", "profile-basic.png");
    	}else {
    		model.addAttribute("profileImg", account.getProfileImg());
    	}
		return "Seller/mypage_main";
	}
	
	@RequestMapping(value = "/SellerInfoModify.se")  // �봽濡쒗븘 �닔�젙
	public String sellerInfoModify(Model model, @CurrentUser SellerVO account) {
		
		int mailIndex = account.getEmail().indexOf("@");
		model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
		model.addAttribute("represent", account.getRepresent());
		model.addAttribute("reportNum", account.getOrderReportNum());
		model.addAttribute("shopName", account.getShopName());
		model.addAttribute("name", account.getName());
		model.addAttribute("id", account.getId());
		model.addAttribute("tel1", account.getTel().substring(0,3));
		model.addAttribute("tel2", account.getTel().substring(3,7));
		model.addAttribute("tel3", account.getTel().substring(7,11));
	
		model.addAttribute("mailId", account.getEmail().substring(0,mailIndex));
		model.addAttribute("mailAddr", account.getEmail().substring(mailIndex+1));
		model.addAttribute("addr", account.getAddress());//주소넣어야함
		model.addAttribute("bankName", account.getBankName());
		model.addAttribute("bankAccount", account.getBankAccountNum());
		
		
		
		if(account.getProfileImg() == null || account.getProfileImg() == "") {
    		model.addAttribute("profileImg", "profile-basic.png");
    	}else {
    		model.addAttribute("profileImg", account.getProfileImg());
    	}
		
		return "Seller/mypage_infoModify";
	}
	
	
	@RequestMapping(value = "/SellerProductRegister.se")  // �긽�뭹�궡�뿭 - �긽�뭹�벑濡�
	public String sellerProductRegister(Model model, @CurrentUser SellerVO account) {
		model.addAttribute("name", account.getName());
		model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
		if(account.getProfileImg() == null || account.getProfileImg() == "") {
    		model.addAttribute("profileImg", "profile-basic.png");
    	}else {
    		model.addAttribute("profileImg", account.getProfileImg());
    	}
		return "Seller/mypage_productRegister";
	}
	
	@RequestMapping(value = "/SellerProductList.se")    // �긽�뭹�궡�뿭 - �긽�뭹�궡�뿭
	public String sellerProductList(Model model, @CurrentUser SellerVO account) {
		model.addAttribute("name", account.getName());
		model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
		if(account.getProfileImg() == null || account.getProfileImg() == "") {
    		model.addAttribute("profileImg", "profile-basic.png");
    	}else {
    		model.addAttribute("profileImg", account.getProfileImg());
    	}
		return "Seller/mypage_productList";
	}
	
	@RequestMapping(value = "/SellerProductModify.se")    // �긽�뭹�궡�뿭 - �뙋留ㅺ� �닔�젙
	public String sellerProductModify(Model model, @CurrentUser SellerVO account) {
		model.addAttribute("name", account.getName());
		model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
		if(account.getProfileImg() == null || account.getProfileImg() == "") {
    		model.addAttribute("profileImg", "profile-basic.png");
    	}else {
    		model.addAttribute("profileImg", account.getProfileImg());
    	}
		return "Seller/mypage_productModify";
	}
	
	@RequestMapping(value = "/SellerOrderStatus.se")    // 嫄곕옒�궡�뿭 - 二쇰Ц愿�由�
	public String sellerOrderStatus(Model model, @CurrentUser SellerVO account) {
		model.addAttribute("name", account.getName());
		model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
		if(account.getProfileImg() == null || account.getProfileImg() == "") {
    		model.addAttribute("profileImg", "profile-basic.png");
    	}else {
    		model.addAttribute("profileImg", account.getProfileImg());
    	}
		return "Seller/mypage_orderStatus";
	}
	
	@RequestMapping(value = "/SellerTransactionList.se")    // 嫄곕옒�궡�뿭 - 嫄곕옒紐⑸줉
	public String sellerTransactionList(Model model, @CurrentUser SellerVO account) {
		model.addAttribute("name", account.getName());
		model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
		if(account.getProfileImg() == null || account.getProfileImg() == "") {
    		model.addAttribute("profileImg", "profile-basic.png");
    	}else {
    		model.addAttribute("profileImg", account.getProfileImg());
    	}
		return "Seller/mypage_transactionList";
	}
	
	@RequestMapping(value = "/SellerCalculateManager.se")    // 嫄곕옒�궡�뿭 - 嫄곕옒紐⑸줉
	public String sellerCalculateManager(Model model, @CurrentUser SellerVO account) {
		model.addAttribute("name", account.getName());
		model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
		if(account.getProfileImg() == null || account.getProfileImg() == "") {
    		model.addAttribute("profileImg", "profile-basic.png");
    	}else {
    		model.addAttribute("profileImg", account.getProfileImg());
    	}
		return "Seller/mypage_calculateManager";
	}
	
	@RequestMapping(value = "/SellerMarketPriceInfo.se")  // �긽�뭹 �떆�꽭�젙蹂�
	public String sellerMarketPriceInfo(Model model, @CurrentUser SellerVO account) {
		model.addAttribute("name", account.getName());
		model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
		if(account.getProfileImg() == null || account.getProfileImg() == "") {
    		model.addAttribute("profileImg", "profile-basic.png");
    	}else {
    		model.addAttribute("profileImg", account.getProfileImg());
    	}
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
	public String sellerProductQNA(Model model, @CurrentUser SellerVO account) {
		model.addAttribute("name", account.getName());
		model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
		if(account.getProfileImg() == null || account.getProfileImg() == "") {
    		model.addAttribute("profileImg", "profile-basic.png");
    	}else {
    		model.addAttribute("profileImg", account.getProfileImg());
    	}
		return "Seller/mypage_productQNA";
	}
	
	@RequestMapping(value = "/SellerProductReview.se")  // Q&A - �긽�뭹�썑湲�
	public String sellerProductReview(Model model, @CurrentUser SellerVO account) {
		model.addAttribute("name", account.getName());
		model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
		if(account.getProfileImg() == null || account.getProfileImg() == "") {
    		model.addAttribute("profileImg", "profile-basic.png");
    	}else {
    		model.addAttribute("profileImg", account.getProfileImg());
    	}
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
    		Securityservice.RegisterSellerAccout(seller);
    		
    		return "redirect:/JoinSellerComplete.ad";
    	
    }
   
   @RequestMapping(value ="/duplicationCheck.se",
			method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> idDuplicationCheck(SellerVO seller){
		HashMap<String, Object> result = new HashMap<String, Object>();
		String id = seller.getId();
		System.out.println("id받아온 값=" + id);
		boolean isDuplication = service.duplicateCheck(id);
		
		if( isDuplication ) {
			result.put("result", "Fail");
		}else {
			result.put("result", "OK");
		}
		System.out.println("result값=" + result.get("result"));
		return result;
	}
	
   @RequestMapping(value = "/profile_Update.se", method = RequestMethod.POST)
   public void profileUpdate(@CurrentUser SellerVO account) {
	   service.UpdateSellerAccount(account);
	   
   }
   
   
   @RequestMapping(value =" /profile_defaultImg.se",
		   method = RequestMethod.POST, produces = "application/json;charset=utf-8")
   @ResponseBody
   public void defultImg(@CurrentUser SellerVO account) {
	   account.setProfileImg("");
	   service.UpdateProfileImg(account);
   }
   
   
 
	
}
