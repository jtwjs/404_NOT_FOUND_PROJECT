package com.spring.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.buyer.BuyerService;
import com.spring.buyer.BuyerVO;
import com.spring.config.Security.CurrentUser;
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

	@RequestMapping(value = "/AccountManagement.ad")
	public String AccountManagement(Model model, @CurrentUser AccountVO account) {

		AdminVO adminAccount = service.selectOneById(account.getId());

		int allAccountCount = service.getAllAccountCount();
		int buyerAccountCount = service.getBuyerListCount();
		int buyerDelFlagAccountCount = service.getDelflagListCount();
		int serllerAccoutCount = service.getSellerListCount();

//============================== 기석 작업 ========================================================================================
		int sellerDelFlagAccountCount = service.getSellerDelflagListCount();

		model.addAttribute("sellerDelFlagAccountCount", sellerDelFlagAccountCount);
//============================== 기석 작업 ======================================================================================== 	
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
	
	
	
	
	
	
	
	
	
	

// =========================== 기석 작업 ==============================================================

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

		/* System.out.println("buyervo : " + buyervo); */

		System.out.println("imp77777777");
		SellerVO sellerlist = sellerService.selectOneById(seller.getId());
		/*
		 * //프로필 이미지 추가부분 if(sellerlist.getProfileImg() == null ||
		 * sellerlist.getProfileImg() == "") {
		 * sellerlist.setProfileImg("profile-basic.png"); }
		 */

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
	public String AdminUpdateSellerList(SellerVO seller) {

		System.out.println("imp8888");

		String addrNum = seller.getAddrNum();
		String addrRoadName = seller.getAddrRoadName();
		String addrDetail = seller.getAddrDetail();

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
	public String SelectSellerdelflagListview(Model model, @CurrentUser AccountVO account, SellerVO seller) throws Exception {

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
	public String AdminUpdateSellerDelflagList(SellerVO seller) {

		System.out.println("imp9999");

		service.AdminUpdateSellerDelflagList(seller);

		return "redirect:/AdminSellerDelflagList.ad";

	}

}
