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

import com.spring.buyer.BuyerVO;
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
//    	model.addAttribute("loginDate", account.getLoginDate().substring(0,10));
    	model.addAttribute("grade", account.getGrade());
		return "Seller/mypage_main";
	}
	
	@RequestMapping(value = "/SellerInfoModify.se")  // �봽濡쒗븘 �닔�젙
	public String sellerInfoModify() {

		return "Seller/mypage_infoModify";
	}
	
	
	@RequestMapping(value = "/SellerProductRegister.se")  // �긽�뭹�궡�뿭 - �긽�뭹�벑濡�
	public String sellerProductRegister() {

		return "Seller/mypage_productRegister";
	}
	
	@RequestMapping(value = "/SellerProductList.se")    // �긽�뭹�궡�뿭 - �긽�뭹�궡�뿭
	public String sellerProductList() {

		return "Seller/mypage_productList";
	}
	
	@RequestMapping(value = "/SellerProductModify.se")    // �긽�뭹�궡�뿭 - �뙋留ㅺ� �닔�젙
	public String sellerProductModify() {

		return "Seller/mypage_productModify";
	}
	
	@RequestMapping(value = "/SellerOrderStatus.se")    // 嫄곕옒�궡�뿭 - 二쇰Ц愿�由�
	public String sellerOrderStatus() {

		return "Seller/mypage_orderStatus";
	}
	
	@RequestMapping(value = "/SellerTransactionList.se")    // 嫄곕옒�궡�뿭 - 嫄곕옒紐⑸줉
	public String sellerTransactionList() {

		return "Seller/mypage_transactionList";
	}
	
	@RequestMapping(value = "/SellerCalculateManager.se")    // 嫄곕옒�궡�뿭 - 嫄곕옒紐⑸줉
	public String sellerCalculateManager() {
		
		return "Seller/mypage_calculateManager";
	}
	
	@RequestMapping(value = "/SellerMarketPriceInfo.se")  // �긽�뭹 �떆�꽭�젙蹂�
	public String sellerMarketPriceInfo() {

		return "Seller/mypage_marketPriceInfo";
	}
	
	// �긽�뭹 �떆�꽭�젙蹂� 議고쉶�븯湲�
	
	@RequestMapping(value = "/SellerMarketPriceInfoSearch.se", method = RequestMethod.GET)
	public String sellerMarketPriceInfoSearch(Model model, String regday, String countycode, String itemcategorycode) {
		
		String url = "https://www.kamis.or.kr/customer/price/wholesale/catalogue.do?action=daily&regday=" 
		    + regday + "&countycode=" + countycode + "&itemcategorycode=" + itemcategorycode + "&convert_kg_yn=N";
		
		// �씠 �뙆�듃 �뾾�쑝硫� �겕濡ㅻ쭅 �븞�릺�땲源� �젅�� 嫄대뱾吏� 留� 寃�
		// =================================================================================
		// �겕濡ㅻ쭅�븷 �빐�떦 �궗�씠�듃�쓽 �씤利앹꽌 �쑀�슚�꽦 泥댄겕 鍮꾪솢�꽦�솕
		
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
	public String sellerProductQNA() {
		
		return "Seller/mypage_productQNA";
	}
	
	@RequestMapping(value = "/SellerProductReview.se")  // Q&A - �긽�뭹�썑湲�
	public String sellerProductReview() {
		
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
	
	
}
