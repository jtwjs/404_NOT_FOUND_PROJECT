package com.spring.buyer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BuyerController {
	
    @RequestMapping(value = "/BuyerMyPage.by")  // 구매자 마이페이지 메인
    public String buyerMyPage() {
    	
    	return "Buyer/mypage_main";
    }
    
    @RequestMapping(value = "/BuyerMyPageInfoModify.by")  // 프로필 - 수정하기
    public String buyerMyPageInfoModify() {
    	
    	return "Buyer/mypage_infoModify";
    }
    
    @RequestMapping(value = "/BuyerMyPageDeliveryManager.by")  // 프로필 - 배송지 관리
    public String buyerMyPageDeliveryManager() {
    	
    	return "Buyer/mypage_deliveryManager";
    }
    
    @RequestMapping(value = "/BuyerMyPageOrderList.by")  // 나의 쇼핑 활동 - 주문내역
    public String buyerMyPageOrderList() {
    	
    	return "Buyer/mypage_orderList";
    }
    
    @RequestMapping(value = "/BuyerMyPageWishList.by")  // 나의 쇼핑 활동 - 찜목록
    public String buyerMyPageWishList() {
    	
    	return "Buyer/mypage_wishList";
    }
    
    @RequestMapping(value = "/BuyerMyPageRecentlyView.by")  // 나의 쇼핑 활동 - 최근 본 상품
    public String buyerMyPageRecentlyView() {
    	
    	return "Buyer/mypage_recentlyView";
    }
    
    @RequestMapping(value = "/BuyerMyPageReview.by")  // 나의 쇼핑 활동 - 구매후기
    public String buyerMyPageReview() {
    	
    	return "Buyer/mypage_review";
    }

    @RequestMapping(value = "/BuyerMyPageProductQna.by")  // Q&A - 상품문의
    public String buyerMyPageProductQna() {
    	
    	return "Buyer/mypage_productQna";
    }
    
    @RequestMapping(value = "/BuyerMyPageServiceQna.by")  // Q&A - 1:1 문의
    public String buyerMyPageServiceQna() {
    	
    	return "Buyer/mypage_serviceQna";
    }

}
