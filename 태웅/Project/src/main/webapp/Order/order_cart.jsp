<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.nio.ByteBuffer" %>
<%@ page import="com.spring.order.ProductCartVO" %>
<%@ page import="com.spring.boardproduct.BoardProductVO" %>

<%int login_case = 0; 
String buyer_id = "";%>
<sec:authorize access="isAuthenticated()">
    <sec:authentication var="user" property="principal.username" />
    <%login_case = 1; 
    buyer_id = pageContext.getAttribute("user").toString();%>
</sec:authorize>
<%
    
    int totProductPrice = 0;
    int totDeliveryPrice = 0;
    int vo_list_size = 0;
    int[] quantity = {0};
    if((int[])request.getAttribute("quantity") != null){
	    quantity = (int[])request.getAttribute("quantity");
    }

    ArrayList<BoardProductVO> vo_list = null;
    if((ArrayList<BoardProductVO>)request.getAttribute("vo_list") != null){
        vo_list = (ArrayList<BoardProductVO>)request.getAttribute("vo_list");
        vo_list_size = vo_list.size();
        for(int i = 0; i < vo_list.size(); i++){
            totProductPrice += (vo_list.get(i).getPrice() * quantity[i]);
        }
        
        
        for(int i = 0; i < vo_list.size(); i++){
        	totDeliveryPrice += vo_list.get(i).getDelivery_price();
        } 
    }

    ArrayList<ProductCartVO> cart_list = null;
    String[] cart_id = null;
    if((ArrayList<ProductCartVO>)request.getAttribute("cart_list") != null){
	    cart_list = (ArrayList<ProductCartVO>)request.getAttribute("cart_list");
	    
	    cart_id = new String[cart_list.size()];
	    quantity = new int[cart_list.size()];
	    for(int i = 0; i < cart_list.size(); i++){
	    	cart_id[i] = cart_list.get(i).getCart_id();
	    	quantity[i] = cart_list.get(i).getQuantity();
	    }
	}else{
		
		if(vo_list_size != 0){
			cart_id = new String[vo_list_size];
		}
		
		
	    for(int i = 0; i < vo_list_size; i++){
	    	
	    	UUID uuid = UUID.randomUUID(); // 중복 방지를 위해 랜덤값 생성
        	long getl = ByteBuffer.wrap(uuid.toString().getBytes()).getLong();
        	
        	StringBuilder cart_id_val = new StringBuilder(
        			buyer_id + "-" + Long.toString(getl, 10));
	    	
	    	cart_id[i] = cart_id_val.toString();
	    }
	}
    
%>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
   <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Common/sub_main.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Order/order_cart.css?after'/>" rel="stylesheet" />
    <title>장바구니</title>
</head>
<body>
<section id="sub-main" class="cartView">
	  <div class="sub-top">
	  	<h2 class="sub-title">장바구니</h2>
	  	<ul class="sub-location">
	  		<li class="home">
	  		  <a href="Index.in"><span class="hide-text">home</span></a>
	  		</li>
	  		<li>
	  		  <strong>장바구니</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li>
	  			<a href="CartView.or">
	  				<span>장바구니</span>
	  			</a>
	  		</li>
	  	</ul>
	  </div>
	</section>
