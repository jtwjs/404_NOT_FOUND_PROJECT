package com.spring.buyer;

import java.util.ArrayList;
import java.util.HashMap;

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
	public BuyerVO selectOneById(String id) {
		
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
	
	@Override
	public int UpdateListDeliverList(deliveryVO delivery) {
		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);
		int result = buyerMapper.UpdateListDeliverList(delivery);
		
		return result;
		
	}





	@Override
	public int selectWishListCountOneById(String buyer_id) {
		WishListMapper wishListMapper = sqlSession.getMapper(WishListMapper.class);
		
		int res = wishListMapper.selectWishListCountOneById(buyer_id);
		
		return res;
	}
	
	
	@Override
	public ArrayList<WishListVO> selectWishList(String buyer_id, int sort_list, int page_num, int page_amount) {
		
		WishListMapper wishListMapper = sqlSession.getMapper(WishListMapper.class);
		
		ArrayList<WishListVO> wishList = new ArrayList<WishListVO>();
		
		wishList = wishListMapper.selectWishList(buyer_id, sort_list, page_num, page_amount);
		
		System.out.println("wishList impl : " + wishList);
				
		return wishList;
	}
	
	@Override
	public int deleteWishList(HashMap<String, String> hashmap) {
		WishListMapper wishListMapper = sqlSession.getMapper(WishListMapper.class);
		int res = wishListMapper.isWishListWriter(hashmap);
		String wish_id = hashmap.get("wish_id");
		if (res == 1) {
			res = wishListMapper.deleteWishList(wish_id);
		}
		return res;
	}	
	
	@Override
	public int InsertListDeliveryList(deliveryVO delivery) {
		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);		
		int result = buyerMapper.InsertListDeliveryList(delivery);
		
		delivery.getDefaultaddress();
		
		return result;
		
	}
	

	@Override
	public deliveryVO getListDeliveryDetail(int num) {

		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);
		deliveryVO delivery = buyerMapper.getListDeliveryDetail(num);
		
		return delivery;
	}

	
	@Override
	public deliveryVO ListDeliveryModifyForm(int num) {

		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);
		System.out.println(num);
		deliveryVO delivery = buyerMapper.getListDeliveryDetail(num);
		
		return delivery;
	}
	
	
	@Override
	public int ListDeliveryModify(deliveryVO delivery) {

		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);
		int res = buyerMapper.ListDeliveryModify(delivery);
		
		return res;
	}



	@Override
	public int ListDeliveryDelete(HashMap<String, String> hashmap) {
		BuyerMapper buyerMapper = sqlSession.getMapper(BuyerMapper.class);
		int res = buyerMapper.isListDelivery(hashmap);
		int num = Integer.parseInt(hashmap.get("num"));
		if(res == 1) {
			
			res = buyerMapper.ListDeliveryDelete(num);
		}
		return res;
	}

	@Override
	public deliveryVO getDefaultDeliveryList(String id) {

		deliveryVO vo = mapper.getDefaultDeliveryList(id);

		return vo;		
	}



	@Override
	public void UpdateDefaultAddress(BuyerVO buyer) {
		mapper.UpdateDefaultAddress(buyer);
		
	}



	@Override
	public void InsertSavePoint(String id, String sp_status, String savingDetails, int point, String board_title,
			String orderId) {
		mapper.InsertSavePoint(id, sp_status, savingDetails, point, board_title, orderId);
		
	}



	@Override
	public void BuyerGradeSetting(BuyerVO buyer) {
		mapper.BuyerGradeSetting(buyer);
		
	}
	
}
	