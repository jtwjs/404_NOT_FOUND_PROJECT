package com.spring.seller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.admin.AccountVO;
import com.spring.boardproduct.BoardProductService;
import com.spring.boardproduct.BoardProductVO;
import com.spring.config.Security.CurrentUser;
import com.spring.config.Security.CustomDetailService;
import com.spring.order.OrderRecordVO;
import com.spring.order.OrderService;

@Controller
public class SellerController {

	@Autowired
	SellerServiceImpl Sellerservice;

	@Autowired
	CustomDetailService SecurityService;
	
	@Autowired
	BoardProductService productService;
	
	@Autowired
	OrderService orderService;
	@RequestMapping(value = "/SellerMyPage.se")
	public String sellerMyPage(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount = Sellerservice.selectOneById(account.getId());
		System.out.println("123123"+account.getId());
		System.out.println("4546"+sellerAccount);
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));
		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			} else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(), "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		ArrayList<BoardProductVO> productList = productService.selectProductListBySellerId(account.getId());
		double product_satis = 0;
		double delivery_satis = 0;
		double avg_satis = 0;
		int size = 0;
		int qnaCount = 0;
		int answerCount = 0;
		double avgAnswer = 0;
		for(int i=0; i<productList.size(); i++) {
			qnaCount += productService.getCountQna(productList.get(i).getBoard_id());
			answerCount += productService.getCountQnaAnswer(productList.get(i).getBoard_id());
			if(productList.get(i).getProduct_satisfaction() != 0 && productList.get(i).getDelivery_satisfaction() != 0) {
				product_satis += productList.get(i).getProduct_satisfaction();
				System.out.println("["+i+"]:"+productList.get(i).getProduct_satisfaction());
				delivery_satis += productList.get(i).getDelivery_satisfaction();
				System.out.println("["+i+"]:"+productList.get(i).getDelivery_satisfaction());
				size++;
			}
		}
		
		product_satis /=size;
		delivery_satis /=size;
		if(qnaCount == 0) {
			avgAnswer = 5.0;
		} else if(answerCount == 0) {
			avgAnswer = 0.5;
		} else {
			avgAnswer = answerAvg(qnaCount,answerCount);
		}
		
		
		if(size  != 0 && product_satis != 0 && delivery_satis != 0) {
			avg_satis = gradeAvg(product_satis, delivery_satis, avgAnswer);
		}
		
		
		
		String avgStarImgSrc = "";
		if(avg_satis == 5.0) {
			avgStarImgSrc = "./resources/Images/Seller/star_5.png";
		}else if(avg_satis == 4.5) {
			avgStarImgSrc = "./resources/Images/Seller/star_4-5.png";
		}else if(avg_satis ==4.0) {
			avgStarImgSrc = "./resources/Images/Seller/star_4.png";
		}else if(avg_satis ==3.5) {
			avgStarImgSrc = "./resources/Images/Seller/star_3-5.png";
		}else if(avg_satis ==3.0) {
			avgStarImgSrc = "./resources/Images/Seller/star_3.png";
		}else if(avg_satis ==2.5) {
			avgStarImgSrc = "./resources/Images/Seller/star_2-5.png";
		}else if(avg_satis ==2.0) {
			avgStarImgSrc = "./resources/Images/Seller/star_2.png";
		}else if(avg_satis ==1.5) {
			avgStarImgSrc = "./resources/Images/Seller/star_1-5.png";
		}else if(avg_satis ==1.0) {
			avgStarImgSrc = "./resources/Images/Seller/star_1.png";
		}else if(avg_satis ==0.5) {
			avgStarImgSrc = "./resources/Images/Seller/star_0-5.png";
		}
		
		ArrayList<OrderRecordVO> todayRequestList = orderService.todayOrderRequestListBySellerId(account.getId());
		int todayAmount = 0;
		for(int i=0; i<todayRequestList.size(); i++) {
			todayAmount += todayRequestList.get(i).getTot_price()*0.95; //5% 수수료
		}
		String strTodayAmount = numberOfDigit(todayAmount);
		strTodayAmount = reverseString(strTodayAmount);
		int regItemCount = productList.size();
		int unanswered = qnaCount - answerCount;
		int todayRequest = todayRequestList.size();
		int salesCount = orderService.salesStatusCount(account.getId());
		int[] countArray = {regItemCount,unanswered,todayRequest,salesCount};
		
		int[] orderHistoryCntArray = {0,0,0,0,0,0,0,0};
		
		ArrayList<OrderRecordVO> orderList = orderService.selectOrderListBySellerId(account.getId());
		for(int i=0; i<orderList.size(); i++) {
			switch(orderList.get(i).getStatus()) {
			case "입금대기중" : orderHistoryCntArray[0]++; break;
			case "상품준비중" : orderHistoryCntArray[1]++; break;
			case "배송준비중" : orderHistoryCntArray[1]++; break;
			case "배송중" : orderHistoryCntArray[2]++; break;
			case "배송완료" : orderHistoryCntArray[3]++; break;
			case "교환신청" : orderHistoryCntArray[4]++; break;
			case "교환완료" : orderHistoryCntArray[5]++; break;
			case "반품신청" : orderHistoryCntArray[6]++; break;
			case "반품완료" : orderHistoryCntArray[7]++; break;
			}
		}
		
		
		model.addAttribute("orderList",orderList);
		model.addAttribute("orderHistoryCntArray",orderHistoryCntArray);
		model.addAttribute("todayAmount",strTodayAmount);
		model.addAttribute("countArray",countArray);
		model.addAttribute("avgStarImgSrc",avgStarImgSrc);
		model.addAttribute("product_satis",product_satis);
		model.addAttribute("delivery_satis",delivery_satis);
		model.addAttribute("avgAnswer",avgAnswer);
		model.addAttribute("avg_satis",avg_satis);
		model.addAttribute("user", sellerAccount);

		return "Seller/mypage_main";
	}
	public static String numberOfDigit(int amount) {
		String str = Integer.toString(amount);
		int count = 0;
		String change_amount = "";
		for(int i=str.length()-1; i>=0; i--) {
			if(count%3 == 0 && count != 0) {
				change_amount += ",";
			}
			change_amount += str.charAt(i);
			count++;
		}
		
		return change_amount;
	}
	
  public static String reverseString(String s){
        return (new StringBuffer(s)).reverse().toString();
    }
	
	
	public double answerAvg(int qnaCount, int answerCount) {
		double value = 0;
		double result = 0;
		value = qnaCount/answerCount;
		if(value == 1) {
			result = 5.0;
		}else if(value <=1.25){
			result = 4.5;
		}else if(value <=1.5) {
			result = 4.0;
		}else if(value <= 1.75) {
			result = 3.5;
		}else if(value <= 2) {
			result = 3.0;
		}else if(value <= 2.5) {
			result = 2.5;
		}else if(value <= 3.0) {
			result  = 2.0;
		}else if(value <= 3.5) {
			result = 1.5;
		}else {
			result = 1.0;
		}
		
		return result;
	}
	
	public double gradeAvg(double product_satis, double delivery_satis, double avgAnswer) {
		double value = (product_satis+delivery_satis+avgAnswer)/3;
		double result = 0;
		if(value == 5 ) {
			result = 5.0;
		}else if(value >=4.5) {
			result = 4.5;
		}else if(value >=4.0) {
			result = 4.0;
		}else if(value >=3.5) {
			result = 3.5;
		}else if(value >=3.0) {
			result = 3.0;
		}else if(value >=2.5) {
			result = 2.5;
		}else if(value >=2.0) {
			result = 2.0;
		}else if(value >=1.5) {
			result = 1.5;
		}else {
			result = 1.0;
		}
		
		return result;
	}

	@RequestMapping(value = "/SellerProductRegister.se") // �긽�뭹�궡�뿭 - �긽�뭹�벑濡�
	public String sellerProductRegister(Model model, @CurrentUser AccountVO account) {

		SellerVO sellerAccount = Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));
		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			} else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(), "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("user", sellerAccount);

		return "Seller/mypage_productRegister";
	}

	@RequestMapping(value = "/SellerProductList.se") // �긽�뭹�궡�뿭 - �긽�뭹�궡�뿭
	public String sellerProductList(Model model, @CurrentUser AccountVO account, BoardProductVO board) {
		SellerVO sellerAccount = Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));
		board.setSeller_id(account.getId());
		ArrayList<BoardProductVO> productList = Sellerservice.selectProductListById(board.getSeller_id());

		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			} else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(), "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("productList", productList);
		model.addAttribute("user", sellerAccount);

		return "Seller/mypage_productList";
	}

	@RequestMapping(value = "/SellerProductModifyForm.se") // �긽�뭹�궡�뿭 - �뙋留ㅺ� �닔�젙
	public String sellerProductModifyForm(Model model, @CurrentUser AccountVO account,
			@RequestParam(value = "board_id", required = true) String board_id) {

		SellerVO sellerAccount = Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));
		BoardProductVO product = Sellerservice.BoardSelectOneByBoardId(board_id);
		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			} else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(), "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("product", product);
		model.addAttribute("user", sellerAccount);
		return "Seller/mypage_productModify";
	}

	@RequestMapping(value = "/SellerProductModify.se")
	public String sellerProductModify() {
		return "redirect:/Seller/mypage_productList";
	}

	@RequestMapping(value = "/SellerOrderStatus.se") // 嫄곕옒�궡�뿭 - 二쇰Ц愿�由�
	public String sellerOrderStatus(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount = Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));
		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			} else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(), "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("user", sellerAccount);
		return "Seller/mypage_orderStatus";
	}

	@RequestMapping(value = "/SellerCalculateManager.se") // 嫄곕옒�궡�뿭 - 嫄곕옒紐⑸줉
	public String sellerCalculateManager(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount = Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));
		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			} else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(), "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("user", sellerAccount);
		return "Seller/mypage_calculateManager";
	}

	@RequestMapping(value = "/SellerMarketPriceInfo.se") // �긽�뭹 �떆�꽭�젙蹂�
	public String sellerMarketPriceInfo(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount = Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));
		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			} else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(), "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("user", sellerAccount);
		return "Seller/mypage_marketPriceInfo";
	}

	// �상품시세정보조히

	@RequestMapping(value = "/SellerMarketPriceInfoSearch.se", method = RequestMethod.GET)
	public String sellerMarketPriceInfoSearch(Model model, String regday, String countycode, String itemcategorycode) {

		String url = "https://www.kamis.or.kr/customer/price/wholesale/catalogue.do?action=daily&regday=" + regday
				+ "&countycode=" + countycode + "&itemcategorycode=" + itemcategorycode + "&convert_kg_yn=N";

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

	@RequestMapping(value = "/SellerProductQNA.se") // Q&A - �긽�뭹臾몄쓽
	public String sellerProductQNA(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount = Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));
		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			} else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(), "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("user", sellerAccount);
		return "Seller/mypage_productQNA";
	}

	@RequestMapping(value = "/SellerProductReview.se") // Q&A - �긽�뭹�썑湲�
	public String sellerProductReview(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount = Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));
		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			} else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(), "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("user", sellerAccount);
		return "Seller/mypage_productReview";
	}

	@RequestMapping(value = "JoinSeller.se", method = RequestMethod.POST)
	public String RegisterSellerAccount(String id, String password, String shopName, String represent, String addrNum,
			String addrRoadName, String addrDetail, String orderReportNum, String name, String telCarrierNum,
			String telAllocationNum, String telDiscretionaryNum, String emailId, String emailAddr, String bankName,
			String bankAccountNum,
			@RequestPart(value = "orderReportImg", required = false) MultipartFile mail_order_report_img) {

		SellerVO seller = new SellerVO();
		seller.setId(id);
		seller.setPassword(password);
		seller.setShopName(shopName);
		seller.setRepresent(represent);
		seller.setAddress(addrNum, addrRoadName, addrDetail);
		seller.setOrderReportNum(orderReportNum);
		seller.setName(name);
		seller.setTel(telCarrierNum, telAllocationNum, telDiscretionaryNum);
		seller.setEmail(emailId, emailAddr);
		seller.setBankAccountNum(bankAccountNum);
		seller.setBankName(bankName);

		System.out.println("seller.getOrderReportImg() : " + seller.getOrderReportImg());
		System.out.println("seller.getOrderReportImgPath() : " + seller.getOrderReportImgPath());

		System.out.println("000");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

		String uploadFolder_mail_order_report_img = "C:\\Project156\\upload/mail_order_report_img"; // 원본 업로드 경로

		seller.setOrderReportImg(imgSave(mail_order_report_img, uploadFolder_mail_order_report_img));

		StringBuilder img_path = new StringBuilder("/img/mail_order_report_img/" + str.replace("-", "/") + "/");
		System.out.println("img_path : " + img_path);

		seller.setOrderReportImgPath(img_path.toString());
		System.out.println("img_path.toString() : " + img_path.toString());

		seller.setTel(telCarrierNum, telAllocationNum, telDiscretionaryNum);
		seller.setEmail(emailId, emailAddr);
		seller.setAddress(addrNum, addrRoadName, addrDetail);

		System.out.println("111");

		System.out.println("img222 : " + seller.getOrderReportImg());
		System.out.println("imgPath222 : " + seller.getOrderReportImgPath());

		System.out.println("222");

		SecurityService.RegisterSellerAccout(seller);

		return "redirect:/JoinSellerComplete.ad";

	}

	@RequestMapping(value = "/profileThumbnail.se", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String profileThumbnail(Model model, MultipartRequest multipartRequest) {
		MultipartFile file = multipartRequest.getFile("imgFile");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String uploadFolder_profile_img = "C:\\Project156\\upload/profile_img";
		String img = imgSave(file, uploadFolder_profile_img);
		System.out.println("img" + img);
		StringBuilder img_path = new StringBuilder("/img/profile_img/" + str.replace("-", "/") + "/");
		String path = img_path.toString();
		return path + "@" + img;
	}

	@RequestMapping(value = "/UpdateSellerAccountForm.se") // 프로필 수정
	public String UpdateSellerAccountForm(Model model, @CurrentUser AccountVO seller) {

		SellerVO sellerAccount = Sellerservice.selectOneById(seller.getId());
		int mailIndex = sellerAccount.getEmail().indexOf("@");
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));
		sellerAccount.setEmailId(sellerAccount.getEmail().substring(0, mailIndex));
		sellerAccount.setEmailAddr(sellerAccount.getEmail().substring(mailIndex + 1));
		sellerAccount.setTelCarrierNum(sellerAccount.getTel().substring(0, 3));
		sellerAccount.setTelAllocationNum(sellerAccount.getTel().substring(3, 7));
		sellerAccount.setTelDiscretionaryNum(sellerAccount.getTel().substring(7, 11));
		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			} else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(), "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("user", sellerAccount);

		return "Seller/mypage_infoModify";
	}

	@RequestMapping(value = "/UpdateSellerAccount.se")
	public String UpdateSellerAccount(String id, String emailId, String name, String emailAddr, String telCarrierNum,
			String telAllocationNum, String telDiscretionaryNum, String bankName, String bankAccountNum,
			@RequestPart(value = "profileImg", required = false) MultipartFile profile_img) throws IOException {
		SellerVO seller = new SellerVO();
		seller.setId(id);
		seller.setTel(telCarrierNum, telAllocationNum, telDiscretionaryNum);
		seller.setEmail(emailId, emailAddr);
		seller.setBankAccountNum(bankAccountNum);
		seller.setBankName(bankName);
		seller.setName(name);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String uploadFolder_profile_img = "C:\\Project156\\upload/profile_img"; // 프로필 이미지 업로드 경로
		if (!profile_img.isEmpty()) {
			seller.setProfileImg(imgSave(profile_img, uploadFolder_profile_img));

			StringBuilder img_path = new StringBuilder("/img/profile_img/" + str.replace("-", "/") + "/");
			seller.setProfileImgPath(img_path.toString());

		} else {
			seller.setProfileImg("no_profile.png");
			seller.setProfileImgPath("/img/common/");
		}

		Sellerservice.UpdateSellerAccount(seller);

		return "redirect:/SellerMyPage.se";

	}

	@RequestMapping(value = "/UpdateSellerPasswordFrom.se")
	public String UpdateSellerPasswordFrom(Model model, @CurrentUser AccountVO seller) {

		SellerVO sellerAccount = Sellerservice.selectOneById(seller.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));

		System.out.println("11seller.getId() : " + sellerAccount.getId());
		System.out.println("11seller.getPassword() : " + sellerAccount.getPassword());

		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			} else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(), "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("user", sellerAccount);

		return "Seller/mypage_passwordModify";
	}

	private String imgSave(MultipartFile imgFile, String uploadFolder) {
		// 저장할 이미지 파일, 저장할 폴더경로
		// 반드시 원본파일을 만들고 난 뒤 사용해야 함

		File uploadPath = getFolder(uploadFolder); // 오늘 날짜로 경로폴더 만들기
		UUID uuid = UUID.randomUUID(); // 파일이름 중복방지를 위하여 랜덤으로 임의의 값 생성
		StringBuilder file_name = new StringBuilder(uuid.toString() + "_" + imgFile.getOriginalFilename()); // 파일 이름 만들기
		File createFile = new File(uploadPath, file_name.toString()); // 저장파일 생성

		try {

			if (checkImageType(createFile)) { // 업로드된 파일이 이미지파일인지 체크
				imgFile.transferTo(createFile); // 파일 저장
			}

		} catch (Exception e) {

		}

		return file_name.toString();
	}

	private File getFolder(String uploadFolder) { // 현재 날짜로 폴더경로 생성

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		File uploadPath = new File(uploadFolder, str.replace("-", File.separator));

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		return uploadPath;
	}

	private boolean checkImageType(File file) { // 파일 이미지 체크

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}

		return false;
	}

	@RequestMapping(value = "/UpdateSellerPassword.se")
	public String UpdateSellerPassword(SellerVO seller) {

		System.out.println("22seller.getId() : " + seller.getId());
		System.out.println("22seller.getPassword() : " + seller.getPassword());

		SecurityService.SellerConfirmPassword(seller);

		return "redirect:/SellerMyPage.se";
	}

	@RequestMapping(value = "/SellerTransactionList.se") // 거래내역 - 거래목록
	public String sellerTransactionList(Model model, @CurrentUser AccountVO account, OrderRecordVO orderRecordVo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		System.out.println("test");
		System.out.println("listCount : " + Sellerservice.getOrderRecordOneByIdListCount(account.getId()));
		String id = account.getId();
		SellerVO sellerAccount = Sellerservice.selectOneById(id);

		int limit = 10;
		int listcount = Sellerservice.getOrderRecordOneByIdListCount(account.getId());
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;

		List<OrderRecordVO> orderRecordList = Sellerservice.getOrderRecordOneByIdList(account.getId(), startrow,
				endrow);
		
		for(int i=0; i<orderRecordList.size(); i++) {
			orderRecordList.get(i).setOrder_date(orderRecordList.get(i).getOrder_date().substring(0,11));
		}

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림 처리
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("orderRecordList", orderRecordList);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		System.out.println("orderRecordlist222 : " + orderRecordList);

		// 주문번호
		model.addAttribute("order_id", orderRecordVo.getOrder_id());
		// 상품명
		model.addAttribute("board_title", orderRecordVo.getBoard_title());

		// 가격
		model.addAttribute("amount", orderRecordVo.getAmount());
		model.addAttribute("price", orderRecordVo.getPrice());

		// 구매일
		model.addAttribute("order_date", orderRecordVo.getOrder_date());

		// 회원 구분
		model.addAttribute("non_member_flag", orderRecordVo.getNon_member_flag());

		// 사이드메뉴 프로필 정보
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));
		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			} else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(), "UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("user", sellerAccount);

		return "Seller/mypage_transactionList";
	}

}
