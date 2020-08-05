package com.spring.seller;

import java.util.ArrayList;
import java.util.List;

import com.spring.boardproduct.BoardProductVO;
import com.spring.order.OrderRecordVO;

public interface SellerService {
	SellerVO selectOneById(String id);

	void RegisterSellerAccout(SellerVO seller);

	int UpdateSellerAccount(SellerVO seller);

	int DeleteSellerAccount(String id);

	ArrayList<BoardProductVO> selectProductListById(String id);

	BoardProductVO BoardSelectOneByBoardId(String board_id);

	public int getOrderRecordOneByIdListCount(String seller_id);

	public List<OrderRecordVO> getOrderRecordOneByIdList(String seller_id, int startrow, int endrow);

	public OrderRecordVO getOrderReceipt(String order_id, String board_id);

	public int getOrderRecordListSearchCount(String seller_id, String[] status, String[] order_payment,
			String start_date, String end_date);

	public ArrayList<OrderRecordVO> getOrderRecordListSearch(String seller_id, String[] status, String[] order_payment,
			String start_date, String end_date, int page_num, int page_amount);

}
