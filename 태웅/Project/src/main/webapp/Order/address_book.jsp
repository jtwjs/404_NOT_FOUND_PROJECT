<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/Order/address_book.css?after'/>" rel="stylesheet" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>주소록</title>
</head>
<body>
	<header id="header">
		<h2>주소록</h2>
	</header>
	<main id="main">
		<div class="address-list">
			<ul>
				<li class="list-title">
					<p class="deliveryName">배송지명</p>
					<p class="recipient">수령인</p>
					<p class="address">주소</p>
					<p class="tel">연락처</p>
				</li>
				<c:forEach var="list" items="${list}" varStatus="status">
				<li class="list-item">
					<p class="deliveryName">${list.deliveryName}</p>
					<p class="recipient">${list.receiverName}</p>
					<p class="address">${list.addrRoadName} ${list.addrDetail}</p>
					<p class="tel">${list.receiverPhone}</p>
					<button type="button" class="regBtn" value="${list.address}" >선택</button>
				</li>
				</c:forEach>
			</ul>
				
		</div>
	</main>
	<footer id="footer">
		<p class="cp">	&#169;이웃#  주소록</p>
	</footer>
	<script type="text/javascript" src="<c:url value='/resources/js/Order/address_book.js?after'/>" ></script>
</body>
</html>