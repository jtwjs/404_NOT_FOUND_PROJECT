package com.spring.mapper;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.order.OrderRecordVO;

@Repository
public interface OrderRecordMapper {

    public int getOrderRecordMaxNum();
    public int insertOrderRecord(OrderRecordVO vo);
    public int getOrderRecordOneByIdListCount(String seller_id);
    public List<OrderRecordVO> getOrderRecordOneByIdList(HashMap<String, Object> hashmap);
    public String[] getOrderID(
    		@Param("board_id")String board_id, @Param("buyer_id")String buyer_id);
    public ArrayList<OrderRecordVO> selectOrderByOrderId(String order_id);
    public ArrayList<OrderRecordVO> selectOrderListById(@Param("buyer_id")String buyer_id,
    		@Param("rowStart")int rowStart, @Param("rowEnd")int rowEnd, @Param("startDate")String startDate, 
    		@Param("endDate")String endDate);
    public int orderListCountById(@Param("buyer_id")String buyer_id,@Param("startDate")String startDate, @Param("endDate")String endDate);
    public ArrayList<OrderRecordVO> orderBeingDeliveredListById(String buyer_id);
    public ArrayList<OrderRecordVO> orderListAllById(String buyer_id);
    public int salesStatusCount(String seller_id);
    public ArrayList<OrderRecordVO> todayOrderRequestListBySellerId(String seller_id);
    public ArrayList<OrderRecordVO> selectOrderListBySellerId(String seller_id);
    public ArrayList<OrderRecordVO> selectOrderListGroupByDate(@Param("seller_id")String seller_id,
    		@Param("rowStart")int rowStart,@Param("rowEnd")int rowEnd, @Param("startDate")String startdate, @Param("endDate")String endDate);
    public int selectCountGroupByDate(@Param("seller_id")String seller_id,@Param("startDate")String startdate,@Param("endDate")String endDate);
    public OrderRecordVO getOrderReceipt(
    		@Param("order_id")String order_id, @Param("board_id")String board_id);
    public int orderReceiptModify(@Param("status")String status, 
    		@Param("order_delivery")String order_delivery, @Param("order_address")String order_address, 
    		@Param("order_name")String order_name, @Param("order_phone")String order_phone, 
    		@Param("order_invoicenum")String order_invoicenum, 
    		@Param("order_id")String order_id, @Param("board_id")String board_id);
    public int getMemberChart(String flag);
    public int orderCancle(@Param("order_id")String order_id, @Param("board_id")String board_id);
    public int orderRefund(@Param("order_id")String order_id, @Param("board_id")String board_id);
    public int orderComplete(@Param("order_id")String order_id, @Param("board_id")String board_id);
    
    public ArrayList<OrderRecordVO> getOrderRecordListSearch(@Param("seller_id")String seller_id, 
    		@Param("status")String[] status, @Param("order_payment")String[] order_payment, 
    		@Param("start_date")String start_date, @Param("end_date")String end_date, 
    		@Param("page_num")int page_num, @Param("page_amount")int page_amount);
    public int getOrderRecordListSearchCount(@Param("seller_id")String seller_id, 
    		@Param("status")String[] status, @Param("order_payment")String[] order_payment, 
    		@Param("start_date")String start_date, @Param("end_date")String end_date);
    
    
    ArrayList<OrderRecordVO> selectOrderListByConfirmation(@Param("buyer_id")String buyer_id,
    		@Param("rowStart")int rowStart, @Param("rowEnd")int rowEnd, @Param("startDate")String startDate, 
    		@Param("endDate")String endDate);
    public int orderListCountByConfirmation(@Param("buyer_id")String buyer_id,@Param("startDate")String startDate, @Param("endDate")String endDate);
    public OrderRecordVO orderDelivery(
    		@Param("order_id")String order_id, @Param("board_id")String board_id);
}

