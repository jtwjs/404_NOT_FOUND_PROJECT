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

	

	public OrderRecordVO getOrderReceipt(String order_id, String board_id) {

		OrderRecordMapper orderRecordMapper = sqlSession.getMapper(OrderRecordMapper.class);

		OrderRecordVO vo = orderRecordMapper.getOrderReceipt(order_id, board_id);

		return vo;
	}

	public int getOrderRecordListSearchCount(String seller_id, String[] status, String[] order_payment,
			String start_date, String end_date) {

		OrderRecordMapper orderRecordMapper = sqlSession.getMapper(OrderRecordMapper.class);

		int count = orderRecordMapper.getOrderRecordListSearchCount(seller_id, status, order_payment, start_date,
				end_date);

		return count;
	}

	public ArrayList<OrderRecordVO> getOrderRecordListSearch(String seller_id, String[] status, String[] order_payment,
			String start_date, String end_date, int page_num, int page_amount) {

		OrderRecordMapper orderRecordMapper = sqlSession.getMapper(OrderRecordMapper.class);

		ArrayList<OrderRecordVO> vo_list = orderRecordMapper.getOrderRecordListSearch(seller_id, status, order_payment,
				start_date, end_date, page_num, page_amount);

		return vo_list;
	}

	@Override
	public int getOrderRecordOneByIdListCount(String seller_id, String startDate, String endDate) {
		int count = orderRecordMapper.getOrderRecordOneByIdListCount(seller_id, startDate, endDate);
		return count;
	}

	@Override
	public ArrayList<OrderRecordVO> getOrderRecordOneByIdList(String seller_id, int rowStart, int rowEnd, String startDate,
			String endDate) {
		ArrayList<OrderRecordVO> list = orderRecordMapper.getOrderRecordOneByIdList(seller_id, rowStart, rowEnd, startDate, endDate);
		return list;
	}

}
