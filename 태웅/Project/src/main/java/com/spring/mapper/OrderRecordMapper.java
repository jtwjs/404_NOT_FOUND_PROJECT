package com.spring.mapper;

import com.spring.order.OrderRecordVO;

public interface OrderRecordMapper {

    public int getOrderRecordMaxNum();
    public int insertOrderRecord(OrderRecordVO vo);
}
