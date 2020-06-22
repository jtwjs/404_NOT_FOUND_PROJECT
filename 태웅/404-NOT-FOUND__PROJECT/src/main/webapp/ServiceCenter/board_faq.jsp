<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.spring.service.BoardFaqVO" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<BoardFaqVO> list = null;
    if((ArrayList<BoardFaqVO>)request.getAttribute("list") != null){
    	list = (ArrayList<BoardFaqVO>)request.getAttribute("list");
    }
    
%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../header.jsp" flush="false"/>
    <jsp:include page="../footer.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    
    <link href="<c:url value='/resources/css/ServiceCenter/serviceCenter_board.css'/>" rel="stylesheet" />
    <title>자주하는질문</title>
</head>
<body>
    <div class="container">
        <div class="row">
        
            <div class="col-xs-3" id="center-sidebar">
                <div class="col-xs-12" id="center-sidebar__title">
                    <b>고객센터</b>
                </div>
                <div class="col-xs-12" id="center-sidebar__notice" onclick="location.href='BoardNotice.sc'">
                    <b>공지사항</b>
                </div>
                <div class="col-xs-12" id="center-sidebar__faq" onclick="location.href='BoardFaq.sc'">
                    <b>자주묻는질문</b>
                </div>
                <div class="col-xs-12" id="center-sidebar__qna" onclick="location.href='BoardQna.sc'">
                    <b>고객문의</b>
                </div>
            </div>
            
            <div class="col-xs-9" id="center-list">
                 <div class="col-xs-12" id="center-list__title">
                     <b>자주묻는질문</b>
                 </div>
                 <div class="col-xs-12" id="center-list__table">
                      <table>
                          <thead>
                             <tr>
                                 <td class="center-list__table--num">번호</td>
                                 <td class="center-list__table--title">제목</td>
                                 <td class="center-list__table--date">작성일</td>
                                 <td class="center-list__table--hit">조회</td>
                             </tr>
                          </thead>
                          <tbody>
                              <%if(list == null){ %>
                              <tr>
                                  <td colspan="4" class="center-list__table--none-content">등록된 게시글이 없습니다</td>
                              </tr>
                              <%}else{ %>
                              <tr>
                                  <td></td>
                                  <td></td>
                                  <td></td>
                                  <td></td>
                              </tr>
                              <%} %>
                          </tbody>
                      </table>
                 </div>
                 <div class="col-xs-12" id="center-list__num">
                 </div>
            </div>
        </div>
    </div>
</body>
</html>