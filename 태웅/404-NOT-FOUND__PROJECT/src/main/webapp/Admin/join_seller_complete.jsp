<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    
    <link href="<c:url value='/resources/css/Admin/join_seller_complete.css'/>" rel="stylesheet" />
    <title>판매자 회원가입 완료</title>
</head>
<body>
    <main id="main">  
      <div class="container">
         <div class="row">
           <div class="col-xs-12">
              <div class="join__success--success2">      
                <div class="checkimg2">      
                   <img src = "./resources/Images/Admin/checkimg.png"  alt = "check">
                  </div>
                 <h2 class="text_noti2">판매자가입이 완료되었습니다.</h2>   
                 <button type="button" class="join_btn2" onclick="location.href='Index.in'">메인페이지로</button>
              </div>
            </div>
          </div> 
      </div>       
    </main>   


    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
</body>
</html>