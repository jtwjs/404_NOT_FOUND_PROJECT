<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.order.ProductCartVO" %>
<%
    ArrayList<ProductCartVO> cart_list = null;
    if((ArrayList<ProductCartVO>)request.getAttribute("cart_list") != null){
    	cart_list = (ArrayList<ProductCartVO>)request.getAttribute("cart_list");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    
    <link href="<c:url value='/resources/css/Order/order_cart.css'/>" rel="stylesheet" />
    <title>장바구니</title>
</head>
<body>
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
                <table>
                    <thead>
                        <tr>
                            <td><input type="checkbox" checked="checked" class="cart__all-check" /></td>
                            <td class="cart__name">상품명</td>
                            <td class="cart__price">상품금액</td>
                            <td class="cart__delivery-price">배송비</td>
                            <td class="cart__amount">수량</td>
                            <td class="cart__total-price">상품합계금액</td>
                        </tr>
                    </thead>
                    <tbody>
                        <%if(cart_list != null){ %>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <%}else{ %>
                        <tr>
                            <td colspan="6" class="cart__none">장바구니에 담아둔 상품이 없습니다</td>
                        </tr>
                        <%} %>
                        <tr>
                            <td colspan="6" class="cart__payment-amount">
                                <span>상품합계금액 원 + 배송비 원 = 결제금액 원</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <div class="col-xs-12" id="cart__btn">
                <input type="button" value="선택상품 삭제" class="cart__btn--select-delete" 
                    onclick="" />
                <input type="button" value="전체상품 주문하기" class="cart__btn--all-order" 
                    onclick="javascript:location.href='OrderSheet.or'" />
                <input type="button" value="선택상품 주문하기" class="cart__btn--select-order" 
                    onclick="javascript:location.href='OrderSheet.or'" />
                <input type="button" value="쇼핑 계속하기" class="cart__btn--shopping-continue" 
                    onclick="javascript:location.href='Index.in'" />
            </div>
        
        </div>
    
    </div>
    
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
</body>
</html>