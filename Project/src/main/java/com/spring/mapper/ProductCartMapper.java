package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.order.ProductCartVO;

public interface ProductCartMapper {

	public int getCartNum(String buyer_id);
    public int getBoardId(@Param("board_id")String board_id, @Param("buyer_id")String buyer_id);
    public int insertCart(ProductCartVO vo);
    public ArrayList<ProductCartVO> getCartList(String buyer_id);
    public int updateAmount(ProductCartVO vo);
    public int deleteCart(String cart_id);
}
