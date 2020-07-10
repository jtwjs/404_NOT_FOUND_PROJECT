package com.spring.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.boardproduct.BoardProductService;
import com.spring.boardproduct.BoardProductVO;

@Controller
public class OrderController {
	
	@Autowired
	private BoardProductService boardProductService;
	
	@Autowired
	private OrderService orderService;
	
    @RequestMapping(value = "/OrderLogin.or")  // 주문배송 로그인 (회원)
    public String orderLogin() {
    	
    	return "Order/order_login";
    }
    
    @RequestMapping(value = "/OrderNonMember.or")  // 주문배송 로그인 (비회원)
    public String orderNonMember() {
    	
    	return "Order/order_nonMember";
    }
    
    @RequestMapping(value = "/OrderCheck.or")  // 주문내역
    public String orderCheck() {
    	
    	return "Order/order_check";
    }
    
    @RequestMapping(value = "/AddCart.or")  // 장바구니
    public void addCart(HttpServletResponse response, String board_id, int quantity) throws IOException {
    	
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
        if(orderService.getBoardId(board_id, "test") == 1) {
        	
        	out.println("<script>alert('이미 장바구니에 담긴 상품입니다.');history.go(-1);</script>");
        	
        }else {
        	ProductCartVO vo = new ProductCartVO();
        	vo.setBoard_id(board_id);
        	vo.setQuantity(quantity);
        	
        	vo.setBuyer_id("test");  // 임시로 구매자 id test 설정 (세션값으로 받음)
        	
        	UUID uuid = UUID.randomUUID(); // 중복 방지를 위해 랜덤값 생성
        	long getl = ByteBuffer.wrap(uuid.toString().getBytes()).getLong();
        	
        	StringBuilder cart_id = new StringBuilder(
        			vo.getBuyer_id() + "-" + Long.toString(getl, 32));
        	
    		vo.setCart_id(cart_id.toString());
    		
    		if(orderService.insertCart(vo) == 1) {
    			out.println("<script>alert('장바구니에 상품을 담았습니다.');history.go(-1);</script>");
    		}

        }
        
        out.flush();
		
    }

    @RequestMapping(value = "/CartView.or")  // 장바구니
    public String cartView(Model model, HttpSession session) {
    	
    	session.setAttribute("test", "test");  // session에 저장된 id값을 얻어옴 (테스트용으로 test로 설정)
    	String buyer_id = (String)session.getAttribute("test");
    	
    	ArrayList<ProductCartVO> cart_list = orderService.getCartList(buyer_id);
    	ArrayList<BoardProductVO> vo_list = new ArrayList<BoardProductVO>();
    	
    	
    	for(int i = 0; i < cart_list.size(); i++) {
    		BoardProductVO vo = boardProductService.getBoardProductVO(cart_list.get(i).getBoard_id());
    		vo_list.add(vo);
    	}
    	
    	model.addAttribute("cart_list", cart_list);
    	model.addAttribute("vo_list", vo_list);
    	
    	return "Order/order_cart";
    }
    
    @GetMapping(value = "/CartAmountCalc.or")  // 장바구니 수량을 변경했을 때 데이터베이스로 전달
    public void cartAmountCalc(String cart_id, int quantity) {
        
    	ProductCartVO vo = new ProductCartVO();
    	vo.setCart_id(cart_id);
    	vo.setQuantity(quantity);
    	
    	orderService.updateAmount(vo);
    	
    }
    
    @GetMapping(value = "/CartDelete.or")  // 장바구니에서 물건을 선택하고 삭제
    public void cartDelete(String cart_id) {
    	
    	orderService.deleteCart(cart_id);
    	
    }
    
