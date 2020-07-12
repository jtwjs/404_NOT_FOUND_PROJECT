package com.spring.buyer;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.BuyerMapper;

@Service
public class BuyerServiceImpl implements BuyerService {
	
	@Autowired BuyerMapper mapper;
	@Autowired private SqlSession sqlSession;


	
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
	public boolean duplicateCheck(String id) {
		int count = mapper.selectCountById(id);
		System.out.println("count :" + count);
		
		return count==1?true:false;
	}



	@Override
	public ArrayList<BuyerVO> selectListAll() {
		ArrayList<BuyerVO> list = mapper.selectListAll();
		return list;
	}

	public int getWishListOverlapCheck(String board_id, String buyer_id) {
		
		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);
		int result = buyerMapper.getWishListOverlapCheck(board_id, buyer_id);
		
		return result;
	}
	
	public int insertWishList(WishListVO vo) {
		
		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);
		int result = buyerMapper.insertWishList(vo);
		
		return result;
	}



	@Override
	public ArrayList<deliveryVO> deliveryListAll(String id) {
		ArrayList<deliveryVO> list = mapper.deliveryListAll(id);
		return list;
	}
	
	
}
