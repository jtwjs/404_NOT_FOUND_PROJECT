package com.spring.order;

import java.sql.Date;
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
    
    @Autowired
    private OrderRecordMapper mapper;
    
	
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

	@Override
	public ArrayList<OrderRecordVO> selectOrderByOrderId(String order_id) {
		ArrayList<OrderRecordVO> list = mapper.selectOrderByOrderId(order_id);
		return list;
	}


	@Override
	public ArrayList<OrderRecordVO> selectOrderListById(String buyer_id, int rowStart, int rowEnd,String startDate, String endDate) {
		ArrayList<OrderRecordVO> list = mapper.selectOrderListById(buyer_id,rowStart,rowEnd,startDate,endDate);
		
		
		
		if(list.size() != 0) {
		    System.out.println("test: " + list.get(0).getOrder_date());
		}else {
			System.out.println("통과3");
		}
		return list;
	}

	@Override
	public int listCount(String buyer_id,String startDate, String endDate) {
		int count = mapper.orderListCountById(buyer_id,startDate,endDate);
		return count;
	}

	@Override
	public ArrayList<OrderRecordVO> orderBeingDeliveredListById(String buyer_id) {
		ArrayList<OrderRecordVO> list = mapper.orderBeingDeliveredListById(buyer_id);
		return list;
	}

	@Override
	public ArrayList<OrderRecordVO> orderListAllById(String buyer_id) {
		ArrayList<OrderRecordVO> list = mapper.orderListAllById(buyer_id);
		return list;
	}


	@Override
	public int salesStatusCount(String seller_id) {
		int count = mapper.salesStatusCount(seller_id);
		return count;
	}

	@Override
	public ArrayList<OrderRecordVO> todayOrderRequestListBySellerId(String seller_id) {
		ArrayList<OrderRecordVO> list = mapper.todayOrderRequestListBySellerId(seller_id);
		return list;
	}

	@Override
	public ArrayList<OrderRecordVO> selectOrderListBySellerId(String seller_id) {
		ArrayList<OrderRecordVO> list = mapper.selectOrderListBySellerId(seller_id);
		return list;
	}

	@Override
	public ArrayList<OrderRecordVO> selectOrderListGroupByDate(String seller_id, int rowStart, int rowEnd,
			String startDate, String endDate) {
		ArrayList<OrderRecordVO> list = mapper.selectOrderListGroupByDate(seller_id, rowStart, rowEnd, startDate, endDate);
		return list;
	}

	@Override
	public int selectCountGroupByDate(String seller_id, String startDate, String endDate) {
		int count = mapper.selectCountGroupByDate(seller_id, startDate, endDate);
		return count;
	}



    
    
}
