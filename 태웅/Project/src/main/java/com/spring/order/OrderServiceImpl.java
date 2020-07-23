package com.spring.order;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.OrderRecordMapper;
import com.spring.mapper.ProductCartMapper;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

    @Autowired
    private SqlSession sqlSession;
	
    public int getCartNum(String buyer_id) {
		
        ProductCartMapper productCartMapper = sqlSession.getMapper(ProductCartMapper.class);
        int result = productCartMapper.getCartNum(buyer_id);
		
        return result;
		
	}
	
    public int getBoardId(String board_id, String buyer_id) {
		
        ProductCartMapper productCartMapper = sqlSession.getMapper(ProductCartMapper.class);
        int result = productCartMapper.getBoardId(board_id, buyer_id);
		
        return result;
    }
	
    public int insertCart(ProductCartVO vo) {
		
        ProductCartMapper productCartMapper = sqlSession.getMapper(ProductCartMapper.class);
        int result = productCartMapper.insertCart(vo);
		
        return result;
    }
	
    public ArrayList<ProductCartVO> getCartList(String buyer_id) {
		
    	ProductCartMapper productCartMapper = sqlSession.getMapper(ProductCartMapper.class);
    	ArrayList<ProductCartVO> vo_list = productCartMapper.getCartList(buyer_id);
		
    	return vo_list;
    }
    
    public int updateAmount(ProductCartVO vo) {
    	
    	ProductCartMapper productCartMapper = sqlSession.getMapper(ProductCartMapper.class);
        int result = productCartMapper.updateAmount(vo);
		
        return result;
    }
    
    public int deleteCart(String cart_id) {
    	
    	ProductCartMapper productCartMapper = sqlSession.getMapper(ProductCartMapper.class);
        int result = productCartMapper.deleteCart(cart_id);
		
        return result;
    }
    
   // ======================================================================================== 
    
    
    public int insertOrderRecord(OrderRecordVO vo) {
    	
    	OrderRecordMapper orderRecordMapper = sqlSession.getMapper(OrderRecordMapper.class);
        int result = orderRecordMapper.insertOrderRecord(vo);
		
        return result;
    }
    
    public String[] getOrderID(String board_id, String buyer_id) {
   	 // 주문한 상품 중 14일 이내의 주문번호를 가져옴 (날짜는 데이터베이스 내에서 처리)
   	
   	OrderRecordMapper orderRecordMapper = sqlSession.getMapper(OrderRecordMapper.class);
   	String[] result = orderRecordMapper.getOrderID(board_id, buyer_id);
		
       return result;
   }
}
