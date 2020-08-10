<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside id="side">
	<article id="side__menu">
		<dl>
			<dt id="menu-accountManagement">관리자 페이지 </dt>
			<dd id="menu-accountManagement--item">
			<h6><a href="#" onclick="location.href='AccountManagement.ad'">회원 관리</a></h6>
				<a href="#" onclick="location.href='AdminBuyerList.ad'">구매자회원 관리</a>
				<a href="#" onclick="location.href='AdminSellerList.ad'">판매자회원관리</a> 
				<a href="#" onclick="location.href='AdminBuyerDelflagList.ad'">비활성회원(구매자)관리</a> 
				<a href="#" onclick="location.href='AdminSellerDelflagList.ad'">비활성회원(판매자)관리</a> 
				<a href="#" onclick="location.href='AdminAllAccountList.ad'">모든회원 관리</a>
	         <h6><a href="#" onclick="location.href='BoardManagement.ad'">게시물 관리</a></h6>
				<a href="#"onclick="location.href='AdminBoardProductList.ad'">판매게시글 관리</a> 
				<a href="#" onclick="location.href='AdminBoardReviewList.ad'">구매자리뷰 관리</a>
			</dd>
		</dl>
	</article>
</aside>