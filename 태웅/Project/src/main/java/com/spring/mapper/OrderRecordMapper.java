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
}
