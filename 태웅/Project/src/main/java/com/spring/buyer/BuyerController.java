package com.spring.buyer;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.file.Files;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.admin.AccountVO;
import com.spring.boardproduct.BoardProductService;
import com.spring.boardproduct.BoardProductVO;
import com.spring.boardproduct.BoardReviewVO;
import com.spring.config.Security.CurrentUser;
import com.spring.config.Security.CustomDetailService;
import com.spring.order.OrderRecordVO;
import com.spring.order.OrderService;

@Controller
public class BuyerController {

	@Autowired
	BuyerService buyerService;

	@Autowired
	CustomDetailService SecurityService;

	@Autowired
	BoardProductService productService;
	
	@Autowired
	OrderService orderService;
	
	

	@RequestMapping(value = "/BuyerMyPage.by")
	public String buyerMyPage(Model model, @CurrentUser AccountVO account) {
		int exp = 0;
		int rest_exp = 0;
		ArrayList<OrderRecordVO> list = orderService.orderListAllById(account.getId());
		for(int i=0; i<list.size(); i++) {
			exp += list.get(i).getAmount() * list.get(i).getPrice();
		}
		
		exp /= 10;
		System.out.println("exp1="+exp);
		char grade;
		if(exp < 2000) {
			grade = '1';
			rest_exp = 2001 - exp;
		} else if (exp < 10001) {
			grade = '2';
			rest_exp = 10001 - exp;
		} else if (exp < 100001) {
			grade = '3';
			rest_exp = 100001 - exp;
		} else if (exp < 200001) {
			grade = '4';
			rest_exp = 200001 - exp;
		} else if (exp < 500001) {
			grade = '5';
			rest_exp = 500001 - exp;
		} else if (exp < 1000001) {
			grade = '6';
			rest_exp = 1000001 - exp;
		} else if (exp < 2000001) {
			grade = '7';
			rest_exp = 2000001 - exp;
		} else {
			grade = '8';
		}
		String changeRest_exp = numberOfDigit(rest_exp);
		changeRest_exp = reverseString(changeRest_exp);
		
		BuyerVO buyer = new BuyerVO();
		buyer.setId(account.getId());
		buyer.setGrade(grade);
		buyerService.BuyerGradeSetting(buyer);
		
		
		BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
		buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0, 10));
		buyerAccount.setJoinDate(buyerAccount.getJoinDate().substring(0, 10));
		try {
			if(buyerAccount.getProfileImg() == null&&buyerAccount.getProfileImgPath() ==null) {
				buyerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				buyerAccount.setProfileImg(URLEncoder.encode(buyerAccount.getProfileImg(),"UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode(buyerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int reviewCount = productService.countReviewById(account.getId());
		
		model.addAttribute("reveiwCount",reviewCount);
		model.addAttribute("rest_exp",changeRest_exp);
		model.addAttribute("user", buyerAccount);
		return "Buyer/mypage_main";
	}

	@RequestMapping(value = "/BuyerMyPageOrderList.by") 
	public String buyerMyPageOrderList(Model model, @CurrentUser AccountVO account,
			CriteriaVO cri, String startDate, String endDate)throws Exception {
		BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
		buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0, 10));
		
		String buyer_id = account.getId();
		int rowStart = cri.getRowStart();
		int rowEnd = cri.getRowEnd();
		ArrayList<OrderRecordVO> list = orderService.selectOrderListById(buyer_id, rowStart, rowEnd);
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setOrder_date(list.get(i).getOrder_date().substring(0,10));
			list.get(i).setThumbnail_thum(URLEncoder.encode(list.get(i).getThumbnail_thum(), "UTF-8"));
			list.get(i).setThumbnail_thum_path(URLEncoder.encode(list.get(i).getThumbnail_thum_path(), "UTF-8"));
			
			}
		buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0, 10));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(orderService.listCount(buyer_id));
		
		try {
			if(buyerAccount.getProfileImg() == null&&buyerAccount.getProfileImgPath() ==null) {
				buyerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				buyerAccount.setProfileImg(URLEncoder.encode(buyerAccount.getProfileImg(),"UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode(buyerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		model.addAttribute("currentPage", cri.getPage());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("orderList",list);
		model.addAttribute("user", buyerAccount);
		return "Buyer/mypage_orderList";
	}

	@RequestMapping(value = "/BuyerMyPageWishList.by") 
    public String buyerMyPageWishList(Model model, @CurrentUser AccountVO account,
    		@RequestParam(value="buyer_id", required = false)String buyer_id, 
		    @RequestParam(value="sort_list", required = false, defaultValue="1")int sort_list, 
		    @RequestParam(value="page_num", required = false, defaultValue="1")int page_num, 
		    @RequestParam(value="page_amount", required = false, defaultValue="30")int page_amount) {
    	    	
    	BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
    	ArrayList<WishListVO> wishList = null;
    	
    	int wishList_size = 0;
    	
    	if(account.getId() != null) {
    		wishList = buyerService.selectWishList(account.getId(), sort_list, page_num, page_amount);
    		wishList_size = buyerService.selectWishListCountOneById(account.getId());
    	}
    	try {
			if(buyerAccount.getProfileImg() == null&&buyerAccount.getProfileImgPath() ==null) {
				buyerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				buyerAccount.setProfileImg(URLEncoder.encode(buyerAccount.getProfileImg(),"UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode(buyerAccount.getProfileImgPath(), "UTF-8"));
			}
    	} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	
    	model.addAttribute("pageMaker", new com.spring.util.PageMaker(page_num, page_amount, wishList_size));
    	model.addAttribute("sort_list", sort_list);
    	model.addAttribute("wishList", wishList);    
    	
    	System.out.println("wishList_size : " + wishList_size);
    	System.out.println("wishList : " + wishList);
    	
		
    	buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0,10));    	    	
    	model.addAttribute("user",buyerAccount);
    	return "Buyer/mypage_wishList";
    }
	
    
    
    
    @RequestMapping("/DeleteWishList.by")
	public String deleteWishList(@RequestParam(value = "wish_id", required = true) String wish_id, HttpSession session,
			HttpServletResponse response) throws Exception {

		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("wish_id", wish_id);
		int res = buyerService.deleteWishList(hashmap);
		
		System.out.println("res : " + res);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res == 1) {
			writer.write("<script>alert('삭제 성공!!');" + "location.href='./BuyerMyPageWishList.by';</script>");
		} else {
			writer.write("<script>alert('삭제 실패!!');" + "location.href='./BuyerMyPageWishList.by';</script>");
		}
		return null;
	}
    
	@RequestMapping(value = "/BuyerMyPageRecentlyView.by") // �굹�쓽 �눥�븨 �솢�룞 - 理쒓렐 蹂� �긽�뭹
	public String buyerMyPageRecentlyView(Model model,
			@CookieValue(value = "AccountRecentlyProduct", required = false) Cookie cookie,
			@CurrentUser AccountVO account, CriteriaVO cri) {
		BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
		buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0, 10));
		ArrayList<BoardProductVO> recentList = new ArrayList<>();
		int rowStart = cri.getRowStart();
		int rowEnd = cri.getRowEnd();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
				
		String[] recentArray = null;
		if(cookie !=null) {
		int index1 = cookie.getValue().indexOf("/");
		String str = cookie.getValue().substring(index1 + 1);
		recentArray = str.split("/");
		int maxCount = recentArray.length;
		int left = 0;
		int right = maxCount -1;
		String temp = "";
		for(int i=0; i<maxCount/2;i++) {
			temp = recentArray[left];
			recentArray[left] = recentArray[right];
			recentArray[right] = temp;
			
			left++;
			right--;
		}
		
		if(recentArray.length < rowEnd) {
			rowEnd = recentArray.length;
		}
		for (int i = rowStart-1; i < rowEnd; i++) {
			BoardProductVO product = productService.getBoardProductVO(recentArray[i]);
			try {
				product.setThumbnail_thum(URLEncoder.encode(product.getThumbnail_thum(), "UTF-8"));
				product.setThumbnail_thum_path(URLEncoder.encode(product.getThumbnail_thum_path(),"UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			recentList.add(product);
		}
		}
		if(recentArray == null) {
			pageMaker.setTotalCount(0);
		}else {
			pageMaker.setTotalCount(recentArray.length);	
		}
		
		try {
			if(buyerAccount.getProfileImg() == null&&buyerAccount.getProfileImgPath() ==null) {
				buyerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				buyerAccount.setProfileImg(URLEncoder.encode(buyerAccount.getProfileImg(),"UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode(buyerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("currentPage", cri.getPage());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", recentList);
		model.addAttribute("user", buyerAccount);
		return "Buyer/mypage_recentlyView";
	}

	@RequestMapping(value = "/BuyerMyPageRecentlyView_deleteCheck.by", method = RequestMethod.POST)
	public String RecentView_deleteCheck(Model model, @CurrentUser AccountVO account,
			@CookieValue(value = "AccountRecentlyProduct", required = false) Cookie cookie,
			@RequestParam("ck_item")String[] items, HttpServletResponse response) {
		String result ="";
		int index = 0;
		int index2 = 0;
		System.out.println("items길이:"+items.length);
		for(int i = 0; i< items.length; i++) {
			System.out.println("items["+i+"] :"+items[i]);
			
			if(result.equals("")) {
				System.out.println("원래쿠키값:"+cookie.getValue());
				index = cookie.getValue().indexOf("/"+items[i].toString());
				int size = ("/"+items[i].toString()).length(); 
				System.out.println("size: "+size);
				String front = cookie.getValue().substring(5,index);
				String back = cookie.getValue().substring(index+size);
				index2 = back.indexOf("/");
				if(index2 != -1 ) {
					result = front+back;
				}else {
					result = front;
				}
			}else {
				index = result.indexOf("/"+items[i].toString()); 
				String front = result.substring(0,index);
				int size = ("/"+items[i].toString()).length();
				System.out.println("size: "+size);
				String back = result.substring(index+size);
				index2 = back.indexOf("/");
				if(index2 != -1) {
					result = front+back;
				} else {
					result = front;
				}
			}
			System.out.println("result~:"+result);
			
			
		}
		result = "Start"+result;
		System.out.println("결과값:"+result);
		
		if(result.equals("Start")) {
			cookie.setValue(result);
			cookie.setMaxAge(0);
		}else {
			cookie.setValue(result);
		}
		response.addCookie(cookie);
		System.out.println("cookie:"+ cookie.getValue());
		return "redirect:/BuyerMyPageRecentlyView.by";
	}

	@RequestMapping(value = "/BuyerMyPageReview.by") 
	public String buyerMyPageReview(Model model, @CurrentUser AccountVO account,
			CriteriaVO cri) {
		BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
		buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0, 10));
		int rowStart = cri.getRowStart();
		int rowEnd = cri.getRowEnd();
		ArrayList<BoardReviewVO> list = productService.boardReviewListAllById(account.getId(), rowStart, rowEnd);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(productService.countReviewById(account.getId()));
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		try {
			if(buyerAccount.getProfileImg() == null&&buyerAccount.getProfileImgPath() ==null) {
				buyerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				buyerAccount.setProfileImg(URLEncoder.encode(buyerAccount.getProfileImg(),"UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode(buyerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		for(int i=0; i<list.size(); i++ ) {
			
			switch(Double.toString(list.get(i).getSatisfaction())){
			case "5.0": list.get(i).setSatisfaction_img("./resources/Images/Home/stars_5.png");
						break;
			case "4.5": list.get(i).setSatisfaction_img("./resources/Images/Home/stars_4-5.png");
						break;
			case "4.0": list.get(i).setSatisfaction_img("./resources/Images/Home/star_4.png");
						break;
			case "3.5": list.get(i).setSatisfaction_img("./resources/Images/Home/stars_3-5.png");
						break;
			case "3.0": list.get(i).setSatisfaction_img("./resources/Images/Home/star_3.png");
						break;
			case "2.5": list.get(i).setSatisfaction_img("./resources/Images/Home/stars_2-5.png");
						break;
			case "2.0": list.get(i).setSatisfaction_img("./resources/Images/Home/stars_2.png");
						break;
			case "1.5": list.get(i).setSatisfaction_img("./resources/Images/Home/star_1-5.png");
						break;
			case "1.0": list.get(i).setSatisfaction_img("./resources/Images/Home/star_1.png");
						break;
			default: list.get(i).setSatisfaction_img("./resources/Images/Home/star_0-5.png");
						break;
			}
			
			switch(Double.toString(list.get(i).getDelivery_satisfaction())){
			case "5.0": list.get(i).setDelivery_satisfaction_img("./resources/Images/Home/stars_5.png");
						break;
			case "4.5": list.get(i).setDelivery_satisfaction_img("./resources/Images/Home/stars_4-5.png");
						break;
			case "4.0": list.get(i).setDelivery_satisfaction_img("./resources/Images/Home/star_4.png");
						break;
			case "3.5": list.get(i).setDelivery_satisfaction_img("./resources/Images/Home/stars_3-5.png");
						break;
			case "3.0": list.get(i).setDelivery_satisfaction_img("./resources/Images/Home/star_3.png");
						break;
			case "2.5": list.get(i).setDelivery_satisfaction_img("./resources/Images/Home/stars_2-5.png");
						break;
			case "2.0": list.get(i).setDelivery_satisfaction_img("./resources/Images/Home/stars_2.png");
						break;
			case "1.5": list.get(i).setDelivery_satisfaction_img("./resources/Images/Home/star_1-5.png");
						break;
			case "1.0": list.get(i).setDelivery_satisfaction_img("./resources/Images/Home/star_1.png");
						break;
			default: list.get(i).setDelivery_satisfaction_img("./resources/Images/Home/star_0-5.png");
						break;
			}
			
			
				try {
					String reg_date = format.format(list.get(i).getRegister_date());
					list.get(i).setFormat_reg_date(reg_date);
					list.get(i).setReview_img_path(URLEncoder.encode(list.get(i).getReview_img_path(),"UTF-8"));
					list.get(i).setReview_img_name(URLEncoder.encode(list.get(i).getReview_img_name(), "UTF-8"));
					
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
		}
		
		

		
		
		model.addAttribute("currentPage", cri.getPage());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("reviewList", list);
		model.addAttribute("user", buyerAccount);
		
		return "Buyer/mypage_review";
	}
	
	@RequestMapping(value = "/BuyerMyPageReviewWrite.by") 
	public String buyerMyPageReviewWrite(Model model, @CurrentUser AccountVO account,
			CriteriaVO cri, @RequestParam(value="startDate", required=false, defaultValue="19800101")String startDate,
			@RequestParam(value="endDate", required=false, defaultValue ="")String endDate) {
		System.out.println("startDate"+startDate);
		System.out.println("endDate"+endDate);
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		if(endDate.equals("") || endDate == null) {
			endDate = simpleDateFormat.format(date);
		}
		System.out.println("endDate"+endDate);
		
		BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
		buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0, 10));
		try {
			if(buyerAccount.getProfileImg() == null&&buyerAccount.getProfileImgPath() ==null) {
				buyerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				buyerAccount.setProfileImg(URLEncoder.encode(buyerAccount.getProfileImg(),"UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode(buyerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int rowStart = cri.getRowStart();
		int rowEnd = cri.getRowEnd();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(orderService.listCount(account.getId()));
		ArrayList<OrderRecordVO> list = orderService.selectOrderListById(account.getId(), rowStart, rowEnd);
		
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println("test1 Cont");
		if(list.size() != 0) {
		System.out.println(list.size());
		}else {
			System.out.println("사이즈 0");
		}
		
		for(int i =0; i<list.size(); i++) {
			if(productService.checkReview(list.get(i).getBoard_id(), account.getId(), list.get(i).getOrder_id()) == 0) {
				list.get(i).setReviewCheck(true);
			} else {
				list.get(i).setReviewCheck(false);
			}
			try {
				list.get(i).setThumbnail_thum(URLEncoder.encode(list.get(i).getThumbnail_thum(), "UTF-8"));
				list.get(i).setThumbnail_thum_path(URLEncoder.encode(list.get(i).getThumbnail_thum_path(), "UTF-8"));
				list.get(i).setOrder_date(list.get(i).getOrder_date().substring(0,11));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("currentPage", cri.getPage());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("orderList", list);
		model.addAttribute("user", buyerAccount);
		return "Buyer/mypage_review_write";
	}
	
	@RequestMapping(value = "/BuyerMyPageReviewWriteForm.by")
	public String buyerMyPageReviewWrtieForm(Model model, @CurrentUser AccountVO account,
			@RequestParam("board_id")String board_id,@RequestParam("order_id")String order_id) {
		BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
		try {
			if(buyerAccount.getProfileImg() == null&&buyerAccount.getProfileImgPath() ==null) {
				buyerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				buyerAccount.setProfileImg(URLEncoder.encode(buyerAccount.getProfileImg(),"UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode(buyerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		BoardProductVO product = productService.getBoardProductVO(board_id);
		try {
			product.setThumbnail_thum_path(URLEncoder.encode(product.getThumbnail_thum_path(), "UTF-8"));
			product.setThumbnail_thum(URLEncoder.encode(product.getThumbnail_thum(),"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("order_id",order_id);
		model.addAttribute("user",buyerAccount);
		model.addAttribute("item",product);
		return "Buyer/mypage_review_write_form";
	}
	
	@RequestMapping(value = "/BuyerMyPageReviewWriteRegist", method = RequestMethod.POST)
	public String buyerMyPageReviewWriteRegist(@CurrentUser AccountVO account,BoardReviewVO vo) {
		
		BoardProductVO product = productService.getBoardProductVO(vo.getBoard_id()); 
		int review_num = productService.getReviewTotNum() + 1;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String str = sdf.format(date);
    	
    	StringBuilder review_id = new StringBuilder(
    			str + "-" + review_num);
    	vo.setBuyer_id(account.getId());
    	vo.setReview_num(review_num);
    	vo.setReview_id(review_id.toString());
    	vo.setReview_img_name(product.getThumbnail_thum());
    	vo.setReview_img_path(product.getThumbnail_thum_path());
		
    	
    	System.out.println("상품점수"+vo.getSatisfaction());
    	System.out.println("배송점수"+vo.getDelivery_satisfaction());
		
		productService.insertReview(vo);
		return "redirect:BuyerMyPageReviewWrite.by";
	}
	
	
	@RequestMapping(value = "/BuyerMyPageProductQna.by")
	public String buyerMyPageProductQna(Model model, @CurrentUser AccountVO account) {
		BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
		buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0, 10));
		try {
			if(buyerAccount.getProfileImg() == null&&buyerAccount.getProfileImgPath() ==null) {
				buyerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				buyerAccount.setProfileImg(URLEncoder.encode(buyerAccount.getProfileImg(),"UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode(buyerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("user", buyerAccount);
		return "Buyer/mypage_productQna";
	}

	@RequestMapping(value = "/BuyerMyPageServiceQna.by")
	public String buyerMyPageServiceQna(Model model, @CurrentUser AccountVO account) {
		BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
		buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0, 10));
		try {
			if(buyerAccount.getProfileImg() == null&&buyerAccount.getProfileImgPath() ==null) {
				buyerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				buyerAccount.setProfileImg(URLEncoder.encode(buyerAccount.getProfileImg(),"UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode(buyerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("user", buyerAccount);
		return "Buyer/mypage_serviceQna";
	}

	// +게시판 목록 조회
	@RequestMapping(value = "/BuyerMyPageSavePoint.by") // 적립금
	public String buyerMyPageSavePoint(Model model, @CurrentUser AccountVO account,
			@RequestParam("status") String status, CriteriaVO cri) throws Exception {

		String id = account.getId();
		int rowStart = cri.getRowStart();
		int rowEnd = cri.getRowEnd();
		ArrayList<SavePointVO> pointList = buyerService.savePointListAll(id, status, rowStart, rowEnd);
		
		BuyerVO buyerAccount = buyerService.selectOneById(id);
		buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0, 10));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(buyerService.listCount(id, status));

		for (int i = 0; i < pointList.size(); i++) {
			int contentIndex = pointList.get(i).getContent().indexOf('+');
			pointList.get(i).setContentTitle(pointList.get(i).getContent().substring(0, contentIndex));
			pointList.get(i).setContentDetail(pointList.get(i).getContent().substring(contentIndex + 1));
			pointList.get(i).setApplicationDate(pointList.get(i).getApplicationDate().substring(0, 11));
			
		}
		try {
			if(buyerAccount.getProfileImg() == null&&buyerAccount.getProfileImgPath() ==null) {
				buyerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				buyerAccount.setProfileImg(URLEncoder.encode(buyerAccount.getProfileImg(),"UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode(buyerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		model.addAttribute("currentPage", cri.getPage());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("pointList", pointList);
		model.addAttribute("condition", status);
		model.addAttribute("user", buyerAccount);
		return "Buyer/mypage_savePoint";

	}

	@RequestMapping(value = "/BuyerMyPageMyGrade.by") // 나의 등급
	public String buyerMyPageMyGrade(Model model, @CurrentUser AccountVO account) {
		BuyerVO buyerAccount = buyerService.selectOneById(account.getId());
		buyerAccount.setLoginDate(buyerAccount.getLoginDate().substring(0, 10));
		try {
			if(buyerAccount.getProfileImg() == null&&buyerAccount.getProfileImgPath() ==null) {
				buyerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				buyerAccount.setProfileImg(URLEncoder.encode(buyerAccount.getProfileImg(),"UTF-8"));
				buyerAccount.setProfileImgPath(URLEncoder.encode(buyerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int price = 0;
		int exp = 0;
		int cumulative_amount = 0;
		ArrayList<OrderRecordVO> list = orderService.orderListAllById(account.getId());
		for(int i=0; i<list.size(); i++) {
			price = list.get(i).getAmount() * list.get(i).getPrice();
			exp += price;
		}
		cumulative_amount = exp; 
		exp /= 10;
		
		String change_cumulative_amount = numberOfDigit(cumulative_amount);
		String change_exp = numberOfDigit(exp);
		
		change_cumulative_amount = reverseString(change_cumulative_amount);
		change_exp = reverseString(change_exp);
		
		
		
		buyerAccount.setCumulative_amount(change_cumulative_amount);
		buyerAccount.setGrade_exp(change_exp);
		model.addAttribute("user", buyerAccount);
		return "Buyer/mypage_grade";
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

	@GetMapping(value = "/WishListCheck.by")
    @ResponseBody
    public void wishListCheck(HttpServletRequest request, HttpServletResponse response, 
    		String board_id, String buyer_id) throws IOException {
    	
    	System.out.println(board_id);
    	System.out.println(buyer_id);
    	
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
    	
        if(buyerService.getWishListOverlapCheck(board_id, buyer_id) != 0) {
        	out.println("1");
        	
        }
        
        out.flush();
        
    }
    
    
    @RequestMapping(value = "/AddWishList.by", method = RequestMethod.GET, 
            produces="application/json; charset=utf-8")
    @ResponseBody
    public void addWishList(HttpServletRequest request, HttpServletResponse response, 
    		String board_id, String buyer_id, String title, int price, 
    		String thumbnail_thum, String thumbnail_thum_path) throws IOException {
    	
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
    	
        if(buyerService.getWishListOverlapCheck(board_id, buyer_id) != 0) {
        	out.println("0");
        	
        }else {
        	WishListVO vo = new WishListVO();
        	
        	vo.setBoard_id(board_id);
        	vo.setBuyer_id(buyer_id);
        	vo.setTitle(title);
        	vo.setPrice(price);
        	vo.setThumbnail_thum(thumbnail_thum);
        	vo.setThumbnail_thum_path(thumbnail_thum_path);
        	
        	UUID uuid = UUID.randomUUID(); // 중복 방지를 위해 랜덤값 생성
        	long getl = ByteBuffer.wrap(uuid.toString().getBytes()).getLong();
        	
        	StringBuilder wish_id = new StringBuilder(
        			vo.getBuyer_id() + "-" + Long.toString(getl, 10));
        	
        	vo.setWish_id(wish_id.toString());
        	
    		
    		if(buyerService.insertWishList(vo) == 1) {
    			out.println("1");
    		}

        }
        
        out.flush();
        
    }

	@RequestMapping(value = "JoinBuyer.by", method = RequestMethod.POST)
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
	
	   
	   @RequestMapping(value ="/profileThumbnail.by", method = RequestMethod.POST,
			   produces="text/plain;charset=utf-8")
	   @ResponseBody
	   public String profileThumbnail(Model model, MultipartRequest multipartRequest) {
		   MultipartFile file = multipartRequest.getFile("imgFile");
		   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			String uploadFolder_profile_img = "C:\\Project156\\upload/profile_img";
			String img = imgSave(file, uploadFolder_profile_img);
			System.out.println("img"+img);
			StringBuilder img_path = new StringBuilder(
					"/img/profile_img/"+str.replace("-", "/")+"/");
			String path = img_path.toString();
			return path+"@"+img;
	   }
	 

	@RequestMapping(value = "/UpdateBuyerAccountForm.by") // 프로필 - 수정하기
	public String UpdateBuyerAccountForm(Model model, @CurrentUser AccountVO buyer) {

		BuyerVO vo = buyerService.selectOneById(buyer.getId());

		int mailIndex = vo.getEmail().indexOf("@");

		vo.setEmailId(vo.getEmail().substring(0, mailIndex));
		vo.setEmailAddr(vo.getEmail().substring(mailIndex + 1));
		vo.setTelCarrierNum(vo.getTel().substring(0, 3));
		vo.setTelAllocationNum(vo.getTel().substring(3, 7));
		vo.setTelDiscretionaryNum(vo.getTel().substring(7));
		vo.setLoginDate(vo.getLoginDate().substring(0, 10));
		try {
			if(vo.getProfileImg() == null&&vo.getProfileImgPath() ==null) {
				vo.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				vo.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				vo.setProfileImg(URLEncoder.encode(vo.getProfileImg(),"UTF-8"));
				vo.setProfileImgPath(URLEncoder.encode(vo.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		

		model.addAttribute("user", vo);

		return "Buyer/mypage_infoModify";
	}
	
	@RequestMapping(value = "/UpdateBuyerAccount.by")
	public String UpdateBuyerAccount(String id,String emailId,String emailAddr,String telCarrierNum,
			String telAllocationNum, String telDiscretionaryNum,
			@RequestPart(value="profileImg", required = false)MultipartFile profile_img)throws IOException {

		BuyerVO buyer = new BuyerVO();
		buyer.setId(id);
		buyer.setTel(telCarrierNum, telAllocationNum, telDiscretionaryNum);
		buyer.setEmail(emailId, emailAddr);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

		String uploadFolder_profile_img = "C:\\Project156\\upload/profile_img"; //프로필 이미지 업로드 경로
		if(!profile_img.isEmpty()) {
		buyer.setProfileImg(imgSave(profile_img, uploadFolder_profile_img));
		
		StringBuilder img_path = new StringBuilder(
				"/img/profile_img/"+str.replace("-", "/")+"/");
		buyer.setProfileImgPath(img_path.toString());
		
		
		}else {
			buyer.setProfileImg("no_profile.png");
			buyer.setProfileImgPath("/img/common/");
		}


		buyerService.UpdateBuyerAccount(buyer);

		return "redirect:/BuyerMyPage.by";

	}
	
	private String imgSave(MultipartFile imgFile, String uploadFolder) {
		// 저장할 이미지 파일, 저장할 폴더경로
		// 반드시 원본파일을 만들고 난 뒤 사용해야 함
		
		File uploadPath = getFolder(uploadFolder); // 오늘 날짜로 경로폴더 만들기
		UUID uuid = UUID.randomUUID();  // 파일이름 중복방지를 위하여 랜덤으로 임의의 값 생성
		StringBuilder file_name = 
				new StringBuilder(uuid.toString() + "_" + imgFile.getOriginalFilename()); // 파일 이름 만들기
		File createFile = new File(uploadPath, file_name.toString()); // 저장파일 생성
		
		try {
			
			if(checkImageType(createFile)) {  // 업로드된 파일이 이미지파일인지 체크
				imgFile.transferTo(createFile);  // 파일 저장
			}
			
		}catch(Exception e) {
			
		}
		
		return file_name.toString();
	}
	
	private File getFolder(String uploadFolder) {  // 현재 날짜로 폴더경로 생성
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		File uploadPath = new File(uploadFolder, str.replace("-", File.separator));
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		return uploadPath;
	}
	
private boolean checkImageType(File file) {  // 파일 이미지 체크
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
		return false;
	}

	@RequestMapping(value = "/UpdateBuyerPasswordForm.by")
	public String UpdateBuyerPasswordForm(Model model, @CurrentUser AccountVO buyer) {

		BuyerVO vo = buyerService.selectOneById(buyer.getId());
		vo.setLoginDate(vo.getLoginDate().substring(0, 10));
		try {
			if(vo.getProfileImg() == null&&vo.getProfileImgPath() ==null) {
				vo.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				vo.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				vo.setProfileImg(URLEncoder.encode(vo.getProfileImg(),"UTF-8"));
				vo.setProfileImgPath(URLEncoder.encode(vo.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		model.addAttribute("user", vo);

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
		
		deliveryVO deliveryY = buyerService.getDefaultDeliveryList(account.getId());
		
		model.addAttribute("deliveryY", deliveryY);

		  
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
		
		if (delivery.getDefaultaddress().equals("Y")) {
			buyerService.UpdateListDeliverList(delivery);
			BuyerVO buyer = new BuyerVO();
			buyer.setId(delivery.getId());
			buyer.setAddress(delivery.getAddrNum(), delivery.getAddrRoadName(), delivery.getAddrDetail());
			buyerService.UpdateDefaultAddress(buyer);
		}
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
	public String ListDeliveryModifyForm(@RequestParam(value = "num", required = true) int num,
			Model model /* , @CurrentUser BuyerVO account */ ) {		
		
		/* BuyerVO buyerAccount = buyerService.selectOneById(account.getId()); */
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
		  
			
			/*
			 * model.addAttribute("name", account.getName());
			 * model.addAttribute("loginDate", account.getLoginDate().substring(0, 10));
			 */
			 

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
		
		if (res == 1)  {
			writer.write("<script>alert('삭제 성공!!');" + "location.href='./BuyerMyPageDeliveryManager.by';</script>");
		} else {
			writer.write("<script>alert('기본 주소지는 삭제할 수 없습니다.!!');" + "location.href='./BuyerMyPageDeliveryManager.by';</script>");
		}
		
		return null;
		
	}    
}
