package com.spring.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.boardproduct.BoardProductVO;
import com.spring.boardproduct.BoardReviewVO;
import com.spring.buyer.BuyerService;
import com.spring.buyer.BuyerVO;
import com.spring.config.Security.CurrentUser;
import com.spring.config.Security.CustomDetailService;
import com.spring.seller.SellerService;
import com.spring.seller.SellerVO;

@Controller
public class AdminController {

	@Autowired
	AdminServiceImpl service;

	@Autowired
	BuyerService buyerService;

	@Autowired
	SellerService sellerService;
	
	@Autowired
	CustomDetailService securityService;

	@RequestMapping(value = "/Login.ad")
	public String login() throws Exception {

		return "Admin/login_buyer";
	}

	@RequestMapping(value = "/logout.ad")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/LoginBuyer.ad")
	public String loginBuyer() throws Exception {

		return "Admin/login_buyer";
	}

	@RequestMapping(value = "/LoginSeller.ad") // �뙋留ㅼ옄 濡쒓렇�씤
	public String loginSeller() throws Exception {

		return "Admin/login_seller";
	}

	@RequestMapping(value = "/JoinSelect.ad") // �쉶�썝媛��엯 �쑀�삎 �꽑�깮
	public String joinSelect() {

		return "Admin/join_select";
	}

	@RequestMapping(value = "/JoinBuyer.ad") // 援щℓ�옄 �쉶�썝媛��엯
	public String joinBuyer(BuyerVO buyer) {

		return "Admin/join_buyer";
	}

	@RequestMapping(value = "/JoinBuyerComplete.ad") // 援щℓ�옄 �쉶�썝媛��엯 �셿猷�
	public String joinBuyerComplete() {

		return "Admin/join_buyer_complete";
	}

	@RequestMapping(value = "/JoinSeller.ad") // �뙋留ㅼ옄 �쉶�썝媛��엯
	public String joinSeller(SellerVO seller) {

		return "Admin/join_seller";
	}

	@RequestMapping(value = "/JoinSellerComplete.ad") // �뙋留ㅼ옄 �쉶�썝媛��엯 �셿猷�
	public String joinSellerComplete() {

		return "Admin/join_seller_complete";
	}

	@RequestMapping(value = "/termsUse.ad")
	public String termsUse() {

		return "Admin/terms_use";
	}

	@RequestMapping(value = "/privacyPolicy.ad")
	public String privacyPolicy() {

		return "Admin/privacy_policy";
	}

	@RequestMapping(value = "/duplicationCheck.ad", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> idDuplicationCheck(AccountVO account) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		String id = account.getId();
		boolean isDuplication = service.duplicateCheck(id);
		System.out.println("중복체크결과: " + isDuplication);
		if (isDuplication) {
			result.put("result", "Fail");
		} else {
			result.put("result", "OK");
		}
		System.out.println("result값=" + result.get("result"));
		return result;

	}
	
	
	
	
	

	
//============================= 하나 기석 작업 =====================================================	

	@RequestMapping(value = "/AccountManagement.ad")
	public String AccountManagement(Model model, @CurrentUser AccountVO account) {

		AdminVO adminAccount = service.selectOneById(account.getId());

		int allAccountCount = service.getAllAccountCount();
		int buyerAccountCount = service.getBuyerListCount();
		int buyerDelFlagAccountCount = service.getDelflagListCount();
		int serllerAccoutCount = service.getSellerListCount();
		int sellerDelFlagAccountCount = service.getSellerDelflagListCount();

		model.addAttribute("sellerDelFlagAccountCount", sellerDelFlagAccountCount);
		model.addAttribute("allAccountCount", allAccountCount);
		model.addAttribute("buyerAccountCount", buyerAccountCount);
		model.addAttribute("buyerDelFlagAccountCount", buyerDelFlagAccountCount);
		model.addAttribute("serllerAccoutCount", serllerAccoutCount);

		model.addAttribute("user", adminAccount);

		return "Admin/admin_accountManagement_main";
	}

