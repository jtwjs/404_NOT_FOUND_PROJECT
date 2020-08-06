package com.spring.seller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
import com.spring.buyer.CriteriaVO;
import com.spring.buyer.PageMaker;
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
		System.out.println("123123" + account.getId());
		System.out.println("4546" + sellerAccount);
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
		for (int i = 0; i < productList.size(); i++) {
			qnaCount += productService.getCountQna(productList.get(i).getBoard_id());
			answerCount += productService.getCountQnaAnswer(productList.get(i).getBoard_id());
			if (productList.get(i).getProduct_satisfaction() != 0
					&& productList.get(i).getDelivery_satisfaction() != 0) {
				product_satis += productList.get(i).getProduct_satisfaction();
				System.out.println("[" + i + "]:" + productList.get(i).getProduct_satisfaction());
				delivery_satis += productList.get(i).getDelivery_satisfaction();
				System.out.println("[" + i + "]:" + productList.get(i).getDelivery_satisfaction());
				size++;
			}
		}
		if (size != 0) {
			product_satis /= size;
			delivery_satis /= size;
		} else {
			product_satis = 5;
			delivery_satis = 5;
		}
		if (qnaCount == 0) {
			avgAnswer = 5.0;
		} else if (answerCount == 0) {
			avgAnswer = 0.5;
		} else {
			avgAnswer = answerAvg(qnaCount, answerCount);
		}

		if (size != 0 && product_satis != 0 && delivery_satis != 0) {
			avg_satis = gradeAvg(product_satis, delivery_satis, avgAnswer);
		}

		String avgStarImgSrc = "";
		if (avg_satis == 5.0) {
			avgStarImgSrc = "./resources/Images/Seller/stars_5.png";
		} else if (avg_satis == 4.5) {
			avgStarImgSrc = "./resources/Images/Seller/stars_4-5.png";
		} else if (avg_satis == 4.0) {
			avgStarImgSrc = "./resources/Images/Seller/star_4.png";
		} else if (avg_satis == 3.5) {
			avgStarImgSrc = "./resources/Images/Seller/stars_3-5.png";
		} else if (avg_satis == 3.0) {
			avgStarImgSrc = "./resources/Images/Seller/star_3.png";
		} else if (avg_satis == 2.5) {
			avgStarImgSrc = "./resources/Images/Seller/stars_2-5.png";
		} else if (avg_satis == 2.0) {
			avgStarImgSrc = "./resources/Images/Seller/stars_2.png";
		} else if (avg_satis == 1.5) {
			avgStarImgSrc = "./resources/Images/Seller/star_1-5.png";
		} else if (avg_satis == 1.0) {
			avgStarImgSrc = "./resources/Images/Seller/star_1.png";
		} else if (avg_satis == 0.5) {
			avgStarImgSrc = "./resources/Images/Seller/star_0-5.png";
		} else {
			avgStarImgSrc = "./resources/Images/Seller/star_0.png";
		}

		ArrayList<OrderRecordVO> todayRequestList = orderService.todayOrderRequestListBySellerId(account.getId());
		int todayAmount = 0;
		for (int i = 0; i < todayRequestList.size(); i++) {
			todayAmount += todayRequestList.get(i).getTot_price() * 0.95; // 5% 수수료
		}
		String strTodayAmount = numberOfDigit(todayAmount);
		strTodayAmount = reverseString(strTodayAmount);
		int regItemCount = productList.size();
		int unanswered = qnaCount - answerCount;
		int todayRequest = todayRequestList.size();
		int salesCount = orderService.salesStatusCount(account.getId());
		int[] countArray = { regItemCount, unanswered, todayRequest, salesCount };

		int[] orderHistoryCntArray = { 0, 0, 0, 0, 0, 0, 0, 0 };

		ArrayList<OrderRecordVO> orderList = orderService.selectOrderListBySellerId(account.getId());
		for (int i = 0; i < orderList.size(); i++) {
			switch (orderList.get(i).getStatus()) {
			case "입금대기중":
				orderHistoryCntArray[0]++;
				break;
			case "상품준비중":
				orderHistoryCntArray[1]++;
				break;
			case "배송준비중":
				orderHistoryCntArray[1]++;
				break;
			case "배송중":
				orderHistoryCntArray[2]++;
				break;
			case "배송완료":
				orderHistoryCntArray[3]++;
				break;
			case "주문취소중":
				orderHistoryCntArray[4]++;
				break;
			case "주문취소완료":
				orderHistoryCntArray[5]++;
				break;
			case "환불확인중":
				orderHistoryCntArray[6]++;
				break;
			case "환불완료":
				orderHistoryCntArray[7]++;
				break;
			}
		}

		model.addAttribute("orderList", orderList);
		model.addAttribute("orderHistoryCntArray", orderHistoryCntArray);
		model.addAttribute("todayAmount", strTodayAmount);
		model.addAttribute("countArray", countArray);
		model.addAttribute("avgStarImgSrc", avgStarImgSrc);
		model.addAttribute("product_satis", product_satis);
		model.addAttribute("delivery_satis", delivery_satis);
		model.addAttribute("avgAnswer", avgAnswer);
		model.addAttribute("avg_satis", avg_satis);
		model.addAttribute("user", sellerAccount);

		return "Seller/mypage_main";
	}

	public static String numberOfDigit(int amount) {
		String str = Integer.toString(amount);
		int count = 0;
		String change_amount = "";
		for (int i = str.length() - 1; i >= 0; i--) {
			if (count % 3 == 0 && count != 0) {
				change_amount += ",";
			}
			change_amount += str.charAt(i);
			count++;
		}

		return change_amount;
	}

	public static String reverseString(String s) {
		return (new StringBuffer(s)).reverse().toString();
	}

	public double answerAvg(int qnaCount, int answerCount) {
		double value = 0;
		double result = 0;
		value = qnaCount / answerCount;
		if (value == 1) {
			result = 5.0;
		} else if (value <= 1.25) {
			result = 4.5;
		} else if (value <= 1.5) {
			result = 4.0;
		} else if (value <= 1.75) {
			result = 3.5;
		} else if (value <= 2) {
			result = 3.0;
		} else if (value <= 2.5) {
			result = 2.5;
		} else if (value <= 3.0) {
			result = 2.0;
		} else if (value <= 3.5) {
			result = 1.5;
		} else {
			result = 1.0;
		}

		return result;
	}

	public double gradeAvg(double product_satis, double delivery_satis, double avgAnswer) {
		double value = (product_satis + delivery_satis + avgAnswer) / 3;
		double result = 0;
		if (value == 5) {
			result = 5.0;
		} else if (value >= 4.5) {
			result = 4.5;
		} else if (value >= 4.0) {
			result = 4.0;
		} else if (value >= 3.5) {
			result = 3.5;
		} else if (value >= 3.0) {
			result = 3.0;
		} else if (value >= 2.5) {
			result = 2.5;
		} else if (value >= 2.0) {
			result = 2.0;
		} else if (value >= 1.5) {
			result = 1.5;
		} else {
			result = 1.0;
		}

		return result;
	}

	@RequestMapping(value = "/SellerProductRegister.se") // �긽�뭹�궡�뿭 - �긽�뭹�벑濡�
	public String sellerProductRegister(Model model, @CurrentUser AccountVO account) {

		SellerVO sellerAccount = Sellerservice.selectOneById(account.getId()); //
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10)); //
		try {
			if (sellerAccount.getProfileImg() == null && sellerAccount.getProfileImgPath() == null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png", "UTF-8")); //
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
	public String sellerProductList(Model model, @CurrentUser AccountVO account, BoardProductVO board, CriteriaVO cri,
			@RequestParam(value = "startDate", required = false, defaultValue = "20000101") String startDate,
			@RequestParam(value = "endDate", required = false, defaultValue = "") String endDate) {
		Date date = new Date();
		date = new Date(date.getTime() + (1000 * 60 * 60 * 24 * 1));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		if (endDate.equals("") || endDate == null) {
			endDate = simpleDateFormat.format(date);
		}

		int rowStart = cri.getRowStart();
		int rowEnd = cri.getRowEnd();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println("startDate:"+startDate);
		System.out.println("endDate:"+endDate);
		pageMaker.setTotalCount(productService.selectProductListCountBySellerId(account.getId(), startDate, endDate));
		System.out.println("Count"+productService.selectProductListCountBySellerId(account.getId(), startDate, endDate));

		SellerVO sellerAccount = Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0, 10));
		board.setSeller_id(account.getId());
		ArrayList<BoardProductVO> productList = productService.selectProductListBySellerId2(account.getId(), rowStart,
				rowEnd, startDate, endDate);

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
		for (int i = 0; i < productList.size(); i++) {
			try {
				productList.get(i)
						.setThumbnail_thum(URLEncoder.encode(productList.get(i).getThumbnail_thum(), "UTF-8"));
				productList.get(i).setThumbnail_thum_path(
						URLEncoder.encode(productList.get(i).getThumbnail_thum_path(), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute("currentPage", cri.getPage());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("productList", productList);
		model.addAttribute("user", sellerAccount);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
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
		
		
		String str= product.getProduct_weight();
		String intWeight = str.replaceAll("[^0-9]","");
		String strWeight = str.replaceAll("[0-9]","");
		
		model.addAttribute("intWeight",intWeight);
		model.addAttribute("strWeight",strWeight);
		model.addAttribute("product", product);
		model.addAttribute("user", sellerAccount);
		return "Seller/mypage_productModify";
	}

	@RequestMapping(value = "/SellerProductModify.se")
	public String sellerProductModify() {
		return "redirect:/Seller/mypage_productList";
	}

	@RequestMapping(value = "/SellerOrderStatus.se") // 嫄곕옒�궡�뿭 - 二쇰Ц愿�由�
	public String sellerOrderStatus(Model model, @CurrentUser AccountVO account, 
			@RequestParam(value="status", required=false)String[] status, 
			@RequestParam(value="order_payment", required=false)String[] order_payment, 
			@RequestParam(value="start_date", required=false, defaultValue="1980-01-01")String start_date_input, 
			@RequestParam(value="end_date", required=false)String end_date_input, 
			@RequestParam(value="page_num", required=false, defaultValue="1")int page_num, 
			@RequestParam(value="page_amount", required=false, defaultValue="20")int page_amount) {
		
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
		
		String end_date = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		if(end_date_input == null || end_date_input == "") {
			Date date = new Date();
			end_date_input = format.format(date);
		}
		
		end_date = end_date_input;
		
		ArrayList<OrderRecordVO> vo_list = Sellerservice.getOrderRecordListSearch(
				account.getId(), status, order_payment, start_date_input, end_date, page_num, page_amount);
		int vo_count = Sellerservice.getOrderRecordListSearchCount(
				account.getId(), status, order_payment, start_date_input, end_date);
		
		if(vo_list.size() != 0) {
			for(int i = 0; i < vo_list.size(); i++) {
				vo_list.get(i).setOrder_date(vo_list.get(i).getOrder_date().substring(0, 10));
			}
		}
		
		if(status != null) {			
            StringBuilder status_data = new StringBuilder();
			
			for(int i = 0; i < status.length; i++) {
				status_data.append(status[i]);
				
				if(i != status.length-1) {
					status_data.append(",");
				}
			}
			
			model.addAttribute("status_data", status_data.toString());
		}
		
		if(order_payment != null) {
			StringBuilder payment_data = new StringBuilder();
			
			for(int i = 0; i < order_payment.length; i++) {
				payment_data.append(order_payment[i]);
				
				if(i != order_payment.length-1) {
					payment_data.append(",");
				}
			}
			
			model.addAttribute("payment_data", payment_data.toString());
		}
		

		model.addAttribute("user", sellerAccount);
		model.addAttribute("start_date", start_date_input);
		model.addAttribute("end_date", end_date);
		model.addAttribute("vo_list", vo_list);
		model.addAttribute("vo_count", vo_count);
		model.addAttribute("PageMaker", new com.spring.util.PageMaker(page_num, page_amount, vo_count));
		
		return "Seller/mypage_orderStatus";
	}
	
	@GetMapping(value="GetOrderReceipt.se")
	@ResponseBody
	public void getOrderReceipt(HttpServletRequest request, HttpServletResponse response, 
			String order_id, String board_id) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		OrderRecordVO vo = Sellerservice.getOrderReceipt(order_id, board_id);
		
		int save_point = (int)((vo.getPrice() * vo.getAmount()) / 10);
		int totPrice = vo.getPrice() * vo.getAmount();
		
		JSONObject resultObj = new JSONObject();
		
		resultObj.put("order_id", vo.getOrder_id());
		resultObj.put("buyer_id", vo.getBuyer_id());
		resultObj.put("status", vo.getStatus());
		resultObj.put("buyer_phone", vo.getBuyer_phone());
		resultObj.put("order_address", vo.getOrder_address());
		resultObj.put("order_name", vo.getOrder_name());
		resultObj.put("order_phone", vo.getOrder_phone());
		resultObj.put("order_delivery", vo.getOrder_delivery());
		resultObj.put("order_invoicenum", vo.getOrder_invoicenum());
		resultObj.put("price", vo.getPrice());
		resultObj.put("delivery_price", vo.getDelivery_price());
		resultObj.put("save_point", save_point);
		resultObj.put("use_point", vo.getUse_point());
		resultObj.put("buyer_name", vo.getBuyer_name());
		resultObj.put("order_payment", vo.getOrder_payment());
		resultObj.put("order_account", vo.getOrder_account());
		resultObj.put("amount", vo.getAmount());
		resultObj.put("totPrice", totPrice);

		Date orderDate = new Date();
		SimpleDateFormat orderDateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
		String orderDateStr = orderDateFormat.format(orderDate);
		orderDateStr.replace("AM", "오전");
		orderDateStr.replace("PM", "오후");
		resultObj.put("order_date", vo.getOrder_date());

		out.println(resultObj.toString());
		
		out.flush();
	}

	@RequestMapping(value = "/SellerCalculateManager.se") // 嫄곕옒�궡�뿭 - 嫄곕옒紐⑸줉
	public String sellerCalculateManager(Model model, @CurrentUser AccountVO account,
			CriteriaVO cri,@RequestParam(value="startDate", required=false, defaultValue="19800101")String startDate,
			@RequestParam(value="endDate", required=false, defaultValue ="")String endDate)throws Exception {
		
		Date date = new Date();
		date = new Date(date.getTime()+(1000*60*60*24*1));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		if(endDate.equals("") || endDate == null) {
			endDate = simpleDateFormat.format(date);
		}
		
		int rowStart = cri.getRowStart();
		int rowEnd = cri.getRowEnd();
		ArrayList<OrderRecordVO> list = orderService.selectOrderListGroupByDate(account.getId(), rowStart, rowEnd, startDate, endDate);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(orderService.selectCountGroupByDate(account.getId(), startDate, endDate));
		
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
		
		for(int i=0; i<list.size();i++) {
			int commission = (int)(Integer.parseInt(list.get(i).getDate_tot_price())*0.05);
			int calculate = (Integer.parseInt(list.get(i).getDate_tot_price())-commission);
			String changeCommision = numberOfDigit(commission);
			String changeCalculate = numberOfDigit(calculate);
			String changeTotPrice = numberOfDigit(Integer.parseInt(list.get(i).getDate_tot_price()));
			changeCommision = reverseString(changeCommision);
			changeCalculate = reverseString(changeCalculate);
			changeTotPrice = reverseString(changeTotPrice);
			list.get(i).setDate_tot_price(changeTotPrice);
			list.get(i).setCommission(changeCommision);
			list.get(i).setCalculate(changeCalculate);
		}
		
		model.addAttribute("currentPage", cri.getPage());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("orderList", list);
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
		CriteriaVO cri,@RequestParam(value="startDate", required=false, defaultValue="19800101")String startDate,
		@RequestParam(value="endDate", required=false, defaultValue ="")String endDate)throws Exception{
		Date date = new Date();
		date = new Date(date.getTime()+(1000*60*60*24*1));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		if(endDate.equals("") || endDate == null) {
			endDate = simpleDateFormat.format(date);
		}
		System.out.println("endDate"+endDate);
		
		String id = account.getId();
		SellerVO sellerAccount = Sellerservice.selectOneById(id);
		int rowStart = cri.getRowStart();
		int rowEnd = cri.getRowEnd();
		

		ArrayList<OrderRecordVO> orderRecordList = Sellerservice.getOrderRecordOneByIdList(account.getId(), rowStart,
				rowEnd,startDate,endDate);
		
		for(int i=0; i<orderRecordList.size(); i++) {
			System.out.println("["+i+"]:"+ orderRecordList.get(i).getBoard_id());
			orderRecordList.get(i).setOrder_date(orderRecordList.get(i).getOrder_date().substring(0,10));
			orderRecordList.get(i).setThumbnail_thum(URLEncoder.encode(orderRecordList.get(i).getThumbnail_thum(), "UTF-8"));
			orderRecordList.get(i).setThumbnail_thum_path(URLEncoder.encode(orderRecordList.get(i).getThumbnail_thum_path(), "UTF-8"));
			String strPrice = numberOfDigit(orderRecordList.get(i).getTot_price());
			strPrice = reverseString(strPrice);
			orderRecordList.get(i).setStr_tot_price(strPrice);
		
			}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(Sellerservice.getOrderRecordOneByIdListCount(account.getId(), startDate, endDate));


	
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
		model.addAttribute("currentPage", cri.getPage());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("orderRecordList", orderRecordList);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);

		return "Seller/mypage_transactionList";
	}

}
