package com.spring.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boardproduct.BoardProductVO;
import com.spring.boardproduct.BoardReviewVO;
import com.spring.buyer.BuyerVO;
import com.spring.mapper.AdminMapper;
import com.spring.mapper.BoardProductMapper;
import com.spring.mapper.BoardReviewMapper;
import com.spring.mapper.BuyerMapper;
import com.spring.mapper.SellerMapper;
import com.spring.seller.SellerVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper mapper;

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private BuyerMapper buyerMapper;

	@Autowired
	private SellerMapper sellerMapper;

	@Override
	public boolean duplicateCheck(String id) {

		int count = mapper.selectCountById(id);
		System.out.println("count :" + count);

		return count != 0 ? true : false;
	}

	@Override
	public AdminVO selectOneById(String id) {
		AdminVO adminAccount = mapper.selectOneById(id);
		return adminAccount;
	}
	
	
	
	
	
	
	
	
	
	
	
//====================== 하나 기석 작업 ==========================================================		
	

	@Override
	public int getAllAccountCount() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int res = adminMapper.getAllAccountCount();
		return res;
	}

	@Override
	public int getBuyerListCount() {
		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);
		int res = buyerMapper.getBuyerListCount();
		return res;
	}

	@Override
	public List<BuyerVO> SelectAllMemberBuyerList(HashMap<String, Object> hashmap) {
		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);

		System.out.println("buyerMapper impl111 : " + buyerMapper);
		List<BuyerVO> buyerlist = buyerMapper.SelectAllMemberBuyerList(hashmap);
		System.out.println("buyerlist impl222 : " + buyerlist);

		return buyerlist;
	}

	@Override
	public int AdminUpdateBuyerList(BuyerVO buyer) {
		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);

		int isUpdateBuyerList = buyerMapper.AdminUpdateBuyerList(buyer);

		return isUpdateBuyerList;
	}

	// 구매자 비활성 회원 리스트
	@Override
	public int getDelflagListCount() {
		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);
		int res = buyerMapper.getDelflagListCount();
		return res;
	}

	@Override
	public List<BuyerVO> SelectAllDelflagList(HashMap<String, Object> hashmap) {
		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);

		System.out.println("buyerMapper impl111 : " + buyerMapper);
		List<BuyerVO> Delflaglist = buyerMapper.SelectAllDelflagList(hashmap);
		System.out.println("buyerlist impl222 : " + Delflaglist);

		return Delflaglist;
	}

	@Override
	public int AdminUpdateBuyerDelflagList(BuyerVO buyer) {
		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);

		int isUpdateDelflagList = buyerMapper.AdminUpdateBuyerDelflagList(buyer);

		return isUpdateDelflagList;
	}

	// 판매자 회원 목록 페이지
	@Override
	public int getSellerListCount() {
		SellerMapper sellerMapper = sqlSession.getMapper(SellerMapper.class);
		int res = sellerMapper.getSellerListCount();
		return res;
	}

	@Override
	public List<SellerVO> SelectAllSellerList(HashMap<String, Object> hashmap) {
		SellerMapper sellerMapper = sqlSession.getMapper(SellerMapper.class);

		System.out.println("buyerMapper impl111 : " + buyerMapper);
		List<SellerVO> sellerlist = sellerMapper.SelectAllSellerList(hashmap);
		System.out.println("buyerlist impl222 : " + sellerlist);

		return sellerlist;
	}

	@Override
	public int AdminUpdateSellerList(SellerVO seller) {
		SellerMapper sellerMapper = sqlSession.getMapper(SellerMapper.class);

		int isUpdateSellerList = sellerMapper.AdminUpdateSellerList(seller);

		return isUpdateSellerList;
	}

	// 판매자 비활성 회원 페이지
	@Override
	public int getSellerDelflagListCount() {
		SellerMapper sellerMapper = sqlSession.getMapper(SellerMapper.class);
		int res = sellerMapper.getSellerDelflagListCount();

		return res;

	}

	@Override
	public List<SellerVO> SelectAllSellerDelflagList(HashMap<String, Object> hashmap) {
		SellerMapper sellerMapper = sqlSession.getMapper(SellerMapper.class);

		List<SellerVO> SellerDelflaglist = sellerMapper.SelectAllSellerDelflagList(hashmap);

		return SellerDelflaglist;

	}

	@Override
	public int AdminUpdateSellerDelflagList(SellerVO seller) {
		SellerMapper sellerMapper = sqlSession.getMapper(SellerMapper.class);

		int isUpdateSellerDelflagList = sellerMapper.AdminUpdateSellerDelflagList(seller);

		return isUpdateSellerDelflagList;

	}

	// 판매자 게시판 관리 페이지

	@Override
	public int getAdminBoardProductCount() {

		BoardProductMapper boardproductMapper = sqlSession.getMapper(BoardProductMapper.class);

		int res = boardproductMapper.getAdminBoardProductCount();

		return res;

	}

	@Override
	public List<BoardProductVO> SelectAdminBoardAllList(HashMap<String, Object> hashmap) {
		BoardProductMapper boardproductMapper = sqlSession.getMapper(BoardProductMapper.class);

		List<BoardProductVO> AdminBoardlist = boardproductMapper.SelectAdminBoardAllList(hashmap);

		return AdminBoardlist;

	}

	@Override
	public int AdminBoardProductDelete(HashMap<String, String> hashmap) {
		BoardProductMapper boardproductMapper = sqlSession.getMapper(BoardProductMapper.class);

		int res = boardproductMapper.isAdminBoardList(hashmap);
		int board_num = Integer.parseInt(hashmap.get("board_num"));
		if (res == 1) {

			res = boardproductMapper.AdminBoardProductDelete(board_num);
		}
		return res;
	}

	@Override
	public int getAdminBoardReviewCount() {
		BoardReviewMapper boardreviewMapper = sqlSession.getMapper(BoardReviewMapper.class);

		int res = boardreviewMapper.getAdminBoardReviewCount();

		return res;
	}

	@Override
	public List<BoardReviewVO> SelectAdminBoardReviewAllList(HashMap<String, Object> hashmap) {
		BoardReviewMapper boardreviewMapper = sqlSession.getMapper(BoardReviewMapper.class);
		List<BoardReviewVO> BoardReviewlist = boardreviewMapper.SelectAdminBoardReviewAllList(hashmap);
		return BoardReviewlist;
	}

	@Override
	public int AdminBoardReviewDelete(HashMap<String, String> hashmap) {
		BoardReviewMapper boardreviewMapper = sqlSession.getMapper(BoardReviewMapper.class);

		int res = boardreviewMapper.isAdminBoardReviewList(hashmap);
		int review_num = Integer.parseInt(hashmap.get("review_num"));
		if (res == 1) {

			res = boardreviewMapper.AdminBoardReviewDelete(review_num);
		}
		return res;
	}

	@Override
	public List<AccountVO> getAllAccountList(HashMap<String, Object> hashmap) {
		List<AccountVO> list = mapper.getAllAccountList(hashmap);
		return list;
	}

	@Override
	public AccountVO selectAccountById(String id) {
		AccountVO account = mapper.selectAccountById(id);
		return account;
	}
	
	public int getJoinChartData(String startSearch, String endSearch) {
		
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int res = adminMapper.getJoinChartData(startSearch, endSearch);
		return res;
	}
	
}
