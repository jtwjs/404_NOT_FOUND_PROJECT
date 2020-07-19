<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="recent-product">
<sec:authorize access = "isAnonymous()">
	<div class="content-head">
		<h2>오늘 본 상품</h2>
		<p>1/1</p>
	</div>
	<div class="content-body">
		<button type="button" id="up-btn"></button>
		<ul id="product-list">
		<c:if test="${fn:length(non_list)== 0}">
   			<li class="product-list_item">
   			 	
   			</li>
		</c:if>
		<c:forEach items="${non_list}" var="list"  varStatus="status">
			<li class="product-list_item" onclick="javascript:location.href='BoardProductView.bo?board_id='${list.board_id}'">
				<a class="product-img" href="BoardProductView2.bo?board_id=${list.board_id}">
				<img class="product-img" src="${list.product_thum_path}${list.thumbnail_thum}" alt="상품 섬네일 사진">
				</a> 
			</li>
			</c:forEach>
		</ul>
		<button type="button" id="down-btn"></button>
	</div>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_BUYER')">
<div class="content-head">
		<h2>오늘 본 상품</h2>
		<p>1/1</p>
	</div>
	<div class="content-body">
		<button type="button" id="up-btn" class="disable"></button>
		<ul id="product-list">
			<c:if test="${fn:length(list)== 0}">
   			<li class="product-list_item">
   			 	
   			</li>
		</c:if>
			<c:forEach items="${list}" var="list"  varStatus="status">
			<li class="product-list_item" ">
				<a class="product-img" href="BoardProductView2.bo?board_id=${list.board_id}">
				<img class="product-img" src="${list.product_thum_path}${list.thumbnail_thum}" alt="상품 섬네일 사진">
				</a> 
			</li>
			</c:forEach>
		</ul>
		<button type="button" id="down-btn"></button>
	</div>
</sec:authorize>
</div>