	@RequestMapping(value = "/AdminBuyerList.ad")
	public String SelectAllMemberBuyerList(Model model, @CurrentUser AccountVO account,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int limit = 10;

		int listcount = service.getBuyerListCount();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<BuyerVO> buyerlist = service.SelectAllMemberBuyerList(hashmap);
		// BuyerVO buyerVo = buyerService.selectOneById(model.get);

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림 처리
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		System.out.println("buyerlist" + buyerlist);

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("buyerlist", buyerlist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		return "Admin/admin_buyerlist";
	}

	@RequestMapping(value = "/AdminBuyerListView.ad")
	public String SelectBuyerListview(Model model, @CurrentUser AccountVO account, BuyerVO buyer) throws Exception {

		BuyerVO buyerlist = buyerService.selectOneById(buyer.getId());

		if (buyerlist.getProfileImg() == null || buyerlist.getProfileImg() == "") {
			buyerlist.setProfileImg("profile-basic.png");
		}

		model.addAttribute("buyerlist", buyerlist);
		System.out.println("buyerlist : " + buyerlist);

		return "Admin/admin_buyerlist_view";
	}

	@RequestMapping(value = "/AdminUpdateBuyerList.ad")
	public String AdminUpdateBuyerList(BuyerVO buyer) {

		service.AdminUpdateBuyerList(buyer);

		return "redirect:/AdminBuyerList.ad";

	}

	// 구매자 비활성 회원 리스트
	@RequestMapping(value = "/AdminBuyerDelflagList.ad") // �봽濡쒗븘 - 諛곗넚吏� 愿�由� public
	public String SelectAllDelflagList(Model model, @CurrentUser AccountVO account,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int limit = 10;

		int listcount = service.getDelflagListCount();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<BuyerVO> Delflaglist = service.SelectAllDelflagList(hashmap);

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림 처리
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		System.out.println("Delflaglist" + Delflaglist);

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("Delflaglist", Delflaglist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		return "Admin/admin_buyerDelflaglist";
	}

	@RequestMapping(value = "/AdminBuyerDelflagListView.ad")
	public String SelectdelflagListview(Model model, @CurrentUser AccountVO account, BuyerVO buyer) throws Exception {

		BuyerVO delflaglist = buyerService.selectOneById(buyer.getId());

		if (delflaglist.getProfileImg() == null || delflaglist.getProfileImg() == "") {
			delflaglist.setProfileImg("profile-basic.png");
		}

		model.addAttribute("delflaglist", delflaglist);
		System.out.println("delflaglist : " + delflaglist);

		return "Admin/admin_buyerDelflaglist_view";
	}

	// 비활성 회원
	@RequestMapping(value = "/AdminUpdateBuyerDelflagList.ad")
	public String AdminUpdateBuyerDelflagList(BuyerVO buyer) {

		service.AdminUpdateBuyerDelflagList(buyer);

		return "redirect:/AdminBuyerDelflagList.ad";

	}

	// 판매자 리스트
	@RequestMapping(value = "/AdminSellerList.ad") // �봽濡쒗븘 - 諛곗넚吏� 愿�由� public
	public String SelectAllSellerList(Model model, @CurrentUser AccountVO account,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int limit = 10;

		int listcount = service.getSellerListCount();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<SellerVO> sellerlist = service.SelectAllSellerList(hashmap);
		// BuyerVO buyerVo = buyerService.selectOneById(model.get);

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림 처리
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		System.out.println("sellerlist" + sellerlist);

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("sellerlist", sellerlist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		return "Admin/admin_seller_list";
	}

	@RequestMapping(value = "/AdminSellerListView.ad")
	public String SelectSellerListview(Model model, @CurrentUser AccountVO account, SellerVO seller) throws Exception {

		System.out.println("imp77777777");
		SellerVO sellerlist = sellerService.selectOneById(seller.getId());

		int addr1 = sellerlist.getAddress().indexOf("+");
		int addr2 = sellerlist.getAddress().indexOf("/");

		System.out.println("vo.getAddress()=" + sellerlist.getAddress());
		model.addAttribute("addrNum", sellerlist.getAddress().substring(0, addr1));
		System.out.println("vo.getAddress().substring(0, addr1)=" + sellerlist.getAddress().substring(0, addr1));

		model.addAttribute("addrRoadName", sellerlist.getAddress().substring(addr1 + 1, addr2));
		System.out.println(
				"vo.getAddress().substring(addr1 + 1, addr2)=" + sellerlist.getAddress().substring(addr1 + 1, addr2));

		model.addAttribute("addrDetail", sellerlist.getAddress().substring(addr2 + 1));
		System.out.println("vo.getAddress().substring(addr2+ 1)=" + sellerlist.getAddress().substring(addr2 + 1));

		model.addAttribute("sellerlist", sellerlist);
		System.out.println("sellerlist : " + sellerlist);

		return "Admin/admin_seller_list_view";
	}

	@RequestMapping(value = "/AdminUpdateSellerList.ad")
	public String AdminUpdateSellerList(String id, String password, String shopName, String represent, String addrNum,
			String addrRoadName, String addrDetail, String orderReportNum, String name, String telCarrierNum,
			String telAllocationNum, String telDiscretionaryNum, String emailId, String emailAddr, String bankName,
			String bankAccountNum, char delFlag,
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
		seller.setDelFlag(delFlag);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

		String uploadFolder_mail_order_report_img = "C:\\Project156\\upload/mail_order_report_img"; // 원본 업로드 경로

		seller.setOrderReportImg(imgSave(mail_order_report_img, uploadFolder_mail_order_report_img));

		StringBuilder img_path = new StringBuilder("/img/mail_order_report_img/" + str.replace("-", "/") + "/");

		seller.setOrderReportImgPath(img_path.toString());

		seller.setTel(telCarrierNum, telAllocationNum, telDiscretionaryNum);
		seller.setEmail(emailId, emailAddr);
		seller.setAddress(addrNum, addrRoadName, addrDetail);

		service.AdminUpdateSellerList(seller);

		return "redirect:/AdminSellerList.ad";
	}

	// 판매자 비활성 회원 페이지
	@RequestMapping(value = "/AdminSellerDelflagList.ad") // �봽濡쒗븘 - 諛곗넚吏� 愿�由� public
	public String SelectAllSellerDelflagList(Model model, @CurrentUser AccountVO account,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int limit = 10;

		int listcount = service.getSellerDelflagListCount();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<SellerVO> SellerDelflaglist = service.SelectAllSellerDelflagList(hashmap);
		// BuyerVO buyerVo = buyerService.selectOneById(model.get);

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림 처리
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		System.out.println("SellerDelflaglist" + SellerDelflaglist);

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("SellerDelflaglist", SellerDelflaglist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		return "Admin/admin_seller_delflag_list";
	}

	@RequestMapping(value = "/AdminSellerdelflagListView.ad")
	public String SelectSellerdelflagListview(Model model, @CurrentUser AccountVO account, SellerVO seller)
			throws Exception {

		SellerVO sellerDelflaglist = sellerService.selectOneById(seller.getId());

		int addr1 = sellerDelflaglist.getAddress().indexOf("+");
		int addr2 = sellerDelflaglist.getAddress().indexOf("/");

		System.out.println("vo.getAddress()=" + sellerDelflaglist.getAddress());
		model.addAttribute("addrNum", sellerDelflaglist.getAddress().substring(0, addr1));
		System.out.println("vo.getAddress().substring(0, addr1)=" + sellerDelflaglist.getAddress().substring(0, addr1));

		model.addAttribute("addrRoadName", sellerDelflaglist.getAddress().substring(addr1 + 1, addr2));
		System.out.println("vo.getAddress().substring(addr1 + 1, addr2)="
				+ sellerDelflaglist.getAddress().substring(addr1 + 1, addr2));

		model.addAttribute("addrDetail", sellerDelflaglist.getAddress().substring(addr2 + 1));
		System.out
				.println("vo.getAddress().substring(addr2+ 1)=" + sellerDelflaglist.getAddress().substring(addr2 + 1));

		model.addAttribute("sellerDelflaglist", sellerDelflaglist);
		System.out.println("sellerDelflaglist : " + sellerDelflaglist);

		return "Admin/admin_seller_delflag_list_view";
	}
	
	@RequestMapping(value = "/AdminUpdateSellerdelflagList.ad")
	public String AdminUpdateSellerDelflagList(String id, String password, String shopName, String represent, String addrNum,
			String addrRoadName, String addrDetail, String orderReportNum, String name, String telCarrierNum,
			String telAllocationNum, String telDiscretionaryNum, String emailId, String emailAddr, String bankName,
			String bankAccountNum, char delFlag,
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
		seller.setDelFlag(delFlag);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

		String uploadFolder_mail_order_report_img = "C:\\Project156\\upload/mail_order_report_img"; // 원본 업로드 경로

		seller.setOrderReportImg(imgSave(mail_order_report_img, uploadFolder_mail_order_report_img));

		StringBuilder img_path = new StringBuilder("/img/mail_order_report_img/" + str.replace("-", "/") + "/");

		seller.setOrderReportImgPath(img_path.toString());

		seller.setTel(telCarrierNum, telAllocationNum, telDiscretionaryNum);
		seller.setEmail(emailId, emailAddr);
		seller.setAddress(addrNum, addrRoadName, addrDetail);

		service.AdminUpdateSellerDelflagList(seller);

		return "redirect:/AdminSellerDelflagList.ad";

	}

	@RequestMapping(value = "/BoardManagement.ad")
	public String BoardManagement(Model model, @CurrentUser AccountVO account) {

		AdminVO adminAccount = service.selectOneById(account.getId());

		int productBoardCount = service.getAdminBoardProductCount();
		int reviewCount = service.getAdminBoardReviewCount();

		model.addAttribute("productBoardCount", productBoardCount);
		model.addAttribute("reviewCount", reviewCount);

		model.addAttribute("user", adminAccount);

		return "Admin/admin_boardManagement_main";
	}

	// 관리자 게시판 페이지

	@RequestMapping(value = "/AdminBoardProductList.ad")
	public String AdminSelectAllBoardProductList(Model model, @CurrentUser AccountVO account,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int limit = 10;

		int listcount = service.getAdminBoardProductCount();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<BoardProductVO> AdminBoardlist = service.SelectAdminBoardAllList(hashmap);

		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		System.out.println("AdminBoardlist" + AdminBoardlist);

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("AdminBoardlist", AdminBoardlist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		return "Admin/admin_productList";

	}

	// 삭제 기능

	@RequestMapping("/AdminBoardProductListDelete.ad")
	public String AdminBoardProductListDeliveryDelete(@RequestParam(value = "board_num", required = true) int board_num,
			HttpSession session, HttpServletResponse response) throws Exception {

		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("board_num", Integer.toString(board_num));
		int res = service.AdminBoardProductDelete(hashmap);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res == 1) {
			writer.write("<script>alert('삭제 성공!!');" + "location.href='./AdminBoardProductList.ad';</script>");
		} else {
			writer.write("<script>alert('삭제 실패!!');" + "location.href='./AdminBoardProductList.ad';</script>");
		}

		return null;

	}

	// 관리자 댓글 관리 페이지
	@RequestMapping(value = "/AdminBoardReviewList.ad")
	public String AdminSelectAllBoardReviewList(Model model, @CurrentUser AccountVO account,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int limit = 10;

		int listcount = service.getAdminBoardReviewCount();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<BoardReviewVO> AdminBoardReviewlist = service.SelectAdminBoardReviewAllList(hashmap);

		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		System.out.println("AdminBoardReviewlist" + AdminBoardReviewlist);

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("AdminBoardReviewlist", AdminBoardReviewlist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		return "Admin/admin_Board_Review_list";

	}

	// 관리자 댓글 삭제 기능

	@RequestMapping("/AdminBoardReviewListDelete.ad")
	public String AdminBoardReviewListDeliveryDelete(
			@RequestParam(value = "review_num", required = true) int review_num, HttpSession session,
			HttpServletResponse response) throws Exception {

		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("review_num", Integer.toString(review_num));
		int res = service.AdminBoardReviewDelete(hashmap);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res == 1) {
			writer.write("<script>alert('삭제 성공!!');" + "location.href='./AdminBoardReviewList.ad';</script>");
		} else {
			writer.write("<script>alert('삭제 실패!!');" + "location.href='./AdminBoardReviewList.ad';</script>");
		}

		return null;

	}

	// 모든회원
	@RequestMapping(value = "/AdminAllAccountList.ad") // �봽濡쒗븘 - 諛곗넚吏� 愿�由� public
	public String SelectAllAccountList(Model model, @CurrentUser AccountVO account,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int limit = 10;

		int listcount = service.getAllAccountCount();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<AccountVO> allAccountList = service.getAllAccountList(hashmap);
		
		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림 처리
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		System.out.println("allAccountList" + allAccountList);

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("allAccountList", allAccountList);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		return "Admin/admin_allAccount_list";
	}
	
	private String imgSave(MultipartFile imgFile, String uploadFolder) {
		// 저장할 이미지 파일, 저장할 폴더경로
		// 반드시 원본파일을 만들고 난 뒤 사용해야 함

		System.out.println("imgFile : " + imgFile);

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
	

	@PostMapping(value="/loginCheckBuyer.ad" ,produces = "application/json;charset=utf-8" )
	@ResponseBody
	public HashMap<String,Object> loginCheckBuyer(String buyer_id,String buyer_pw) {
		
		HashMap<String,Object> result = new HashMap<String, Object>();
		AccountVO account = service.selectAccountById(buyer_id);
		
		if(account == null) {
			result.put("result", "null");
		}else if(securityService.isPasswordCheck(buyer_pw,account.getPassword())) {
			result.put("password", "Success");
		}else if(!(securityService.isPasswordCheck(buyer_pw, account.getPassword()))) {
			result.put("password", "Fail");
		}else if(account.getMemberType().equals("SELLER")||account.getMemberType().equals("ADMIN")) {
			result.put("result","SELLER");
		}else {
			result.put("result","NOT_SELLER");
		}
		
		
	
		return result;
		
	}
	@PostMapping(value="/loginCheckSeller.ad" ,produces = "application/json;charset=utf-8" )
	@ResponseBody
	public HashMap<String,Object> loginCheckseller(String seller_id,String seller_pw) {
		
		HashMap<String,Object> result = new HashMap<String, Object>();
		AccountVO account = service.selectAccountById(seller_id);
		
		if(account == null) {
			result.put("result", "null");
		}else if(securityService.isPasswordCheck(seller_pw,account.getPassword())) {
			result.put("password", "Success");
		}else if(!(securityService.isPasswordCheck(seller_pw, account.getPassword()))) {
			result.put("password", "Fail");
		}else if(account.getMemberType().equals("SELLER")||account.getMemberType().equals("ADMIN")) {
			result.put("result","SELLER");
		}else {
			result.put("result","NOT_SELLER");
		}
		
		
		
	
		return result;
		
	}
	
	@GetMapping(value = "/JoinChartData.ad")
	@ResponseBody
	public void joinChartData(HttpServletRequest request, HttpServletResponse response
			) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String before3Month = addMonth(-3);
        String before1Month = addMonth(-1);
        String before7Day = addDay(-7);
        String before3Day = addDay(-3);
        
        int join_3monthAgo = service.getJoinChartData(addMonth(-6), before3Month);
        int join_1monthAgo = service.getJoinChartData(before3Month, before1Month);
        int join_7daysAgo = service.getJoinChartData(before1Month, before7Day);
        int join_3daysAgo = service.getJoinChartData(before7Day, before3Day);
        int join_yesterday = service.getJoinChartData(before3Day, addDay(-1));
        
        JSONObject jsonObj = new JSONObject();
    	
    	jsonObj.put("join_3monthAgo", join_3monthAgo);
    	jsonObj.put("join_1monthAgo", join_1monthAgo);
    	jsonObj.put("join_7daysAgo", join_7daysAgo);
    	jsonObj.put("join_3daysAgo", join_3daysAgo);
    	jsonObj.put("join_yesterday", join_yesterday);
        
        out.println(jsonObj.toString());
        
        out.flush();
	}
	
	private String addMonth(int months) {
		
		Date date = new Date();
        SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
        
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, months);
        Date getMonth = cal.getTime();
		
		return sdformat.format(getMonth).toString();
	}
	
    private String addDay(int days) {
		
		Date date = new Date();
        SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
        
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, days);
        Date getDay = cal.getTime();
		
		return sdformat.format(getDay).toString();
	}
}
