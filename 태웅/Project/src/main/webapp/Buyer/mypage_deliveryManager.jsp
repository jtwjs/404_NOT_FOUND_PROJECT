<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Buyer/mypage_template.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_deliveryManager.css?after'/>" rel="stylesheet" />
    <title>배송지 관리</title>
</head>
<body>
    <section id="sub-main" class="">
     <div class="sub-top">
        <h2 class="sub-title">마이페이지</h2>
        <ul class="sub-location">
           <li class="home">
             <a href="Index.in"><span class="hide-text">home</span></a>
           </li>
           <li>
             <strong>마이페이지</strong>
           </li>
           <li>
              <strong>배송지 관리</strong>
           </li>
        </ul>
     </div>
     <div class="sub-tab">
        <ul>
           <li>
              <a href="BuyerMyPage.by">
                 <span>마이페이지</span>
              </a>
           </li>
        </ul>
     </div>
   </section>
<main id="main">
    <div class="container">
        <div class="row">
           <div class="col-xs-12">
              <section id="content">
                  <jsp:include page="mypage_template.jsp" flush="false"/>
                  <section id="myPage">
                     <h2 class="content-title">배송지 목록</h2>
                     
                          <div class="contnt__delivery">
                            <div class="site_content1">
                                <h4 class="content-title--site">나의 배송지 목록</h4>
                                <span class="content-pp">자주 쓰는 배송지를 등록 및 관리 하실 수 있습니다.</span>
                                <div class="delivery_Btn">
                                    <button type="button" id="deliveryBtn" class="deliveryBtn"
                                        onclick="location.href='#'">배송지 등록</button></div>
                            </div>

                            <div class="site_content2">
                                <table class="setting_form">
                                    <thead class="setting_form--tabs">
                                        <tr>
                                           <th>배송지명
                                            <th>수령인</th>
                                            <th>주소</th>
                                            <th>연락처</th>
                                            <th><span class="hide">수정/삭제</span></th>
                                        </tr>                                            
                                    </thead>
                                    <tbody class="setting_form--tabs2">
                                       <c:forEach items="${list}" var="list" >
                                        <tr>
                                            <td class="setting_list"><input type="text" name="delivery_list_deliveryName" 
                                                class="member_delivery_deliveryName" value="${list.deliveryName}" readonly />
                                            </td>
                                            <td class="setting_list"><input type="text" name="delivery_list_receiverName" 
                                                class="member_delivery_reciverName" value="${list.receiverName}" readonly />
                                            </td>
                                       <c:set var="address" value="${list.address}"/>
                                       <c:set var="addrIndex" value="${fn:indexOf(address,'+')}"/>
                                       <c:set var="addrLength" value="${fn:length(address)}"/>
                                            <td class="setting_list"><input type="text" name="delivery_list_address" 
                                                class="member_delivery_address" value="${fn:substring(address,addrIndex+1,addrLength)}" readonly />
                                            </td>
                                            <td class="setting_list"><input type="text" name="delivery_list_phone" 
                                                class="member_delivery_phone" value="${list.receiverPhone}" readonly /></td>
                                            <td class="setting_list"> <button type="button" class="modifyBtn"
                                                    onclick="location.href='#'">수정</button>
                                                <button type="button" class="deleteBtn"
                                                    onclick="location.href='#'">삭제</button>
                                            </td> 
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>


                     </section>    
                   </section>      
            </div>
        </div>
    </div>
</main>


    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_menu.js?after'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js'/>" ></script>  
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>