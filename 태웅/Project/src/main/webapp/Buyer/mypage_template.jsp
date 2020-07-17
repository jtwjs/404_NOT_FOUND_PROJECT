<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside id="side">
	<article id="side__profile">
	    <dl>
	        <dt class="profile-img">
	            <img src="./resources/Images/Buyer/Avatar 3.png" alt="profile" />
	        </dt>
	        <dd class="profile-content">
	            <p class="buyer">구매자</p>
	            <p><span id="profile-name">${user.name}</span> 님</p>
	            <p>마지막 접속일자: <span id="last_access_date"> ${user.loginDate}</span></p>
	        </dd>
	    </dl>
	</article>
	<article id="side__menu">
	    <dl>
	        <dt id="menu-profile" >
	            프로필
	        </dt>
            <dd id="menu-profile--item">
            	<a href="#" onclick="location.href='UpdateBuyerAccountForm.by'">회원정보 수정</a>
            	<a href="#" onclick="location.href='UpdateBuyerPasswordForm.by'">비밀번호 변경</a>
            	<a href="#" onclick="location.href='BuyerMyPageDeliveryManager.by'">배송지관리</a>
		    </dd>
			<dt id="menu-myShopping">
			    나의 쇼핑 활동
			</dt>
	    	<dd id="menu-myShopping--item">
	      	 	<a href="#" onclick="location.href='BuyerMyPageOrderList.by'">주문내역</a>
				<a href="#" onclick="location.href='BuyerMyPageWishList.by'">찜목록</a>
				<a href="#" onclick="location.href='BuyerMyPageRecentlyView.by'">최근 본 상품</a>
				<a href="#" onclick="location.href='BuyerMyPageReview.by'">구매후기</a>
	    	</dd>
			<dt id="menu-qna">
			    Q&A
			</dt>
	    	<dd id="menu-qna--item">
	        	<a href="#" onclick="location.href='BuyerMyPageProductQna.by'">상품문의</a>
				<a href="#" onclick="location.href='BuyerMyPageServiceQna.by'">1:1문의</a>
            </dd>
		</dl>								           				
  	</article>
</aside>