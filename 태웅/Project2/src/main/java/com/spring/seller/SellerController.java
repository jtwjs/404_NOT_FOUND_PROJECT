package com.spring.seller;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SellerController {

	@RequestMapping(value = "/SellerMyPage.se")  // 판매자 마이페이지 메인
	public String sellerMyPage() {
		
		return "Seller/mypage_main";
	}
	
	@RequestMapping(value = "/SellerInfoModify.se")  // 프로필 수정
	public String sellerInfoModify() {
		
		return "Seller/mypage_infoModify";
	}
	
	
	@RequestMapping(value = "/SellerProductRegister.se")  // 상품내역 - 상품등록
	public String sellerProductRegister() {
		
		return "Seller/mypage_productRegister";
	}
	
	@RequestMapping(value = "/SellerProductList.se")    // 상품내역 - 상품내역
	public String sellerProductList() {
		
		return "Seller/mypage_productList";
	}
	
	@RequestMapping(value = "/SellerProductModify.se")    // 상품내역 - 판매글 수정
	public String sellerProductModify() {
		
		return "Seller/mypage_productModify";
	}
	
	@RequestMapping(value = "/SellerOrderStatus.se")    // 거래내역 - 주문관리
	public String sellerOrderStatus() {
		
		return "Seller/mypage_orderStatus";
	}
	
	@RequestMapping(value = "/SellerTransactionList.se")    // 거래내역 - 거래목록
	public String sellerTransactionList() {
		
		return "Seller/mypage_transactionList";
	}
	
	@RequestMapping(value = "/SellerCalculateManager.se")    // 거래내역 - 거래목록
	public String sellerCalculateManager() {
		
		return "Seller/mypage_calculateManager";
	}
	
	@RequestMapping(value = "/SellerMarketPriceInfo.se")  // 상품 시세정보
	public String sellerMarketPriceInfo() {
		
		return "Seller/mypage_marketPriceInfo";
	}
	
	// 상품 시세정보 조회하기
	
	@RequestMapping(value = "/SellerMarketPriceInfoSearch.se", method = RequestMethod.GET)
	public String sellerMarketPriceInfoSearch(Model model, String regday, String countycode, String itemcategorycode) {
		
		String url = "https://www.kamis.or.kr/customer/price/wholesale/catalogue.do?action=daily&regday=" 
		    + regday + "&countycode=" + countycode + "&itemcategorycode=" + itemcategorycode + "&convert_kg_yn=N";
		
		// 이 파트 없으면 크롤링 안되니까 절대 건들지 말 것
		// =================================================================================
		// 크롤링할 해당 사이트의 인증서 유효성 체크 비활성화
		
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
	
	
	@RequestMapping(value = "/SellerProductQNA.se")  // Q&A - 상품문의
	public String sellerProductQNA() {
		
		return "Seller/mypage_productQNA";
	}
	
	@RequestMapping(value = "/SellerProductReview.se")  // Q&A - 상품후기
	public String sellerProductReview() {
		
		return "Seller/mypage_productReview";
	}
	
}
