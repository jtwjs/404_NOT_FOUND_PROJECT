package com.spring.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.AccountVO;
import com.spring.boardproduct.BoardProductService;
import com.spring.boardproduct.BoardProductVO;
import com.spring.buyer.BuyerService;
import com.spring.buyer.BuyerVO;
import com.spring.buyer.deliveryVO;
import com.spring.config.Security.CurrentUser;

@Controller
public class OrderController {
	
	@Autowired
	private BoardProductService boardProductService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private BuyerService buyerService;
	
    @RequestMapping(value = "/OrderLogin.or")  // 주문배송 로그인 (회원)
    public String orderLogin() {
    	
    	return "Order/order_login";
    }
    
    @RequestMapping(value = "/OrderNonMember.or")  // 주문배송 로그인 (비회원)
    public String orderNonMember() {
    	
    	return "Order/order_nonMember";
    }
    

    
    @GetMapping(value = "/AddCart.or")  // 장바구니
    @ResponseBody
    public void addCart(HttpServletRequest request, HttpServletResponse response, 
    		String board_id, String quantity, String buyer_id) throws IOException {
    	
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
    		
    		 if(orderService.getBoardId(board_id, buyer_id) != 0) {
    			 out.println("이미 장바구니에 등록된 상품입니다.");
    	        }else {
    	        	ProductCartVO vo = new ProductCartVO();
    	        	vo.setBoard_id(board_id);
    	        	vo.setQuantity(Integer.valueOf(quantity));
    	        	
    	        	vo.setBuyer_id(buyer_id);  
    	        	
    	        	UUID uuid = UUID.randomUUID(); // 중복 방지를 위해 랜덤값 생성
    	        	long getl = ByteBuffer.wrap(uuid.toString().getBytes()).getLong();
    	        	
    	        	StringBuilder cart_id = new StringBuilder(
    	        			vo.getBuyer_id() + "-" + Long.toString(getl, 32));
    	        	
    	    		vo.setCart_id(cart_id.toString());
    	    		
    	    		if(orderService.insertCart(vo) == 1) {
    	    			out.println("장바구니에 등록되었습니다.");
    	    		}
    	        }
    		 
		out.flush();
		
    }
    @RequestMapping(value = "/CartView.or")  // 장바구니
    public String cartView(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        String buyer_id = auth.getName();
    	
        ArrayList<ProductCartVO> cart_list = null;
        ArrayList<BoardProductVO> vo_list = null;
   	    int[] quantity = null;

   	   if(buyer_id.equals("anonymousUser")) {
   		
   	    Cookie[] cookies = request.getCookies();
   	    
   	    if(cookies == null || cookies.length <= 1) {
   	    	
   	    	return "Order/order_cart";
   	    	
   	    }else{
   	    	
   	        vo_list = new ArrayList<BoardProductVO>();
   	   
   	    
	   	    for(Cookie cookie : cookies){
		    	
		    	if(cookie.getName().equals("nonMember_board_id")){
		    		
		    		int size = 0;
		    		String[] board_id = null;
		    		if(!cookie.getValue().equals("")) {
		    			
		    			String getBoardId = cookie.getValue();
		    			if(getBoardId.charAt(0) == 'a') {
		    				getBoardId.substring(1);
		    			}
		    			cookie.setPath("/");
		    			cookie.setMaxAge(0);
		    			Cookie newCookie = new Cookie("nonMember_board_id", getBoardId);
			    		newCookie.setPath("/");
			    		response.addCookie(newCookie);
		    			
		    		    board_id = getBoardId.split("a");
		    		    size = board_id.length;
		    		}
		    		
		    		for(int i = 0; i < size; i++){
		    			
		    			BoardProductVO vo = boardProductService.getBoardProductVO(board_id[i]);
		        		vo_list.add(vo);
		        		
		    		}
		    		
		    		
		    	}
		    	
		    	if(cookie.getName().equals("nonMember_quantity")){
		    		
		    		int size = 0;
		    		String[] quantityVal = null;
		    		if(!cookie.getValue().equals("")) {
		    			
		    			String getQuantityVal = cookie.getValue();
		    			if(getQuantityVal.charAt(0) == 'a') {
		    				getQuantityVal.substring(1);
		    			}
		    			
		    			cookie.setPath("/");
		    			cookie.setMaxAge(0);
		    			
		    			Cookie newCookie = new Cookie("nonMember_quantity", getQuantityVal);
			    		newCookie.setPath("/");
			    		response.addCookie(newCookie);
		    			
		    			quantityVal = getQuantityVal.split("a");
	     			    quantity = new int[quantityVal.length];
	     			    size = quantityVal.length;
	     			    
		    		}
	 	    		
	     			for(int i = 0; i < size; i++){
	     				quantity[i] = Integer.valueOf(quantityVal[i]);
	     				
	     			}
	     			
	     		}
		    	
	   	    }
	   	    
	   	 }
   	   
   	   }else {
   		   
   		   
   		   int cart_list_size = 0;
   		   
        	cart_list = orderService.getCartList(buyer_id);
        	
        	if(cart_list != null) {
        		
        		vo_list = new ArrayList<BoardProductVO>();
        		cart_list_size = cart_list.size();
        		quantity = new int[cart_list_size];
        		
             	for(int i = 0; i < cart_list_size; i++) {
             		BoardProductVO vo = boardProductService.getBoardProductVO(cart_list.get(i).getBoard_id());
             		vo_list.add(vo);
             		
             		quantity[i] = cart_list.get(i).getQuantity();
             	}
        	}
         	
       }
   	    
   	    
    	if(cart_list != null) {
            model.addAttribute("cart_list", cart_list);
    	}
    	if(quantity != null) {
            model.addAttribute("quantity", quantity);
    	}
    	if(vo_list != null) {
    		model.addAttribute("vo_list", vo_list);
    	}
    	
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
    
//     order_cart.js에서 json 타입으로 정보를 받아 parsing 하는 방법, 쓰진 않는데 지우지 말 것
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
    public String orderSheet(Model model, String[] board_id, int[] quantity, String buyer_id) {
    	System.out.println("buyer_idㅡㅡ"+buyer_id);
    	for(int i=0; i<board_id.length; i++) {
    		System.out.println(i+"-"+board_id[i]);
    	}
    	for(int i=0; i<quantity.length;i++) {
    		System.out.println(i+"-"+quantity[i]);
    	}
    	
    	String str = "";
    	
    	if(buyer_id.length() > 10) {
    		str = buyer_id.substring(0,9);
    	}
    	
    	if(!str.equals("nonMember")) {
    	System.out.println(buyer_id);
    	BuyerVO buyerAccount = buyerService.selectOneById(buyer_id);
    	int index1 = buyerAccount.getAddress().indexOf("+");
    	int index2 = buyerAccount.getAddress().indexOf("/");
    	buyerAccount.setAddrNum(buyerAccount.getAddress().substring(0,index1));
    	buyerAccount.setAddrRoadName(buyerAccount.getAddress().substring(index1+1,index2));
    	buyerAccount.setAddrDetail(buyerAccount.getAddress().substring(index2+1));
    	buyerAccount.setTelCarrierNum(buyerAccount.getTel().substring(0,3));
    	buyerAccount.setTelAllocationNum(buyerAccount.getTel().substring(3,7));
    	buyerAccount.setTelDiscretionaryNum(buyerAccount.getTel().substring(7));
    	if(buyerAccount.getProfileImg() != null && buyerAccount.getProfileImgPath() != null) {
    	try {
			buyerAccount.setProfileImg(URLEncoder.encode(buyerAccount.getProfileImg(),"UTF-8"));
			buyerAccount.setProfileImgPath(URLEncoder.encode(buyerAccount.getProfileImgPath(),"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	}
    	
    	model.addAttribute("user",buyerAccount);
    	
    	}
    	ArrayList<BoardProductVO> vo_list = new ArrayList<BoardProductVO>();
    	ArrayList<Integer> quantity_list = new ArrayList<Integer>();
    	for(int i = 0; i < board_id.length; i++) {
    		
    		quantity_list.add(Integer.valueOf(quantity[i]));
    		vo_list.add(boardProductService.getBoardProductVO(board_id[i]));
    	}
    	
    	
    	model.addAttribute("buyer_id", buyer_id);
    	model.addAttribute("vo_list" , vo_list);
    	model.addAttribute("quantity_list" , quantity_list);
    	return "Order/order_sheet";
    }
    	
    
    
    @PostMapping(value = "/OrderComplete.or")  // 주문완료
    public String orderComplete(String[] board_id, String[] board_title, String[] seller_id,
    		int[] save_point, int[] amount, int[] price, int[] delivery_price, int tot_price, String status, 
    		String buyer_name, String buyer_phone, String buyer_email, String addrNum, 
    		String order_address, String order_name, String order_phone, String order_demand, 
    		String order_delivery, String order_payment, String order_account, String buyer_id,
    		int reserveUse,int expected_sp,@RequestParam(value ="payment-method")String pay_method, String member_flag
    		,Model model) {
    	System.out.println("expected"+expected_sp);
    	System.out.println("buyer_id"+buyer_id);
    	OrderRecordVO vo = new OrderRecordVO();
    	
    	
    	// 리스트 수 (배열)과 관계 없이 변하지 않는 값 저장
    	// 결제일은 데이터베이스에서 sysdate로 처리, 주문번호는 데이터베이스에서 selectKey 처리
    	// =================================================================
		vo.setUse_point(reserveUse);  // 사용적립금은 현재 0으로 고정하여 test
		vo.setTot_price(tot_price);
		vo.setStatus("상품준비중");  // 배송 상태 = 상품준비중 고정
		vo.setBuyer_name(buyer_name);
		vo.setBuyer_phone(buyer_phone);
		vo.setBuyer_email(buyer_email);
		vo.setOrder_postalCode(addrNum);
		vo.setOrder_address(order_address);
		vo.setOrder_name(order_name);
		vo.setOrder_phone(order_phone);
		vo.setOrder_demand(order_demand);
		vo.setOrder_delivery("롯데택배"); //구현안함ㅋ
		vo.setOrder_invoicenum("배송준비중입니다");  // 송장번호 고정
		vo.setOrder_payment(pay_method);  
		if(pay_method.equals("카카오페이")) {
		vo.setOrder_account("카카오페이");  
		}else{
			vo.setOrder_account("000-111-222222");
		}
		if(member_flag.equals("Y")) {
			vo.setNon_member_flag("Y"); //비회원
		} else {
			vo.setNon_member_flag("N"); //회원
		}
		System.out.println("2");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String str = sdf.format(date);
		
		UUID uuid = UUID.randomUUID(); // 중복 방지를 위해 랜덤값 생성
    	long getl = ByteBuffer.wrap(uuid.toString().getBytes()).getLong();
    	
    	
    	StringBuilder long_uuid = new StringBuilder(
    			str + "-" + Long.toString(getl).replaceAll("[^0-9]", "").substring(0,10));
		
		vo.setOrder_id(long_uuid.toString());
		
		vo.setBuyer_id(buyer_id); // test
		
		System.out.println("3");
		
		for(int i = 0; i < board_id.length; i++) {
			if(vo.getNon_member_flag().equals("N")) {
	    		if(reserveUse != 0 ) {
				buyerService.InsertSavePoint(buyer_id,"사용","적립금결제",reserveUse, board_title[i], vo.getOrder_id());
	    		}
	    		BoardProductVO productVO = new BoardProductVO();
				productVO.setBoard_id(board_id[i]);
				productVO.setSeller_id(seller_id[i]);
				productVO.setQuantity(amount[i]);
				
				boardProductService.updateProductStock(productVO);
			}
			vo.setBoard_id(board_id[i]);
			vo.setBoard_title(board_title[i]);
			vo.setSeller_id(seller_id[i]);
			vo.setAmount(amount[i]);
			vo.setPrice(price[i]);
			vo.setDelivery_price(delivery_price[i]);	
			
			System.out.println("");
			System.out.println("========================================");
			
			System.out.println(vo.getAmount());
			System.out.println(vo.getBoard_id());
			System.out.println(vo.getBoard_title());
			System.out.println(vo.getBuyer_email());
			System.out.println(vo.getBuyer_id());
			System.out.println(vo.getBuyer_name());
			System.out.println(vo.getBuyer_phone());
			System.out.println(vo.getDelivery_price());
			System.out.println(vo.getOrder_account());
			System.out.println(vo.getNon_member_flag());
			System.out.println(vo.getOrder_address());
			System.out.println(vo.getOrder_delivery());
			System.out.println(vo.getOrder_demand());
			System.out.println(vo.getOrder_id());
			System.out.println(vo.getOrder_invoicenum());
			System.out.println(vo.getOrder_name());
			System.out.println(vo.getOrder_num());
			System.out.println(vo.getOrder_payment());
			System.out.println(vo.getOrder_phone());
			System.out.println(vo.getOrder_postalCode());
			System.out.println(vo.getPrice());
			System.out.println(vo.getSeller_id());
			
			System.out.println(vo.getStatus());
			System.out.println(vo.getTot_price());
			System.out.println(vo.getUse_point());
			
			System.out.println("========================================");
			System.out.println();
			orderService.insertOrderRecord(vo); // 배열 수 만큼 테이블에 저장
		}
		
		System.out.println("test");
		
		
			int index1 = vo.getOrder_address().indexOf("+");
			int index2 = vo.getOrder_address().indexOf("/");
			vo.setOrder_address(vo.getOrder_address().substring(index1+1,index2)
			+ " " +vo.getOrder_address().substring(index2+1));
		
			
		model.addAttribute("order",vo);
		
    	return "Order/order_complete";
    }
    

    
    /*적립금 전액 사용*/
    @RequestMapping(value = "/savePointFullUse.or", method = RequestMethod.POST,
    produces = "application/json;charset=utf-8")
    @ResponseBody
    public int fullUseSavePoint(@CurrentUser AccountVO account) {
    	String id = account.getId();
    	BuyerVO buyerAccount = buyerService.selectOneById(id);
    	int savePoint = buyerAccount.getSavePoint();
    	
    	return savePoint;
    	
    }
    
    @RequestMapping(value = "/orderBeingDelivered.or", method = RequestMethod.POST,
    		produces = "application/json;charset=utf-8")
    @ResponseBody
    public HashMap<String,Object> orderBeingDelivered(@CurrentUser AccountVO account) {
    	String buyer_id = account.getId();
    	ArrayList<OrderRecordVO> list = orderService.orderBeingDeliveredListById(buyer_id);
    	System.out.println("list사이즈:"+list.size());
    	HashMap<String,Object> map = new HashMap<String,Object>();
    	String order_id = "";
    	
    	if(list.size() != 0) {
    		order_id = list.get(0).getOrder_id();
    		map.put("result",order_id);
    	}else {
    		map.put("result","empty");
    	}
    	
    	return map;
    }
    
    
    @RequestMapping(value = "/OrderResearch.or")
    public String OrderResearch(@CurrentUser AccountVO account,@RequestParam("order_id")String order_id, Model model) {
    	ArrayList<OrderRecordVO> list = orderService.selectOrderByOrderId(order_id);
    	for(int i=0; i<list.size(); i++) {
    		try {
				list.get(i).setThumbnail_thum(URLEncoder.encode(list.get(i).getThumbnail_thum(),"UTF-8"));
				list.get(i).setThumbnail_thum_path(URLEncoder.encode(list.get(i).getThumbnail_thum_path(),"UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
    		int index1 = list.get(i).getOrder_address().indexOf("+");
    		int index2 = list.get(i).getOrder_address().indexOf("/");
    		list.get(i).setOrder_address(list.get(i).getOrder_address().substring(index1+1,index2)+" "+
    					list.get(i).getOrder_address().substring(index2+1));
    	}
    
    	
    	model.addAttribute("list",list);
    	return "Order/order_research";
    }
    
    @RequestMapping(value = "/non-OrderResearch.or")
    public String non_OrderResearch(@RequestParam("order_id")String order_id, Model model){
    	ArrayList<OrderRecordVO> list = orderService.selectOrderByOrderId(order_id);
    	for(int i=0; i<list.size(); i++) {
    		try {
				list.get(i).setThumbnail_thum(URLEncoder.encode(list.get(i).getThumbnail_thum(),"UTF-8"));
				list.get(i).setThumbnail_thum_path(URLEncoder.encode(list.get(i).getThumbnail_thum_path(),"UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
    		int index1 = list.get(i).getOrder_address().indexOf("+");
    		int index2 = list.get(i).getOrder_address().indexOf("/");
    		list.get(i).setOrder_address(list.get(i).getOrder_address().substring(index1+1,index2)+" "+
    					list.get(i).getOrder_address().substring(index2+1));
    	}
    
    	
    	model.addAttribute("list",list);
    	return "Order/order_research";
    }
    
    @GetMapping(value="/non-OrderResearchByInfo.or")
    public String non_OrderResearchByInfo(@RequestParam("userIrum")String name, @RequestParam("userPhone")String tel,Model model){
    	
    	OrderRecordVO vo = new OrderRecordVO();
    	vo.setBuyer_name(name);
    	vo.setBuyer_phone(tel);
    	ArrayList<OrderRecordVO> search_list = orderService.non_orderResearch(vo);
    	
    	ArrayList<OrderRecordVO> list = orderService.selectOrderByOrderId(search_list.get(0).getOrder_id());
    	
    	for(int i=0; i<list.size(); i++) {
    		try {
				list.get(i).setThumbnail_thum(URLEncoder.encode(list.get(i).getThumbnail_thum(),"UTF-8"));
				list.get(i).setThumbnail_thum_path(URLEncoder.encode(list.get(i).getThumbnail_thum_path(),"UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
    		int index1 = list.get(i).getOrder_address().indexOf("+");
    		int index2 = list.get(i).getOrder_address().indexOf("/");
    		list.get(i).setOrder_address(list.get(i).getOrder_address().substring(index1+1,index2)+" "+
    					list.get(i).getOrder_address().substring(index2+1));
    	}
    	
    	model.addAttribute("list",list);
    	return "Order/order_research";
    }
    
	@RequestMapping(value = "/non-orderCheck.or", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> non_orderCheck(String name, String tel) {
		HashMap<String,Object> result = new HashMap<>();
		OrderRecordVO vo = new OrderRecordVO();
		vo.setBuyer_name(name);
		vo.setBuyer_phone(tel);
		int count = orderService.non_orderResearchCount(vo);
		
		if(count == 0) {
			result.put("result", "Fail");
		}else {
			result.put("result","Success");
		}
		
		return result;
	}
    
    
    /*주소록팝업창*/
    @RequestMapping(value = "/addrBook_popup.or")
    public String addrBookPopup(Model model, @CurrentUser AccountVO account) {
    	ArrayList<deliveryVO> list  = buyerService.deliveryListAll(account.getId());
    	for(int i=0; i<list.size(); i++) {
    		int index1 = list.get(i).getAddress().indexOf("+");
    		int index2 = list.get(i).getAddress().indexOf("/");
    		list.get(i).setAddrRoadName(list.get(i).getAddress().substring(index1+1,index2));
    		list.get(i).setAddrDetail(list.get(i).getAddress().substring(index2+1));
    		
    	}
    	model.addAttribute("list",list);
    	return "Order/address_book";
    }
    
    @RequestMapping(value = "/OrderReceiptModify.or")
    @ResponseBody
    public void orderReceiptModify(@RequestParam(value="status", required=false)String status, 
    		@RequestParam(value="order_delivery", required=false)String order_delivery, 
    		@RequestParam(value="order_address", required=false)String order_address, 
    		@RequestParam(value="order_name", required=false)String order_name, 
    		@RequestParam(value="order_phone", required=false)String order_phone, 
    		@RequestParam(value="order_invoicenum", required=false)String order_invoicenum, 
    		String order_id, String board_id) {
    	
//    	System.out.println(status);
//    	System.out.println(order_delivery);
//    	System.out.println(order_address);
//    	System.out.println(order_name);
//    	System.out.println(order_phone);
//    	System.out.println(order_invoicenum);
//    	System.out.println(order_id);
//    	System.out.println(board_id);
    	
    	if(orderService.orderReceiptModify(status, order_delivery, order_address, order_name, 
    			order_phone, order_invoicenum, order_id, board_id) == 1) {
    		
    	}
    	
    }
    
    @GetMapping(value = "/MemberChartData.or")
    @ResponseBody
    public void memberChartData(HttpServletRequest request, HttpServletResponse response
			) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        
        int member = orderService.getMemberChart("Y");
        int nonMember = orderService.getMemberChart("N");
        
        JSONObject jsonObj = new JSONObject();
    	
    	jsonObj.put("member", member);
    	jsonObj.put("nonMember", nonMember);
        
        out.println(jsonObj.toString());
        
        
        out.flush();
    	
    }
    
    @GetMapping(value = "/OrderCancle.or")
    @ResponseBody
    public void orderCancle(String order_id, String board_id) {
    	
    	if(orderService.orderCancle(order_id, board_id) == 1) {
    		
    	}
    	
    }
    
    @GetMapping(value = "/OrderRefund.or")
    @ResponseBody
    public void orderRefund(String order_id, String board_id) {
    	
    	if(orderService.orderRefund(order_id, board_id) == 1) {
    		
    	}
    	
    }
    
    @GetMapping(value = "/OrderConfirmation.or")
    @ResponseBody
    public void orderComplete(String order_id, String board_id,@CurrentUser AccountVO account) {
    	ArrayList<OrderRecordVO> orderList = orderService.selectOrderByOrderId(order_id);
    			System.out.println("orderList[1]:"+orderList.size());    	
    	if(orderService.orderComplete(order_id, board_id) == 1) {
    		for(int i=0; i<orderList.size(); i++) {
    			System.out.println("orderList["+i+"]:"+orderList.get(i));
    			int save_point =(int)((orderList.get(i).getPrice() * orderList.get(i).getAmount())*0.03);
    		buyerService.InsertSavePoint(account.getId(),"적립", "주문결제", save_point,"주문결제 적립 +"+orderList.get(i).getBoard_title(), orderList.get(i).getOrder_id());
    		}
    	}
    	
    }
    
    @GetMapping(value = "/OrderDelivery.or")
    @ResponseBody
    public void orderDelivery(HttpServletRequest request, HttpServletResponse response, 
    		String order_id, String board_id) throws IOException {
    	
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        OrderRecordVO vo = orderService.orderDelivery(order_id, board_id);
        
    	JSONObject jsonObj = new JSONObject();
        	
        jsonObj.put("delivery", vo.getOrder_delivery());
        jsonObj.put("invoicenum", vo.getOrder_invoicenum());
            
        out.println(jsonObj.toString());
    		
        
        out.flush();
    	
    }
    
    
    

    
}