    // order_cart.js에서 json 타입으로 정보를 받아 parsing 하는 방법, 쓰진 않는데 지우지 말 것
//    @PostMapping(value = "/OrderResponse.or")  // 주문서
//    @ResponseBody
//    public String orderResponse(Model model,
//    		@RequestBody String board_id_array) throws org.json.simple.parser.ParseException {
//    	
//    	board_id_array = board_id_array.replaceAll("\\s", "");
//    	
//    	Object obj= JSONValue.parse(board_id_array); 
//    	JSONArray boardIdArray = (JSONArray)obj;
//    	ArrayList<BoardProductVO> vo_list = new ArrayList<BoardProductVO>();
//    	ArrayList<Integer> quantity_list = new ArrayList<Integer>();
//    	
//
//        for(int i = 0; i < boardIdArray.size(); i++) {
//        	
//        	JSONObject boardIdObject = (JSONObject) boardIdArray.get(i);
//        	
//        	vo_list.add(boardProductService.getBoardProductVO(boardIdObject.get("board_id").toString()));
//        	quantity_list.add(Integer.valueOf(boardIdObject.get("quantity").toString()));
//        }
//        
//        model.addAttribute("vo_list" , vo_list);
//    	model.addAttribute("quantity_list" , quantity_list);
//    	
//    	return "Order/order_sheet";
//    }
    
    
    @PostMapping(value = "/OrderSheet.or")  // 주문서  
    public String orderSheet(Model model, String[] board_id, int[] quantity) {
    	
    	
    	ArrayList<BoardProductVO> vo_list = new ArrayList<BoardProductVO>();
    	ArrayList<Integer> quantity_list = new ArrayList<Integer>();
    	
    	for(int i = 0; i < board_id.length; i++) {
    		
    		quantity_list.add(Integer.valueOf(quantity[i]));
    		vo_list.add(boardProductService.getBoardProductVO(board_id[i]));
    	}
  	
    	model.addAttribute("vo_list" , vo_list);
    	model.addAttribute("quantity_list" , quantity_list);

    	return "Order/order_sheet";
    }
    
    @PostMapping(value = "/OrderComplete.or")  // 주문완료
    public String orderComplete(String[] board_id, String[] board_title, String[] seller_id, 
    		int[] amount, int[] price, int[] delivery_price, int tot_price, String status, 
    		String buyer_name, String buyer_phone, String buyer_email, String order_postalCode, 
    		String order_address, String order_name, String order_phone, String order_demand, 
    		String order_delivery, String order_payment, String order_account, HttpSession session) {
    	
    	OrderRecordVO vo = new OrderRecordVO();
    	
    	// 리스트 수 (배열)과 관계 없이 변하지 않는 값 저장
    	// 결제일은 데이터베이스에서 sysdate로 처리, 주문번호는 데이터베이스에서 selectKey 처리
    	// =================================================================
		vo.setUse_point(0);  // 사용적립금은 현재 0으로 고정하여 test
		vo.setTot_price(tot_price);
		vo.setStatus("상품준비중");  // 배송 상태 = 상품준비중 고정
		vo.setBuyer_name(buyer_name);
		vo.setBuyer_phone(buyer_phone);
		vo.setBuyer_email(buyer_email);
		vo.setOrder_postalCode(order_postalCode);
		vo.setOrder_address(order_address);
		vo.setOrder_name(order_name);
		vo.setOrder_phone(order_phone);
		vo.setOrder_demand(order_demand);
		vo.setOrder_delivery("test"); // test
		vo.setOrder_invoicenum("배송준비중입니다");  // 송장번호 고정
		vo.setOrder_payment("testPay");  // test
		vo.setOrder_account("000-111-222222");  // test
		vo.setNon_member_flag('Y'); // test용으로 Y 고정 (회원, 비회원 구분)
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String str = sdf.format(date);
		
		UUID uuid = UUID.randomUUID(); // 중복 방지를 위해 랜덤값 생성
    	long getl = ByteBuffer.wrap(uuid.toString().getBytes()).getLong();
    	
    	StringBuilder long_uuid = new StringBuilder(
    			str + "-" + Long.toString(getl, 32));
		
		vo.setOrder_id(long_uuid.toString());
		
		vo.setBuyer_id("test"); // test
		
		// ====================================================================
		
		for(int i = 0; i < board_id.length; i++) {
	    	
			vo.setBoard_id(board_id[i]);
			vo.setBoard_title(board_title[i]);
			vo.setSeller_id(seller_id[i]);
			vo.setAmount(amount[i]);
			vo.setPrice(price[i]);
			vo.setDelivery_price(delivery_price[i]);	
			
			orderService.insertOrderRecord(vo); // 배열 수 만큼 테이블에 저장
		}
		
		
    	return "Order/order_complete";
    }
}
