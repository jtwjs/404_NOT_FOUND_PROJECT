package com.spring.order;

import java.sql.Date;
import java.util.ArrayList;

public interface OrderService {

	public int getCartNum(String buyer_id);

	public int getBoardId(String board_id, String buyer_id);

	public int insertCart(ProductCartVO vo);

	public ArrayList<ProductCartVO> getCartList(String buyer_id);

	public int updateAmount(ProductCartVO vo);

	public int deleteCart(String cart_id);
	// ====================================================== 카트

	public int insertOrderRecord(OrderRecordVO vo);

	public String[] getOrderID(String board_id, String buyer_id);

	public ArrayList<OrderRecordVO> selectOrderByOrderId(String order_id);

	public ArrayList<OrderRecordVO> selectOrderListById(String buyer_id, int rowStart, int rowEnd, String startDate,
			String endDate);

	public int listCount(String buyer_id, String startDate, String endDate);

	public ArrayList<OrderRecordVO> orderBeingDeliveredListById(String buyer_id);

	public ArrayList<OrderRecordVO> orderListAllById(String buyer_id);

	public int salesStatusCount(String seller_id);

	public ArrayList<OrderRecordVO> todayOrderRequestListBySellerId(String seller_id);

	public ArrayList<OrderRecordVO> selectOrderListBySellerId(String seller_id);

	public ArrayList<OrderRecordVO> selectOrderListGroupByDate(String seller_id, int rowStart, int rowEnd,
			String startDate, String endDate);

	public int selectCountGroupByDate(String seller_id, String startDate, String endDate);

	public int orderReceiptModify(String status, String order_delivery, String order_address, String order_name,
			String order_phone, String order_invoicenum, String order_id, String board_id);

	public int getMemberChart(String flag);

	public int orderCancle(String order_id, String board_id);

	public int orderRefund(String order_id, String board_id);

	public int orderComplete(String order_id, String board_id);

	public ArrayList<OrderRecordVO> selectOrderListByConfirmation(String buyer_id, int rowStart, int rowEnd,
			String startDate, String endDate);

	public int listCountByConfirmation(String buyer_id, String startDate, String endDate);

	public OrderRecordVO orderDelivery(String order_id, String board_id);

	public ArrayList<OrderRecordVO> non_orderResearch(OrderRecordVO vo);
	public int non_orderResearchCount(OrderRecordVO vo);
}
