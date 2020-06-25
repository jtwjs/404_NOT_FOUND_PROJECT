<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.order.OrderRecordVO" %>
<%@ page import="com.spring.boardproduct.BoardQnaVO" %>
<%@ page import="com.spring.boardproduct.BoardReviewVO" %>
<%@ page import="com.spring.buyer.WishListVO" %>
<%
    /* 마이페이지 접속했을 때 로그인 상태인지 세션을 통해 확인하고 아닐 경우 메인페이지로 이동
    if((String)session.getAttribute("id") != null){
    	out.println("<script>alert('로그인해주십시오')"
    			+ "location.href='/Index.in'</script>");
    	
    }*/
    
    // 아이디, 이름 (고객쇼핑정보) 을 받아옴
    String id = null;
    String name = null;
    if((String)request.getAttribute("id") != null){
    	id = (String)request.getAttribute("id");
    }
    if((String)request.getAttribute("name") != null){
    	name = (String)request.getAttribute("name");
    }
    
    
    // 주문내역 리스트
    ArrayList<OrderRecordVO> orderRecord_list = null;
    if((ArrayList<OrderRecordVO>)request.getAttribute("orderRecord_list") != null){
    	orderRecord_list = (ArrayList<OrderRecordVO>)request.getAttribute("orderRecord_list");
    }
    
    // 관심상품 리스트
    ArrayList<WishListVO> wishList_list = null;
    if((ArrayList<WishListVO>)request.getAttribute("wishList_list") != null){
    	wishList_list = (ArrayList<WishListVO>)request.getAttribute("wishList_list");
    }
    
    
    // 내가 쓴 상품 qna 리스트
    ArrayList<BoardQnaVO> boardQna_list = null;
    if((ArrayList<BoardQnaVO>)request.getAttribute("boardQna_list") != null){
    	boardQna_list = (ArrayList<BoardQnaVO>)request.getAttribute("boardQna_list");
    }
    
    // 내가 쓴 상품후기 리스트
    ArrayList<BoardReviewVO> boardReview_list = null;
    if((ArrayList<BoardReviewVO>)request.getAttribute("boardReview_list") != null){
    	boardReview_list = (ArrayList<BoardReviewVO>)request.getAttribute("boardReview_list");
    }
    
%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../header.jsp" flush="false"/>

    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- 필수영역 -->
    
    <link href="<c:url value='/resources/css/Buyer/mypage_main.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_sidebar.css'/>" rel="stylesheet" />
    <title>마이페이지</title>
</head>
<body>
    <div class="container">
        <div class="row">
            
            <jsp:include page="mypage_sidebar.jsp" flush="false"/>
            
            <div class="col-xs-9" id="my-page__content">
                <div id="my-page__content--user">
                    <p><%=name %>(<%=id %>) 고객님의 쇼핑정보 입니다.</p>
                </div>
                
                <div class="col-xs-12" id="my-page__content--order-record">
                    <div id="order-record__list--title">
                        <b>주문내역</b>
                        <a href="BuyerMyPageOrderCheck.by">더보기></a>
                    </div>
                    <div id="order-record__list--table">
                        <table>
                            <thead>
                                <tr>
                                    <td class="order-record__list--date">날짜</td>
                                    <td class="order-record__list--num">주문번호</td>
                                    <td class="order-record__list--name">상품명</td>
                                    <td class="order-record__list--price">주문금액</td>
                                    <td class="order-record__list--status">상태</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%if(orderRecord_list != null){ %>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <%}else{ %>
                                <tr>
                                    <td colspan="5" class="order-record__list--none">주문한 내역이 없습니다</td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div> 
                <!-- my-page__content--order-record end -->
                
                <div class="col-xs-12" id="my-page__content--wish-list">
                    <div id="wish-list__list--title">
                        <b>관심상품</b>
                        <a href="#">더보기></a>
                    </div>
                    
                </div>
                <!-- my-page__content--wish-list end -->
                
            </div>
            <!-- my-page__content end -->
            
            <div class="col-xs-6" id="my-page__content--qna-list">
                    <div id="qna-list__list--title">
                        <b>내가 쓴 Q&A</b>
                        <a href="#">더보기></a>
                    </div>
                    <div id="qna-list__list--table">
                        <table>
                            <%if(boardQna_list != null){%>
                            <tbody>
                                <tr>
                                    <td class="qna-list__list--td"></td>
                                </tr>
                            </tbody>
                            <%}else{ %>
                            <tbody>
                                <tr>
                                    <td class="qna-list__list--td">등록한 문의가 없습니다</td>
                                </tr>
                            </tbody>
                            <%} %>
                        </table>
                    </div>
                </div>
                <!-- my-page__content--qna-list end -->
                
                <div class="col-xs-6" id="my-page__content--review-list">
                    <div id="review-list__list--title">
                        <b>내가 쓴 상품후기</b>
                        <a href="#">더보기></a>
                    </div>
                    <div id="review-list__list--table">
                        <table>
                            <%if(boardQna_list != null){%>
                            <tbody>
                                <tr>
                                    <td class="review-list__list--td"></td>
                                </tr>
                            </tbody>
                            <%}else{ %>
                            <tbody>
                                <tr>
                                    <td class="review-list__list--td">등록한 후기가 없습니다</td>
                                </tr>
                            </tbody>
                            <%} %>
                        </table>
                    </div>
                </div>
                <!-- my-page__content--review-list end -->
            
        </div>
    </div>
    
    
        <jsp:include page="../footer.jsp" flush="false"/>
</body>
</html>