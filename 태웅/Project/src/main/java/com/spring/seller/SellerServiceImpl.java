package com.spring.seller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boardproduct.BoardProductVO;
import com.spring.mapper.BoardProductMapper;
import com.spring.mapper.OrderRecordMapper;
import com.spring.mapper.SellerMapper;
import com.spring.order.OrderRecordVO;

@Service
public class SellerServiceImpl implements SellerService {
	@Autowired
	SellerMapper mapper;
	
	@Autowired
	BoardProductMapper boardMapper;
	
	@Autowired
	OrderRecordMapper orderRecordMapper;

	@Autowired
	private SqlSession sqlSession;

	
	
	@Override
	public SellerVO selectOneById(String id) {
		SellerVO sellerAccount = mapper.selectOneById(id);
		return sellerAccount;
	}



	@Override
	public void RegisterSellerAccout(SellerVO seller) {
		mapper.InsertSellerAccout(seller);
	}

	@Override
	public int UpdateSellerAccount(SellerVO seller) {
		int isUpdate = mapper.UpdateSellerAccount(seller);
		return isUpdate;
	}

	@Override
	public int DeleteSellerAccount(String id) {
		int isDelete = mapper.DeleteSellerAccount(id);
		return isDelete;
	}

	@Override
	public ArrayList<BoardProductVO> selectProductListById(String id) {
		ArrayList<BoardProductVO> productList = mapper.selectProductListById(id);
		return productList;
	}

	@Override
	public BoardProductVO BoardSelectOneByBoardId(String board_id) {
		BoardProductVO product = boardMapper.getBoardProductVO(board_id);
		return product;
	}
	
	@Override
	public int getOrderRecordOneByIdListCount(String seller_id) {
		OrderRecordMapper orderRecordMapper = sqlSession.getMapper(OrderRecordMapper.class);

		int res = orderRecordMapper.getOrderRecordOneByIdListCount(seller_id);
		System.out.println("res : " + res);

		return res;
	}
	
	
	@Override
	public List<OrderRecordVO> getOrderRecordOneByIdList(String seller_id, int startrow, int endrow) {
		
		System.out.println("impl111");
		
		OrderRecordMapper orderRecordMapper = sqlSession.getMapper(OrderRecordMapper.class);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("seller_id", seller_id);
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		
		List<OrderRecordVO> vo_list = orderRecordMapper.getOrderRecordOneByIdList(map);
		
		System.out.println("vo_list : " + vo_list);
		
		return vo_list;
	}	

	
}
