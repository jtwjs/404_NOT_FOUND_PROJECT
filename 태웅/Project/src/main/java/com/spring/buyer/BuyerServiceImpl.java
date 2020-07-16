package com.spring.buyer;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.BuyerMapper;
import com.spring.mapper.WishListMapper;

@Service
public class BuyerServiceImpl implements BuyerService {
	
	@Autowired BuyerMapper mapper;
	@Autowired private SqlSession sqlSession;
	@Autowired WishListMapper wishListMapper;

	
	@Override
	public BuyerVO selectOnById(String id) {
		
		BuyerVO buyerAccount = mapper.selectOneById(id);
		return buyerAccount;
	}
	
	

	@Override
	public void RegisterBuyerAccount(BuyerVO buyer) {
		 mapper.InsertBuyerAccount(buyer);
		
	}

	@Override
	public int UpdateBuyerAccount(BuyerVO buyer) {
		int isUpdate =  mapper.UpdateBuyerAccount(buyer);
		return isUpdate;
	}

	@Override
	public int DeleteBuyerAccount(String id) {
		int isDelete = mapper.DeleteBuyerAccount(id);
		return isDelete;
	}




	@Override
	public ArrayList<BuyerVO> selectListAll() {
		ArrayList<BuyerVO> list = mapper.selectListAll();
		return list;
	}

	public int getWishListOverlapCheck(String board_id, String buyer_id) {
		
		WishListMapper wishListMapper = sqlSession.getMapper(WishListMapper.class);
		int result = wishListMapper.getWishListOverlapCheck(board_id, buyer_id);
		
		return result;
	}
	
	public int insertWishList(WishListVO vo) {
		
		WishListMapper wishListMapper = sqlSession.getMapper(WishListMapper.class);
		int result = wishListMapper.insertWishList(vo);
		
		return result;
	}



	@Override
	public ArrayList<deliveryVO> deliveryListAll(String id) {
		ArrayList<deliveryVO> deliveryList = mapper.deliveryListAll(id);
		return deliveryList;
	}


	@Override
	public ArrayList<SavePointVO> savePointListAll(String id, String status,int rowStart, int rowEnd) throws Exception {
		ArrayList<SavePointVO> pointList = mapper.savePointListAll(id, status, rowStart, rowEnd);
		return pointList;
	}



	@Override
	public int listCount(String id, String status) throws Exception {
		
		return mapper.savePointCountById(id, status);
	}
	
	
}
