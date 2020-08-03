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
    public ArrayList<OrderRecordVO> selectOrderListById(String buyer_id,int rowStart, int rowEnd,
    		String startDate, String endDate);
    public int listCount(String buyer_id,String startDate, String endDate);
    public ArrayList<OrderRecordVO> orderBeingDeliveredListById(String buyer_id);
    public ArrayList<OrderRecordVO> orderListAllById(String buyer_id);
   
    public int salesStatusCount(String seller_id);
    public ArrayList<OrderRecordVO> todayOrderRequestListBySellerId(String seller_id);
    public ArrayList<OrderRecordVO> selectOrderListBySellerId(String seller_id);
}
