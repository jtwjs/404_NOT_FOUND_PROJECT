<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.order.OrderRecordVO" %>
<%
/* 마이페이지 접속했을 때 로그인 상태인지 세션을 통해 확인하고 아닐 경우 메인페이지로 이동
if((String)session.getAttribute("id") != null){
	out.println("<script>alert('로그인해주십시오')"
			+ "location.href='/Index.in'</script>");
	
}*/    

    ArrayList<OrderRecordVO> orderRecord_list = null;
    if((ArrayList<OrderRecordVO>)request.getAttribute("orderRecord_list") != null){
    	orderRecord_list = (ArrayList<OrderRecordVO>)request.getAttribute("orderRecord_list");
    }
    
    int orderRecord_list_count = 0;
%>
<!DOCTYPE html>
<html>
<head>
     <jsp:include page="../header.jsp" flush="false"/>
    <jsp:include page="../footer.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- 필수영역 -->
    
    <link href="<c:url value='/resources/css/Buyer/mypage_orderCheck.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_sidebar.css'/>" rel="stylesheet" />
    <title>주문/배송 조회</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <jsp:include page="mypage_sidebar.jsp" flush="false"/>
            
            <div class="col-xs-9" id="order-check__content">
                <div class="col-xs-12" id="order-check__content--title">
                    <b class="content__tag--b">주문/배송 조회</b>
                </div>
                <div class="col-xs-12" id="order_check__content--search">
                    <input type="text" placeholder="주문번호,상품명" />
                    <b>주문일</b>
                    <input type="date" /> ~ <input type="date" />
                    <input type="button" value="오늘" /> 
                    <input type="button" value="3일간" /> 
                    <input type="button" value="일주일" /> 
                    <input type="button" value="1개월" /> 
                    <input type="button" value="3개월" /> 
                    <input type="button" value="전체" /> 
                </div>
                <div class="col-xs-12" id="order_check__content--list-title">
                    <b class="content__tag--b">주문 내역</b>
                    <span class="content__tag--span">total <%=orderRecord_list_count %></span>
                </div>
                <div class="col-xs-12" id="order_check__content--list-table">
                    <table>
                        <thead>
                            <tr>
                                <td class="list-table__num">주문번호</td>
                                <td class="list-table__name">상품명</td>
                                <td class="list-table__date">주문일</td>
                                <td class="list-table__price">주문금액</td>
                                <td class="list-table__point">예상 적립</td>
                                <td class="list-table__status">배송 상태</td>
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
                                <td></td>
                            </tr>
                            <%}else{ %>
                            <tr>
                                <td colspan="6" class="list-table--none">검색 결과가 없습니다</td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>