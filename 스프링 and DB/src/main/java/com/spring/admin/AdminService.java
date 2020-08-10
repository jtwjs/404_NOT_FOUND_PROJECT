package com.spring.admin;

import java.util.HashMap;
import java.util.List;

import com.spring.boardproduct.BoardProductVO;
import com.spring.boardproduct.BoardReviewVO;
import com.spring.buyer.BuyerVO;
import com.spring.seller.SellerVO;

public interface AdminService {
	boolean duplicateCheck(String id);
	public AdminVO selectOneById(String id);
	public AccountVO selectAccountById(String id);
//====================== 하나 기석 작업 ==========================================================	
	
	public int getAllAccountCount();
	public List<AccountVO> getAllAccountList(HashMap<String, Object> hashmap);	
	
	// 구매자 회원 리스트
	public int getBuyerListCount();
	public List<BuyerVO> SelectAllMemberBuyerList(HashMap<String, Object> hashmap);
	public int AdminUpdateBuyerList(BuyerVO buyer);

	// 구매자 비활성 회원 리스트
	public int getDelflagListCount();
	public List<BuyerVO> SelectAllDelflagList(HashMap<String, Object> hashmap);
	public int AdminUpdateBuyerDelflagList(BuyerVO buyer);

	// 판매자 회원 리스트
	public int getSellerListCount();
	public List<SellerVO> SelectAllSellerList(HashMap<String, Object> hashmap);
	public int AdminUpdateSellerList(SellerVO seller);

	// 판매자 비활성 회원 리스트
	public int getSellerDelflagListCount();
	public List<SellerVO> SelectAllSellerDelflagList(HashMap<String, Object> hashmap);
	public int AdminUpdateSellerDelflagList(SellerVO seller);

	// 관리자 게시판 관리 페이지
	public int getAdminBoardProductCount();
	public List<BoardProductVO> SelectAdminBoardAllList(HashMap<String, Object> hashmap);

	// 삭제기능
	public int AdminBoardProductDelete(HashMap<String, String> hashmap);

	// 관리자 댓글 관리 페이지
	public int getAdminBoardReviewCount();
	public List<BoardReviewVO> SelectAdminBoardReviewAllList(HashMap<String, Object> hashmap);

	// 댓글 삭제 관리
	public int AdminBoardReviewDelete(HashMap<String, String> hashmap);
	
	
	public int getJoinChartData(String startSearch, String endSearch);
}