<main id="main">
    <div class="container">
        <div class="row">
            <div class="col-xs-12" id="order__title">
                <img src="./resources/Images/Order/order_mark.png" /><br/>
                <span>장바구니</span>
            </div>
            

            <div class="col-xs-4" id="order__step-1">
                <span>STEP01</span><br/>
                <b>장바구니</b>
            </div>
            <div class="col-xs-4" id="order__step-2">
                <span>STEP02</span><br/>
                <b>주문서 작성/결제</b>
            </div>
            <div class="col-xs-4" id="order__step-3">
                <span>STEP03</span><br/>
                <b>주문접수/완료</b>
            </div>
            
            <div class="col-xs-12" id="cart__table">
                <table id="cart-table">
                    <thead>
                        <tr>
                            <td><input type="checkbox" checked="checked" id="cart__all-check" 
                                onclick="allCheckBox_check(this);" /></td>
                            <td class="cart__name" colspan="2">상품명</td>
                            <td class="cart__price">상품금액</td>
                            <td class="cart__delivery-price">배송비</td>
                            <td class="cart__amount">수량</td>
                            <td class="cart__total-price">상품합계금액</td>
                        </tr>
                    </thead>
                    <tbody id="cart-table-tbody">
                        <%if(vo_list_size != 0){ 
                            for(int i = 0; i < vo_list.size(); i++){ %>
                        <tr>
                            <td><input type="checkbox" class="cart__check" checked="checked" 
                                onclick="checkBox_check();"/>
                                <input type="hidden" class="board_id_check" value="<%=vo_list.get(i).getBoard_id() %>" />
                            </td>
                            <td class="cart__td--img">
                            <img src="<%=vo_list.get(i).getThumbnail_thum_path() %><%=vo_list.get(i).getThumbnail_thum()%>">
                            </td>
                            <td class="cart__td--title">
                                <a href="BoardProductView.bo?board_id=<%=vo_list.get(i).getBoard_id()%>"><%=vo_list.get(i).getTitle() %></a>
                            </td>
                            <td class="cart__td--price"><%=vo_list.get(i).getPrice() %></td>
                            <td class="cart__td--delivery-price"><%=vo_list.get(i).getDelivery_price() %></td>
                            <td>
                                <input type="hidden" value="<%=cart_id[i] %>" class="cart_id" name="cart_id" />
                                <input type="button" value="-" class="quantity-minus-btn" 
                                    onclick="btnQuantityChange(this.value, '<%=i %>', '<%=vo_list.get(i).getPrice() %>', '<%=vo_list.get(i).getDelivery_price() %>', '<%=vo_list.get(i).getQuantity() %>');" />
                                <input type="text" value="<%=quantity[i] %>" maxlength="2" 
                                    class="quantity-input" oninput="onInputCheck(this, '<%=vo_list.get(i).getQuantity() %>', '<%=quantity[i] %>');" 
                                    onchange="tableTotPriceChange(this.value, '<%=i %>', '<%=vo_list.get(i).getPrice() %>', '<%=vo_list.get(i).getDelivery_price() %>', '<%=login_case %>');" />
                                <input type="button" value="+" class="quantity-plus-btn" 
                                    onclick="btnQuantityChange(this.value,'<%=i %>', '<%=vo_list.get(i).getPrice() %>', '<%=vo_list.get(i).getDelivery_price() %>', '<%=vo_list.get(i).getQuantity() %>');" />
                            </td>
                            <td class="table__tot-price">
                            <%=(vo_list.get(i).getPrice() * quantity[i]) + vo_list.get(i).getDelivery_price() %>
                            </td>
                        </tr>
                        <%  }
                        }else{ %>
                        <tr>
                            <td colspan="7" class="cart__none">장바구니에 담아둔 상품이 없습니다</td>
                        </tr>
                        <%} %>
                        <tr>
                            <td colspan="7" class="cart__btn--delete">
                                <input type="button" value="선택상품 삭제" id="cart__btn--select-delete" 
                                    onclick="btn_select_delete('<%=login_case %>');" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <form id="orderForm" method="post" action="OrderSheet.or">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
            
            <div class="col-xs-12" id="cart__calc">
                <table id="cart__calc--table">
                    <thead>
                        <tr>
                            <th>상품합계금액 
                                <!-- <div><em class="table__plus-mark">+</em></div> -->
                            </th>
                            <th>총 배송비 
                                <!-- <em class="table__equal-mark">=</em>  -->
                            </th>
                            <th>결제금액</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="cart__payment-amount">
                            <td>
                                <input type="text" value="<%=totProductPrice %> 원" readonly
                                    id="product__tot-price" />
                            </td>
                            <td>
                                <input type="text" value="<%=totDeliveryPrice %> 원" readonly 
                                    id="delivery__tot-price"/>
                            </td>
                            <td>
                                <input type="text" value="<%=totProductPrice + totDeliveryPrice %> 원" 
                                    readonly id="cart__tot-price" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <div class="col-xs-12" id="cart__btn">
                <input type="button" value="선택상품 주문하기" class="cart__btn--select-order" 
                    onclick="btn_order('<%=login_case %>', '<%=buyer_id %>');" />
                <input type="button" value="쇼핑 계속하기" class="cart__btn--shopping-continue" 
                    onclick="javascript:location.href='Index.in'" />
            </div>
        
        </div>
    
    </div>

</main>
    
    <script type="text/javascript" src="<c:url value='/resources/js/Order/order_cart.js?after'/>" ></script>   
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>