<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/* 마이페이지 접속했을 때 로그인 상태인지 세션을 통해 확인하고 아닐 경우 메인페이지로 이동
if((String)session.getAttribute("id") != null){
	out.println("<script>alert('로그인해주십시오')"
			+ "location.href='/Index.in'</script>");
	
}*/   
    
    int list_count = 0;
    
%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- 필수영역 -->

 
    <link href="<c:url value='/resources/css/Buyer/mypage_cancleList.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_sidebar.css'/>" rel="stylesheet" />
    <title>취소/반품/교환</title>
</head>
<body>
<main id="main">
    <div class="container">
        <div class="row">
            <jsp:include page="mypage_sidebar.jsp" flush="false"/>
            
            <div class="col-xs-9" id="mypage__cancle-list--content">
                <div class="col-xs-12" id="cacle-list__list--title">
                    <b class="content__tag--b">취소/반품/교환 내역</b>
                    <span class="content__tag--span">total <%=list_count %></span>
                </div>
                <div class="col-xs-12" id="mypage__cancle-list--table">
                <table>
                    <thead>
                        <tr>
                            <td class="cancle-list__date">날짜</td>
                            <td class="cancle-list__num">반품번호</td>
                            <td class="cancle-list__type">반품종류</td>
                            <td class="cancle-list__name">상품명</td>
                            <td class="cancle-list__return-date">반품완료일</td>
                            <td class="cancle-list__status">상태</td>
                        </tr>
                    </thead>
                </table>
            </div>
            </div>
            
        </div>
    </div>
</main>
  <jsp:include page="../footer.jsp" flush="false"/>
        <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
		<script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
</body>
</html>