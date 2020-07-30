package com.spring.boardproduct;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.imgscalr.Scalr;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.admin.AccountVO;
import com.spring.config.Security.CurrentUser;
import com.spring.order.OrderService;
import com.spring.util.PageMaker;

@Controller
public class BoardProductController {

	@Autowired
	private BoardProductService boardProductService;
	@Autowired
	private OrderService orderService;

	@GetMapping(value = "/BoardProductSearch.bo")
	public String boardProductSearch(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "category_1", required = false, defaultValue = "0") int category_1,
			@RequestParam(value = "category_2", required = false, defaultValue = "0") int category_2,
			@RequestParam(value = "category_local", required = false, defaultValue = "0") int category_local,
			@RequestParam(value = "sort_list", required = false, defaultValue = "2") int sort_list,
			@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num,
			@RequestParam(value = "page_amount", required = false, defaultValue = "30") int page_amount,
			@RequestParam(value = "min_price", required = false, defaultValue = "0") int min_price,
			@RequestParam(value = "max_price", required = false, defaultValue = "9999999") int max_price,
			@RequestParam(value = "priceSelect", required = false, defaultValue = "10") int priceSelect,
			String keyword) {

		Cookie[] cookies = request.getCookies();
		Cookie non_userCK = null;
		Cookie userCK = null;

		ArrayList<BoardProductVO> non_recentList = new ArrayList<>();
		ArrayList<BoardProductVO> recentList = new ArrayList<>();

		for (Cookie c : cookies) {
			if (c.getName().equals("recentlyProduct")) {
				non_userCK = c;
				int non_index1 = non_userCK.getValue().indexOf("/");
				String non_str = non_userCK.getValue().substring(non_index1 + 1);
				String[] non_recentArray = non_str.split("/");
				for (int i = 0; i < non_recentArray.length; i++) {
					BoardProductVO product = boardProductService.getBoardProductVO(non_recentArray[i]);
					try {
						product.setThumbnail_thum(URLEncoder.encode(product.getThumbnail_thum(), "UTF-8"));
						product.setThumbnail_thum_path(URLEncoder.encode(product.getThumbnail_thum_path(), "UTF-8"));

					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();

					}
					non_recentList.add(product);
				}
			} else if (c.getName().equals("AccountRecentlyProduct")) {
				userCK = c;
				int index1 = userCK.getValue().indexOf("/");
				String str = userCK.getValue().substring(index1 + 1);
				String[] recentArray = str.split("/");
				for (int i = 0; i < recentArray.length; i++) {
					BoardProductVO product = boardProductService.getBoardProductVO(recentArray[i]);
					try {
						product.setThumbnail_thum(URLEncoder.encode(product.getThumbnail_thum(), "UTF-8"));
						product.setThumbnail_thum_path(URLEncoder.encode(product.getThumbnail_thum_path(), "UTF-8"));
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					recentList.add(product);
				}
			}

		}
		model.addAttribute("non_list", non_recentList);
		model.addAttribute("list", recentList);

		int minCategory_1 = 1;
		int maxCategory_1 = 10;

		int minCategory_2 = 101;
		int maxCategory_2 = 1004;

		int minCategory_local = 1;
		int maxCategory_local = 10;

		if (category_1 != 0) {
			minCategory_1 = category_1;
			maxCategory_1 = category_1;
		}

		if (category_2 != 0) {
			minCategory_2 = category_2;
			maxCategory_2 = category_2;
		}

		if (category_local != 0) {
			minCategory_local = category_local;
			maxCategory_local = category_local;
		}

		ArrayList<BoardProductVO> vo_list = boardProductService.getSearchBoardProductList(keyword, minCategory_1,
				maxCategory_1, minCategory_2, maxCategory_2, minCategory_local, maxCategory_local, min_price, max_price,
				sort_list, page_num, page_amount);

		model.addAttribute("pageMaker", new PageMaker(page_num, page_amount, vo_list.size()));
		model.addAttribute("sort_list", sort_list);
		model.addAttribute("vo_list", vo_list);
		model.addAttribute("category_1", category_1);
		model.addAttribute("category_2", category_2);
		model.addAttribute("category_local", category_local);
		model.addAttribute("keyword", keyword);
		model.addAttribute("min_price", min_price);
		model.addAttribute("max_price", max_price);
		model.addAttribute("priceSelect", priceSelect);

		return "BoardProduct/boardProductSearch";
	}

	@GetMapping(value = "/BoardProductList.bo") // 판매글 리스트
	public String boardProductList(Model model,
			@RequestParam(value = "category_1", required = false, defaultValue = "0") int category_1,
			@RequestParam(value = "category_2", required = false, defaultValue = "0") int category_2,
			@RequestParam(value = "category_local", required = false, defaultValue = "0") int category_local,
			@RequestParam(value = "sort_list", required = false, defaultValue = "2") int sort_list,
			@RequestParam(value = "page_num", required = false, defaultValue = "1") int page_num,
			@RequestParam(value = "page_amount", required = false, defaultValue = "30") int page_amount,
			HttpServletRequest request, HttpServletResponse response) {

		ArrayList<BoardProductVO> vo_list = null;
		String category_title = null;
		ArrayList<String> category_sub = new ArrayList<String>();
		Cookie[] cookies = request.getCookies();
		Cookie non_userCK = null;
		Cookie userCK = null;

		ArrayList<BoardProductVO> non_recentList = new ArrayList<>();
		ArrayList<BoardProductVO> recentList = new ArrayList<>();

		for (Cookie c : cookies) {
			if (c.getName().equals("recentlyProduct")) {
				non_userCK = c;
				int non_index1 = non_userCK.getValue().indexOf("/");
				String non_str = non_userCK.getValue().substring(non_index1 + 1);
				String[] non_recentArray = non_str.split("/");
				for (int i = non_recentArray.length - 1; i > 0; i--) {
					BoardProductVO product = boardProductService.getBoardProductVO(non_recentArray[i]);
					try {
						product.setThumbnail_thum(URLEncoder.encode(product.getThumbnail_thum(), "UTF-8"));
						product.setThumbnail_thum_path(URLEncoder.encode(product.getThumbnail_thum_path(), "UTF-8"));

					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();

					}
					non_recentList.add(product);
				}
			} else if (c.getName().equals("AccountRecentlyProduct")) {
				userCK = c;
				int index1 = userCK.getValue().indexOf("/");
				String str = userCK.getValue().substring(index1 + 1);
				String[] recentArray = str.split("/");
				for (int i = recentArray.length - 1; i > 0; i--) {
					BoardProductVO product = boardProductService.getBoardProductVO(recentArray[i]);
					try {
						product.setThumbnail_thum(URLEncoder.encode(product.getThumbnail_thum(), "UTF-8"));
						product.setThumbnail_thum_path(URLEncoder.encode(product.getThumbnail_thum_path(), "UTF-8"));
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					recentList.add(product);
				}
			}

		}
		model.addAttribute("non_list", non_recentList);
		model.addAttribute("list", recentList);

		int vo_list_size = 0;

		if (category_1 != 0) {
			vo_list = boardProductService.getBoardList_category1(category_1, sort_list, page_num, page_amount);
			vo_list_size = boardProductService.getBoardListSize_1(category_1);
		}

		if (category_2 != 0) {
			vo_list = boardProductService.getBoardList_category2(category_2, sort_list, page_num, page_amount);
			vo_list_size = boardProductService.getBoardListSize_2(category_2);
		}

		if (category_local != 0) {
			vo_list = boardProductService.getBoardList_categoryLocal(category_local, sort_list, page_num, page_amount);
			vo_list_size = boardProductService.getBoardListSize_local(category_local);
			category_title = "지역별";
			category_sub.add("강원도");
			category_sub.add("경기도");
			category_sub.add("경상북도");
			category_sub.add("경상남도");
			category_sub.add("전라북도");
			category_sub.add("전라남도");
			category_sub.add("충청북도");
			category_sub.add("충청남도");
			category_sub.add("제주도");
			category_sub.add("울릉도/독도");
		} else {

			if (category_1 == 1 || (category_2 >= 101 && category_2 <= 105)) {
				category_title = "쌀/잡곡";
				category_sub.add("백미");
				category_sub.add("현미/찹쌀/흑미");
				category_sub.add("콩/팥/보리");
				category_sub.add("조/수수/깨/기타");
				category_sub.add("곡류선물세트");
			} else if (category_1 == 2 || (category_2 >= 201 && category_2 <= 206)) {
				category_title = "채소류";
				category_sub.add("감자/고구마");
				category_sub.add("더덕");
				category_sub.add("나물/잎줄기 채소");
				category_sub.add("건나물/건채소");
				category_sub.add("버섯류");
				category_sub.add("옥수수/단호박/기타");
			} else if (category_1 == 3 || (category_2 >= 301 && category_2 <= 304)) {
				category_title = "과일";
				category_sub.add("사과/배");
				category_sub.add("감/홍시/곶감");
				category_sub.add("견과/건과");
				category_sub.add("참다래/기타과일");
			} else if (category_1 == 4 || (category_2 >= 401 && category_2 <= 407)) {
				category_title = "축산물";
				category_sub.add("소고기");
				category_sub.add("돼지고기");
				category_sub.add("닭");
				category_sub.add("계란/알류/가공란");
				category_sub.add("축산선물세트");
				category_sub.add("유제품");
				category_sub.add("기타");
			} else if (category_1 == 5 || (category_2 >= 501 && category_2 <= 503)) {
				category_title = "수산물/건어물";
				category_sub.add("황태/진미채");
				category_sub.add("수산물선물세트");
				category_sub.add("기타");
			} else if (category_1 == 6 || (category_2 >= 601 && category_2 <= 607)) {
				category_title = "가공식품/떡류";
				category_sub.add("떡");
				category_sub.add("한과");
				category_sub.add("면");
				category_sub.add("음료");
				category_sub.add("냉장냉동간편조리");
				category_sub.add("기름");
				category_sub.add("기타");
			} else if (category_1 == 7 || (category_2 >= 701 && category_2 <= 704)) {
				category_title = "김치/반찬/젓갈";
				category_sub.add("김치/절임배추");
				category_sub.add("반찬/절임");
				category_sub.add("젓갈");
				category_sub.add("기타");
			} else if (category_1 == 8 || (category_2 >= 801 && category_2 <= 808)) {
				category_title = "장/조청/식초";
				category_sub.add("간장");
				category_sub.add("고추장");
				category_sub.add("된장");
				category_sub.add("청국장");
				category_sub.add("장류선물세트");
				category_sub.add("식초/액젓");
				category_sub.add("조청");
				category_sub.add("기타");
			} else if (category_1 == 9 || (category_2 >= 901 && category_2 <= 907)) {
				category_title = "건강식품";
				category_sub.add("유산균");
				category_sub.add("홍삼/인삼");
				category_sub.add("건강즙");
				category_sub.add("영양식/선식");
				category_sub.add("꿀/로얄젤리");
				category_sub.add("건강분말/건강환");
				category_sub.add("기타");
			} else if (category_1 == 10 || (category_2 >= 1001 && category_2 <= 1004)) {
				category_title = "차류";
				category_sub.add("커피");
				category_sub.add("전통차/허브차/꽃차");
				category_sub.add("커피/차 선물세트");
				category_sub.add("기타");
			}
		}

		model.addAttribute("pageMaker", new PageMaker(page_num, page_amount, vo_list_size));
		model.addAttribute("category_title", category_title);
		model.addAttribute("category_sub", category_sub);
		model.addAttribute("sort_list", sort_list);
		model.addAttribute("vo_list", vo_list);

		return "BoardProduct/boardProductList";
	}

	@GetMapping(value = "/BoardProductView.bo") // 판매글 보기
	public String boardProductView(Model model, HttpServletRequest request, HttpServletResponse response,
			String board_id, @RequestParam(value = "location", required = false, defaultValue = "0") String location) {
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		for (Cookie c : cookies) {
			if (c.getName().equals("recentlyProduct")) {
				cookie = c;
			}
		}

		if (cookie == null) {
			cookie = new Cookie("recentlyProduct", "Start");
			cookie.setMaxAge(86400);
			cookie.setValue(cookie.getValue() + "/" + board_id);
		}
		int count = org.springframework.util.StringUtils.countOccurrencesOf(cookie.getValue(), "/");
		System.out.println("/의 갯수(비회원) : " + count);

		if (!cookie.getValue().contains(board_id)) {
			if (count < 50) {
				cookie.setValue(cookie.getValue() + "/" + board_id);
			} else {
				int index1 = cookie.getValue().indexOf("/");
				int index2 = cookie.getValue().substring(index1 + 1).indexOf("/");
				cookie.setValue("Start" + cookie.getValue().substring(index2) + "/" + board_id);
			}
		}
		ArrayList<BoardProductVO> non_recentList = new ArrayList<>();
		int non_index1 = cookie.getValue().indexOf("/");
		String non_str = cookie.getValue().substring(non_index1 + 1);
		String[] non_recentArray = non_str.split("/");
		for (int i = non_recentArray.length - 1; i > 0; i--) {
			BoardProductVO product = boardProductService.getBoardProductVO(non_recentArray[i]);
			try {
				product.setThumbnail_thum(URLEncoder.encode(product.getThumbnail_thum(), "UTF-8"));
				product.setThumbnail_thum_path(URLEncoder.encode(product.getThumbnail_thum_path(), "UTF-8"));

			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();

			}
			non_recentList.add(product);
		}
		response.addCookie(cookie);

		BoardProductVO vo = boardProductService.getBoardProductVO(board_id);
    	ArrayList<BoardReviewVO> review_list  // 페이징처리는 뷰에서 비동기로 함
    	    = boardProductService.getBoardReviewList(board_id, 1, 5); // 리스트에서 1페이지(5개)만 가져옴
    	int reviewNum = boardProductService.getReviewNum(board_id);
    	
    	
    	ArrayList<CommentReviewVO[]> reviewComment = new ArrayList<CommentReviewVO[]>();
    	CommentReviewVO[] comment = null;
    	
    	for(int i = 0; i < review_list.size(); i++) {
    		comment  = boardProductService.getReviewComment(review_list.get(i).getReview_id());
    		reviewComment.add(comment);
    	}
    	
    	ArrayList<BoardQnaVO> qna_list
    	    = boardProductService.getBoardQnaList(board_id, 0, 0, 1, 10, null); 
    	// board_id(qna상품검색), 문의종류(0 - 전체), 답변 여부(1,2 아닐 경우 모두 검색), 
    	// 현재페이지, 보여줄 리스트갯수, 키워드
    	
    	int countQna = boardProductService.getCountQna(board_id);
    	
    	
    	System.out.println("쿠키값: "+cookie.getValue());
    	model.addAttribute("vo", vo);     
    	model.addAttribute("non_list",non_recentList);
    	model.addAttribute("location", location);
    	model.addAttribute("review_list", review_list);
    	model.addAttribute("reviewNum", reviewNum);
    	model.addAttribute("reviewComment", reviewComment);
    	model.addAttribute("qna_list", qna_list);
    	model.addAttribute("countQna", countQna);
    	
    	
		return "BoardProduct/boardProductView";


	}

	@GetMapping(value = "/BoardProductView2.bo") // 구매회원일경우 판매글 보기
	public String boardProductView2(Model model, HttpServletRequest request, HttpServletResponse response,
			String board_id, @CurrentUser AccountVO account,
			@RequestParam(value = "location", required = false, defaultValue = "0") String location) {
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		for (Cookie c : cookies) {
			if (c.getName().equals("AccountRecentlyProduct")) {
				cookie = c;
			}
		}
		if (cookie == null) {
			cookie = new Cookie("AccountRecentlyProduct", "Start");
			cookie.setMaxAge(86400);
			cookie.setValue(cookie.getValue() + "/" + board_id);
		}
		int count = org.springframework.util.StringUtils.countOccurrencesOf(cookie.getValue(), "/");
		System.out.println("/의 갯수(회원) : " + count);
		System.out.println("쿠키값1: " + cookie.getValue());
		if (!cookie.getValue().contains(board_id)) {
			if (count < 50) {
				cookie.setValue(cookie.getValue() + "/" + board_id);
			} else {
				int index1 = cookie.getValue().indexOf("/");
				int index2 = cookie.getValue().substring(index1 + 1).indexOf("/");
				cookie.setValue("Start" + cookie.getValue().substring(index2) + "/" + board_id);
			}
		}
		ArrayList<BoardProductVO> recentList = new ArrayList<>();
		int index1 = cookie.getValue().indexOf("/");
		String str = cookie.getValue().substring(index1 + 1);
		String[] recentArray = str.split("/");
		for (int i = recentArray.length - 1; i > 0; i--) {
			BoardProductVO product = boardProductService.getBoardProductVO(recentArray[i]);
			try {
				product.setThumbnail_thum(URLEncoder.encode(product.getThumbnail_thum(), "UTF-8"));
				product.setThumbnail_thum_path(URLEncoder.encode(product.getThumbnail_thum_path(), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			recentList.add(product);
		}
		response.addCookie(cookie);
		BoardProductVO vo = boardProductService.getBoardProductVO(board_id);
    	ArrayList<BoardReviewVO> review_list  // 페이징처리는 뷰에서 비동기로 함
    	    = boardProductService.getBoardReviewList(board_id, 1, 5); // 리스트에서 1페이지(5개)만 가져옴
    	int reviewNum = boardProductService.getReviewNum(board_id);
    	
    	
    	ArrayList<CommentReviewVO[]> reviewComment = new ArrayList<CommentReviewVO[]>();
    	CommentReviewVO[] comment = null;
    	
    	for(int i = 0; i < review_list.size(); i++) {
    		comment  = boardProductService.getReviewComment(review_list.get(i).getReview_id());
    		reviewComment.add(comment);
    	}
    	
    	ArrayList<BoardQnaVO> qna_list
	    = boardProductService.getBoardQnaList(board_id, 0, 0, 1, 10, null); 
	    // board_id(qna상품검색), 문의종류(0 - 전체), 답변 여부(1,2 아닐 경우 모두 검색), 
    	// 현재페이지, 보여줄 리스트갯수, 키워드
	
	    int countQna = boardProductService.getCountQna(board_id);
    	
    	System.out.println("쿠키값2: "+cookie.getValue());
    	model.addAttribute("vo", vo);     
    	model.addAttribute("list",recentList);
    	model.addAttribute("location", location);
    	model.addAttribute("review_list", review_list);
    	model.addAttribute("reviewNum", reviewNum);
    	model.addAttribute("reviewComment", reviewComment);
    	model.addAttribute("qna_list", qna_list);
    	model.addAttribute("countQna", countQna);
    	
		return "BoardProduct/boardProductView";
	}

	@RequestMapping(value = "/BoardLocalIntroduce.bo") // 지역특산물
	public String boardLocalIntroduce(Model model, HttpServletRequest request, HttpServletResponse response) {

		Cookie[] cookies = request.getCookies();
		Cookie non_userCK = null;
		Cookie userCK = null;

		ArrayList<BoardProductVO> non_recentList = new ArrayList<>();
		ArrayList<BoardProductVO> recentList = new ArrayList<>();

		for (Cookie c : cookies) {
			if (c.getName().equals("recentlyProduct")) {
				non_userCK = c;
				int non_index1 = non_userCK.getValue().indexOf("/");
				String non_str = non_userCK.getValue().substring(non_index1 + 1);
				String[] non_recentArray = non_str.split("/");
				for (int i = non_recentArray.length - 1; i > 0; i--) {
					BoardProductVO product = boardProductService.getBoardProductVO(non_recentArray[i]);
					try {
						product.setThumbnail_thum(URLEncoder.encode(product.getThumbnail_thum(), "UTF-8"));
						product.setThumbnail_thum_path(URLEncoder.encode(product.getThumbnail_thum_path(), "UTF-8"));

					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();

					}
					non_recentList.add(product);
				}
			} else if (c.getName().equals("AccountRecentlyProduct")) {
				userCK = c;
				int index1 = userCK.getValue().indexOf("/");
				String str = userCK.getValue().substring(index1 + 1);
				String[] recentArray = str.split("/");
				for (int i = recentArray.length - 1; i > 0; i--) {
					BoardProductVO product = boardProductService.getBoardProductVO(recentArray[i]);
					try {
						product.setThumbnail_thum(URLEncoder.encode(product.getThumbnail_thum(), "UTF-8"));
						product.setThumbnail_thum_path(URLEncoder.encode(product.getThumbnail_thum_path(), "UTF-8"));
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
					recentList.add(product);
				}
			}

		}
		model.addAttribute("non_list", non_recentList);
		model.addAttribute("list", recentList);

		return "BoardProduct/localIntroduce";
	}

	@PostMapping(value = "/BoardProductRegist.bo") // 상품등록
	public String sellerProductRegisterDB(Model model, String seller_id, String title, int category_1, int category_2,
			int price, int delivery_price, int quantity, // String content,
			String sales_producer, String product_name, String product_weight, String product_size, int category_local,
			String product_country, String date_manufacture, String best_before_date, String transgenic,
			String storage_method, String consumer_consulation,
			@RequestPart(value = "thumbnail_origin", required = false) MultipartFile thumbnail_origin,
			@RequestPart(value = "product_origin_1", required = false) MultipartFile product_origin_1,
			@RequestPart(value = "product_origin_2", required = false) MultipartFile product_origin_2,
			@RequestPart(value = "product_origin_3", required = false) MultipartFile product_origin_3,
			@RequestPart(value = "product_origin_4", required = false) MultipartFile product_origin_4)
			throws IOException {

		// 받아온 값 vo에 세팅
		// ============================================================================
		BoardProductVO vo = new BoardProductVO();
		vo.setContent("test"); // test값으로 세팅, summernote 건드리는중
		vo.setContent_origin("test"); // test값으로 세팅, summernote 건드리는중
		vo.setSeller_id(seller_id); // test값으로 세팅, 회원가입 로그인 완료되면 교체
		vo.setTitle(title);
		vo.setCategory_1(category_1);
		vo.setCategory_2(category_2);
		vo.setPrice(price);
		vo.setDelivery_price(delivery_price);
		vo.setQuantity(quantity);
		vo.setSales_producer(sales_producer);
		vo.setProduct_name(product_name);
		vo.setProduct_weight(product_weight);
		vo.setProduct_size(product_size);
		vo.setCategory_local(category_local);
		vo.setProduct_country(product_country);
		vo.setDate_manufacture(date_manufacture);
		vo.setBest_before_date(best_before_date);
		vo.setTransgenic(transgenic);
		vo.setStorage_method(storage_method);
		vo.setConsumer_consulation(consumer_consulation);
		// 받아온 값 vo에 세팅 end
		// =========================================================================

		// board_num값 만들어서 세팅
		// =======================================================================
		int board_num = boardProductService.getBoardNum() + 1;
		vo.setBoard_num(board_num);
		// board_num값 만들어서 세팅 end
		// ===================================================================

		// board_id값 만들어서 세팅
		// ========================================================================
		SimpleDateFormat format_time = new SimpleDateFormat("yyyyMMdd");
		String today = format_time.format(Calendar.getInstance().getTime());
		vo.setBoard_id(today + "-" + board_num); // 오늘날짜(년월일)-게시판번호로 id값 세팅
		// board_id값 만들어서 세팅 end
		// ====================================================================

		// 이미지 파일 저장 및 썸네일 생성
		// =======================================================================
		String uploadFolder_thumbnail_origin = "C:\\Project156\\upload\\thumbnail_origin"; // 썸네일 원본 업로드 경로
		String uploadFolder_thumbnail_thum = "C:\\Project156\\upload\\thumbnail_thum"; // 썸네일 썸네일 업로드 경로
		String uploadFolder_product_origin = "C:\\Project156\\upload\\product_origin"; // 상품이미지 원본 업로드 경로
		String uploadFolder_product_thum = "C:\\Project156\\upload\\product_thum"; // 상품이미지 썸네일 업로드 경로
//		String uploadFolder_content_origin = "C:\\Project156\\upload\\content_origin"; // 본문 이미지 업로드 경로

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

		if (!thumbnail_origin.isEmpty()) {

			File thum_origin_save = imgSave(thumbnail_origin, uploadFolder_thumbnail_origin);

			String thum_thum_name = makeThumbnail(thumbnail_origin, thum_origin_save, uploadFolder_thumbnail_thum, 215,
					215);
			vo.setThumbnail_origin(thum_origin_save.getName());
			vo.setThumbnail_thum(thum_thum_name);

			StringBuilder img_path = new StringBuilder(
					uploadFolder_thumbnail_origin.replace("C:\\Project156\\upload\\", "/img/") + "/"
							+ str.replace("-", "/") + "/");
			vo.setThumbnail_origin_path(img_path.toString());

			img_path.setLength(0);

			img_path.append(uploadFolder_thumbnail_thum.replace("C:\\Project156\\upload\\", "/img/") + "/"
					+ str.replace("-", "/") + "/");
			vo.setThumbnail_thum_path(img_path.toString());

		} else {
			vo.setThumbnail_thum("no_image_thum.jpg");
			vo.setThumbnail_thum_path("/img/common/");
		}

		boolean imgFlag = false;

		if (!product_origin_1.isEmpty()) {
			File product_origin_1_save = imgSave(product_origin_1, uploadFolder_product_origin);
			String product_thum_1_name = makeThumbnail(product_origin_1, product_origin_1_save,
					uploadFolder_product_thum, 100, 100);
			vo.setProduct_origin_1(product_origin_1_save.getName());
			vo.setProduct_thum_1(product_thum_1_name);

			StringBuilder img_path = new StringBuilder(
					uploadFolder_product_origin.replace("C:\\Project156\\upload\\", "/img/") + "/"
							+ str.replace("-", "/") + "/");
			vo.setProduct_origin_path(img_path.toString());
			img_path.setLength(0);

			img_path.append(uploadFolder_product_thum.replace("C:\\Project156\\upload\\", "/img/") + "/"
					+ str.replace("-", "/") + "/");
			vo.setProduct_thum_path(img_path.toString());

			imgFlag = true;
		}

		if (!product_origin_2.isEmpty()) {
			File product_origin_2_save = imgSave(product_origin_2, uploadFolder_product_origin);
			String product_thum_2_name = makeThumbnail(product_origin_2, product_origin_2_save,
					uploadFolder_product_thum, 100, 100);
			vo.setProduct_origin_2(product_origin_2_save.getName());
			vo.setProduct_thum_2(product_thum_2_name);

			StringBuilder img_path = new StringBuilder(
					uploadFolder_product_origin.replace("C:\\Project156\\upload\\", "/img/") + "/"
							+ str.replace("-", "/") + "/");
			vo.setProduct_origin_path(img_path.toString());
			img_path.setLength(0);

			img_path.append(uploadFolder_product_thum.replace("C:\\Project156\\upload\\", "/img/") + "/"
					+ str.replace("-", "/") + "/");
			vo.setProduct_thum_path(img_path.toString());

			imgFlag = true;
		}

		if (!product_origin_3.isEmpty()) {
			File product_origin_3_save = imgSave(product_origin_3, uploadFolder_product_origin);
			String product_thum_3_name = makeThumbnail(product_origin_3, product_origin_3_save,
					uploadFolder_product_thum, 100, 100);
			vo.setProduct_origin_3(product_origin_3_save.getName());
			vo.setProduct_thum_3(product_thum_3_name);

			StringBuilder img_path = new StringBuilder(
					uploadFolder_product_origin.replace("C:\\Project156\\upload\\", "/img/") + "/"
							+ str.replace("-", "/") + "/");
			vo.setProduct_origin_path(img_path.toString());
			img_path.setLength(0);

			img_path.append(uploadFolder_product_thum.replace("C:\\Project156\\upload\\", "/img/") + "/"
					+ str.replace("-", "/") + "/");
			vo.setProduct_thum_path(img_path.toString());

			imgFlag = true;
		}

		if (!product_origin_4.isEmpty()) {
			File product_origin_4_save = imgSave(product_origin_4, uploadFolder_product_origin);
			String product_thum_4_name = makeThumbnail(product_origin_4, product_origin_4_save,
					uploadFolder_product_thum, 100, 100);
			vo.setProduct_origin_4(product_origin_4_save.getName());
			vo.setProduct_thum_4(product_thum_4_name);

			StringBuilder img_path = new StringBuilder(
					uploadFolder_product_origin.replace("C:\\Project156\\upload\\", "/img/") + "/"
							+ str.replace("-", "/") + "/");
			vo.setProduct_origin_path(img_path.toString());
			img_path.setLength(0);

			img_path.append(uploadFolder_product_thum.replace("C:\\Project156\\upload\\", "/img/") + "/"
					+ str.replace("-", "/") + "/");
			vo.setProduct_thum_path(img_path.toString());

			imgFlag = true;
		}

		if (!imgFlag) { // 아무런 대표이미지도 저장되지 않았을 때
			vo.setProduct_origin_1("no_image.jpg");
			vo.setProduct_thum_1("no_image_thum.jpg");
			vo.setProduct_origin_path("/img/common/");
			vo.setProduct_thum_path("/img/common/");
		}
		// 이미지 파일 저장 및 썸네일 생성 end
		// ===================================================================

		// 값 들어오는지 확인
		// ====================================================================
		System.out.println("게시판 id: " + vo.getBoard_id());
		System.out.println("판매자 id: " + vo.getSeller_id());
		System.out.println("게시판 번호: " + vo.getBoard_num());
		System.out.println("제목: " + vo.getTitle());
		System.out.println("판매가: " + vo.getPrice());
		System.out.println("배송비: " + vo.getDelivery_price());
		System.out.println("수량: " + vo.getQuantity());
		System.out.println("본문내용: " + vo.getContent());
		System.out.println("게시글 등록일: " + vo.getRegister_date());
		System.out.println("1차 카테고리: " + vo.getCategory_1());
		System.out.println("2차 카테고리: " + vo.getCategory_2());
		System.out.println("지역 코드: " + vo.getCategory_local());
		System.out.println("판매생산자: " + vo.getSales_producer());
		System.out.println("상품명: " + vo.getProduct_name());
		System.out.println("상품중량: " + vo.getProduct_weight());
		System.out.println("상품크기: " + vo.getProduct_size());
		System.out.println("원산지: " + vo.getProduct_country());
		System.out.println("제조년월일: " + vo.getDate_manufacture());
		System.out.println("품질유지기한: " + vo.getBest_before_date());
		System.out.println("유전자 변형 표기: " + vo.getTransgenic());
		System.out.println("보관방법: " + vo.getStorage_method());
		System.out.println("소비자 상담문의: " + vo.getConsumer_consulation());
		System.out.println("썸네일 원본이름: " + vo.getThumbnail_origin());
		System.out.println("썸네일 썸네일이름: " + vo.getThumbnail_thum());
		System.out.println("대표이미지1 원본이름: " + vo.getProduct_origin_1());
		System.out.println("대표이미지1 썸네일이름: " + vo.getProduct_thum_1());
		System.out.println("대표이미지2 원본이름: " + vo.getProduct_origin_2());
		System.out.println("대표이미지2 썸네일이름: " + vo.getProduct_thum_2());
		System.out.println("대표이미지3 원본이름: " + vo.getProduct_origin_3());
		System.out.println("대표이미지3 썸네일이름: " + vo.getProduct_thum_3());
		System.out.println("대표이미지4 원본이름: " + vo.getProduct_origin_4());
		System.out.println("대표이미지4 썸네일이름: " + vo.getProduct_thum_4());
		System.out.println("썸네일 원본 경로: " + vo.getThumbnail_origin_path());
		System.out.println("썸네일 썸네일 경로: " + vo.getThumbnail_thum_path());
		System.out.println("대표이미지 원본 경로: " + vo.getProduct_origin_path());
		System.out.println("대표이미지 썸네일 경로: " + vo.getProduct_thum_path());
		System.out.println("본문 이미지 경로: " + vo.getContent_origin_path());
		System.out.println("본문이미지 이름: " + vo.getContent_origin());
		System.out.println("판매수: " + vo.getHit());
		System.out.println("조회수: " + vo.getRead_count());

		// ======================================================================================

		// 데이터베이스에 게시판 등록
		// ===================================================================

		int result = boardProductService.insertBoardProduct(vo);
		if (result == 1) {
			return "redirect:/BoardProductView.bo?board_id=" + vo.getBoard_id();
		} else {
			return null;
		}

		// 데이터베이스에 게시판 등록 end
		// ===============================================================
	}

	private File imgSave(MultipartFile imgFile, String uploadFolder) {
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

		return createFile;
	}

	private String makeThumbnail(MultipartFile originFile, File saveFile, String uploadFolder, int width, int height)
			throws IOException {
		// 원본파일, 저장한 원본파일, 썸네일 저장할 경로, 제작할 썸네일의 너비와 높이

		// 썸네일 만들기 =====================================================================
		BufferedImage srcImg = ImageIO.read(saveFile); // 저장된 원본 파일로부터 객체 생성

		// 원본 이미지의 썸네일 높이와 너비
		int originWidth = srcImg.getWidth();
		int originHeight = srcImg.getHeight();

		// 원본 너비를 기준으로 하여 썸네일의 비율로 높이 계산
		int calWidth = originWidth;
		int calHeight = (originWidth * height) / width;

		// 계산된 높이가 원본보다 높을 때
		// 원본 높이를 기준으로 하여 썸네일의 비율로 너비 계산
		if (calHeight > originHeight) {
			calWidth = (originHeight * width) / height;
			calHeight = originHeight;
		}

		// 계산된 크기로 원본이미지를 가운데서 crop
		BufferedImage cropImg = Scalr.crop(srcImg, (originWidth - calWidth) / 2, (originHeight - calHeight) / 2,
				calWidth, calHeight);

		// crop된 이미지로 썸네일 생성
		BufferedImage thum_img = Scalr.resize(cropImg, width, height);
		// 썸네일 만들기 end
		// ============================================================================

		File uploadPath = getFolder(uploadFolder); // 오늘 날짜로 경로폴더 만들기
		UUID uuid = UUID.randomUUID(); // 파일이름 중복방지를 위하여 랜덤으로 임의의 값 생성
		StringBuilder thumbnail_thum_name = new StringBuilder(
				uuid.toString() + "_thum_" + originFile.getOriginalFilename());
		String file_ext = FilenameUtils.getExtension(originFile.getOriginalFilename()); // 원본 확장자명
		File file_thumbnail = new File(uploadPath, thumbnail_thum_name.toString()); // 썸네일 파일 생성

		ImageIO.write(thum_img, file_ext, file_thumbnail);

		return thumbnail_thum_name.toString();

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

	@GetMapping(value = "/ReadCountPlus.bo")
	@ResponseBody
	private void readCountPlus(String board_id) {

		if (boardProductService.boardReadCountPlus(board_id) == 1) {

		}

	}

	@GetMapping(value = "/BoardReviewCheck.bo") // orderRecord에서 order_id값 받은 다음 BoardReview에서 찾음
	@ResponseBody
	private void boardReviewCheck(HttpServletRequest request, HttpServletResponse response, String board_id,
			String buyer_id) throws IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		String[] order_id = orderService.getOrderID(board_id, buyer_id); // 주문한 상품 중 14일 이내의 주문번호를 가져옴

		boolean flag = false;

		if (order_id.length != 0) {

			for (int i = 0; i < order_id.length; i++) {

				if (boardProductService.checkReview(board_id, buyer_id, order_id[i]) == 0) {

					out.println(order_id[i]);
					flag = true;
					break;
				}
			}

			if (!flag) {
				out.println("1");
			}

		} else {
			out.println("2");
		}

		out.flush();

	}

	@PostMapping(value = "/BoardReviewRegist.bo")
	private String boardReviewRegist(String board_id, String buyer_id, String title, String content,
			double satisfaction, double delivery_satisfaction, String review_img_path, String review_img_name,
			String location, String order_id) {

		BoardReviewVO vo = new BoardReviewVO();
		int review_num = boardProductService.getReviewTotNum() + 1;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String str = sdf.format(date);

		StringBuilder review_id = new StringBuilder(str + "-" + review_num);

		vo.setReview_id(review_id.toString());
		vo.setReview_num(review_num);
		vo.setBoard_id(board_id);
		vo.setBuyer_id(buyer_id);
		vo.setOrder_id(order_id.trim());
		vo.setTitle(title);
		vo.setContent(content);
		vo.setSatisfaction(satisfaction);
		vo.setDelivery_satisfaction(delivery_satisfaction);
		vo.setReview_img_path(review_img_path);
		vo.setReview_img_name(review_img_name);

//		System.out.println("review_id: " + vo.getReview_id());
//		System.out.println("review_num: " + vo.getReview_num());
//		System.out.println("board_id: " + vo.getBoard_id());
//		System.out.println("buyer_id: " + vo.getBuyer_id());
//		System.out.println("order_id: " + vo.getOrder_id());
//		System.out.println("title: " + vo.getTitle());
//		System.out.println("content: " + vo.getContent());
//		System.out.println("satisfaction: " + vo.getSatisfaction());
//		System.out.println("delivery_satisfaction: " + vo.getDelivery_satisfaction());
//		System.out.println("review_img_path: " + vo.getReview_img_path());
//		System.out.println("review_img_name: " + vo.getReview_img_name());
//		System.out.println("location: " + location);

		double avgSatisfaction = 0.0;

		if (boardProductService.insertReview(vo) == 1) {
			avgSatisfaction = boardProductService.getAvgSatisfaction(board_id);
		}

		if (boardProductService.updateSatisfaction(board_id, avgSatisfaction) == 1) {

		}

		return "redirect:/BoardProductView.bo?board_id=" + board_id + "&location=" + location;
	}

	@RequestMapping(value = "/ReviewCommentRegist.bo")
	@ResponseBody
	public void reviewCommentRegist(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "seller_id", required = false) String seller_id,
			@RequestParam(value = "content", required = false) String content,
			@RequestParam(value = "review_id", required = false) String review_id) throws IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		CommentReviewVO vo = new CommentReviewVO();
		int reviewCommentNum = boardProductService.getReviewCommentNum(review_id) + 1;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String str = sdf.format(date);
		StringBuilder review_cmt_id = new StringBuilder(review_id + "-" + str + "-" + reviewCommentNum);

		vo.setReview_cmt_id(review_cmt_id.toString());
		vo.setReview_cmt_num(reviewCommentNum);
		vo.setSeller_id(seller_id);
		vo.setContent(content);
		vo.setReview_id(review_id);

		if (boardProductService.insertReviewComment(vo) == 1) {

			Date reviewDate = new Date();
			SimpleDateFormat reviewDateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
			String reviewDateStr = reviewDateFormat.format(reviewDate);
			reviewDateStr.replace("AM", "오전");
			reviewDateStr.replace("PM", "오후");

			JSONObject resultObj = new JSONObject();
			resultObj.put("date", reviewDateStr);
			resultObj.put("num", reviewCommentNum);

			out.println(resultObj);
		}

		out.flush();

	}

	@RequestMapping(value = "/ReviewCommentDelete.bo")
	@ResponseBody
	public void reviewCommentDelete(String review_id, int review_cmt_num) throws IOException {

		if (boardProductService.deleteReviewComment(review_id, review_cmt_num) == 1) {

		}

	}
	
	@PostMapping(value = "/BoardQnaRegist.bo")
	public String boardQnaRegist(String board_id, int qna_status, String seller_id, 
			String buyer_id, String title, String content, int secret_flag, int location) {
		
		BoardQnaVO vo = new BoardQnaVO();
		
		int qna_num = boardProductService.getQnaNum(board_id);
		
		vo.setQna_num(qna_num + 1);
		vo.setBoard_id(board_id);
		vo.setSeller_id(seller_id);
		vo.setBuyer_id(buyer_id);
		vo.setQna_status(qna_status);
		vo.setAnswer_status(2);  // 답변여부, 2로 설정 후 답글이 달리면 1로 변경
		vo.setTitle(title);
		vo.setContent(content);
		vo.setSecret_flag(secret_flag);
		
		System.out.println(board_id);
		System.out.println(qna_status);
		System.out.println(seller_id);
		System.out.println(buyer_id);
		System.out.println(title);
		System.out.println(content);
		System.out.println(secret_flag);
		System.out.println(location);
		
		if(boardProductService.insertQna(vo) == 1) {
			return "redirect:/BoardProductView.bo?board_id=" + board_id + "&location=" + location;
		}
		
		
		return null;
	}
	
	@RequestMapping(value = "/QnaRecommendRegist.bo")
	@ResponseBody
	public void QnaRecommendRegist(HttpServletRequest request, HttpServletResponse response, 
			String board_id, String seller_id, int qna_num, String recommend) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		
		if(boardProductService.insertQnaRecommend(board_id,seller_id, qna_num, recommend) == 1) {
			SimpleDateFormat qnaRecommendDateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
            String qnaRecommendDate = qnaRecommendDateFormat.format(new Date());
            qnaRecommendDate.replace("AM", "오전");
            qnaRecommendDate.replace("PM", "오후");
			out.println(qnaRecommendDate);
		}
		
		out.flush();
	}
	
	@GetMapping(value = "/QnaSelectPage.bo")
	@ResponseBody
	public void qnaSelectPage(HttpServletRequest request, HttpServletResponse response, 
			String board_id, int qna_status, int answer_status, 
			int page_num, int page_amount, String keyword) throws IOException {
		
		
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        ArrayList<BoardQnaVO> qna_list
	        = boardProductService.getBoardQnaList(board_id, qna_status, answer_status, 
	        		page_num, page_amount, keyword); 
      
        
        JSONArray qnaArray = new JSONArray();
        for(int i = 0; i < qna_list.size(); i++) {
        	JSONObject jsonObj = new JSONObject();
        	
        	jsonObj.put("qna_num", qna_list.get(i).getQna_num());
        	jsonObj.put("board_id", qna_list.get(i).getBoard_id());
        	jsonObj.put("seller_id", qna_list.get(i).getSeller_id());
        	jsonObj.put("buyer_id", qna_list.get(i).getBuyer_id());
        	jsonObj.put("answer_status", qna_list.get(i).getAnswer_status());
        	jsonObj.put("title", qna_list.get(i).getTitle());
        	jsonObj.put("content", qna_list.get(i).getContent());
        	jsonObj.put("recommend", qna_list.get(i).getRecommend());
        	jsonObj.put("secret_flag", qna_list.get(i).getSecret_flag());
        	
        	
        	// 날짜 객체는 json에서 사용불가능하므로 문자열로 변환
        	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
        	String to = transFormat.format(qna_list.get(i).getRegister_date());
        	jsonObj.put("register_date", to);
        	
            if(qna_list.get(i).getRecommend_date() != null) {
            	transFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
            	to = transFormat.format(qna_list.get(i).getRecommend_date());
            	to.replace("AM", "오전");
            	to.replace("PM", "오후");
    			jsonObj.put("recommend_date", to);
        	}else {
        		jsonObj.put("recommend_date", qna_list.get(i).getRecommend_date());
        	}
        	
        	
			
			String qnaStatus = null;
			
			switch(qna_list.get(i).getQna_status()){
		    case 1:
		    	qnaStatus = "상품";
		    	break;
		    case 2:
		    	qnaStatus = "배송";
		    	break;
		    case 3:
		    	qnaStatus = "취소";
		    	break;
		    case 4:
		    	qnaStatus = "반품/취소";
		    	break;
		    case 5:
		    	qnaStatus = "교환";
		    	break;
		    case 6:
		    	qnaStatus = "기타";
		    	break;
		    }
			
			jsonObj.put("qna_status", qnaStatus);
			
        	qnaArray.add(jsonObj);
        	
        }
        
        
        out.println(qnaArray.toString());
        
        
        out.flush();
	}
	
	
	@GetMapping(value = "/QnaSelectCount.bo")
	@ResponseBody
	public void qnaSelectCount(HttpServletRequest request, HttpServletResponse response, 
			String board_id, int qna_status, int answer_status, String keyword) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        int list_count = boardProductService.getBoardQnaListCount(board_id, qna_status, 
        		answer_status, keyword); 
        
        
        out.println(list_count);
        
        
        out.flush();
		
	}

}
