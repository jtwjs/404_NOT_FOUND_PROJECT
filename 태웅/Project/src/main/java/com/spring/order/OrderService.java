package com.spring.order;

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
    
}
