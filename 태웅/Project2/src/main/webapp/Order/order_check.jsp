<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    
    <link href="<c:url value='/resources/css/Order/order_check.css'/>" rel="stylesheet" />
    <title>비회원 주문조회</title>
</head>
<body>
    <main id="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="b__member">
                        <h5 class="order_check_tit">
                            비회원 주문확인 / 배송조회</h5>
                        <div class="b__member--order_check_ch">
                            <img src="./resources/Images/Order/order.png">
                            <div class="b__member--text_1">
                                <p>고객님의 주문 배송을 알려드립니다.</p>
                                <p>고객님께서 주문하신 상품의 주문정보 및 배송현황을 확인하실 수 있습니다.</p>
                            </div>
                        </div>
                        <div class="b__member--text_2">
                            <p>주문번호 상세내역</p>
                        </div>

                        <div class="order_content1">
                            <table>
                                
                                    <tr class="order_phone">
                                        <th>휴대폰번호</th>
                                        <td><input name="order_phone" class="order_phone" value="#"></td>
                                    </tr>
                 


                                    <tr class="order_irum">
                                        <th>주문자</th>
                                        <td><input name="order_irum" class="order_irum" value="#"></td>
                                    </tr>



                                    <tr class="order_addr">
                                        <th>배송지 주소</th>
                                        <td><input name="order_addr" class="order_addr" value="#"></td>
                                    </tr>



                                    <tr class="order_addrmemo">
                                        <th>배송시 요청사항</th>
                                        <td><input name="order_addrmemo" class="order_addrmemo" value="#">
                                        </td>
                                    </tr>




                                    <tr class="order_pay">
                                        <th>결제수단</th>
                                        <td><input name="order_pay" class="order_pay" value="#"></td>
                                    </tr>




                                <tr class="order_amount">
                                    <th>결제금액</th>
                                    <td><input name="order_amount" class="order_amount" value="#">
                                    </td>
                                </tr>


                                    <tr class="order_status">
                                        <th>주문상태</th>
                                        <td><input name="order_status" class="order_status" value="#"></td>
                                    </tr>



                                    <tr class="order_parcelnum">
                                        <th>운송장번호</th>
                                        <td><input name="order_parcelnum" class="order_parcelnum" value="#"></td>

                            </table>
                        </div>

                        <div class="b__memberor_order--list">
                            <p>주문상품 내역</p>
                        </div>

                        <div class="order_content2">
                            <table>
                                <thead>
                                    <tr>
                                        <th>상품이미지</th>
                                        <th>주문상품내역</th>
                                        <th>가격</th>
                                        <th>수량</th>
                                        <th>배송비</th>
                                        <th>옵션상품</th>
                                    </tr>
                                    <tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input name="order_list_img" class="order_list_img" value="#"></td>
                                        <td><input name="order_list_name" class="order_list_name" value="#"></td>
                                        <td><input name="order_price" class="order_price" value="#"></td>
                                        <td><input name="order_volume" class="order_volume" value="#"></td>
                                        <td><input name="order_airfreight" class="order_airfreight" value="#"></td>
                                        <td><input name="order_option" class="order_option" value="#"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="buttoms">
                            <button type="button" class="submitBtn1" onclick="location.href='Index.in'">확인</button>
                            <button type="button" class="submitBtn2" onclick="location.href='Index.in'">메인으로</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>





    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>