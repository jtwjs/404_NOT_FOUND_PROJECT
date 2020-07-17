package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.order.OrderRecordVO;

public interface OrderRecordMapper {

    public int getOrderRecordMaxNum();
    public int insertOrderRecord(OrderRecordVO vo);
    public int getOrderRecordOneByIdListCount(String seller_id);
    public List<OrderRecordVO> getOrderRecordOneByIdList(HashMap<String, Object> hashmap);
}
