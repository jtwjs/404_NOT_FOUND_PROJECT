<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside id="side">
	<article id="side__profile">
	    <dl>
	        <dt class="profile-img">
	            <img src="display?path=${user.profileImgPath}&name=${user.profileImg}" alt="profile" />
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
            	<a href="#" id="item1" onclick="location.href='UpdateBuyerAccountForm.by'">회원정보 수정</a>
            	<a href="#" id="item2" onclick="location.href='UpdateBuyerPasswordForm.by'">비밀번호 변경</a>
            	<a href="#" id="item3" onclick="location.href='BuyerMyPageDeliveryManager.by'">배송지관리</a>
		    </dd>
			<dt id="menu-myShopping">
			    나의 쇼핑 활동
			</dt>
	    	<dd id="menu-myShopping--item">
	      	 	<a href="#" id="item4" onclick="location.href='BuyerMyPageOrderList.by'">주문내역</a>
				<a href="#" id="item5" onclick="location.href='BuyerMyPageWishList.by'">찜목록</a>
				<a href="#" id="item6" onclick="location.href='BuyerMyPageRecentlyView.by'">최근 본 상품</a>
				<a href="#" id="item7" onclick="location.href='BuyerMyPageReview.by'">구매후기</a>
	    	</dd>
			<dt id="menu-qna">
			    Q&A
			</dt>
	    	<dd id="menu-qna--item">
	        	<a href="#" id="item8" onclick="location.href='BuyerMyPageProductQna.by'">상품문의</a>
				<a href="#" id="item9" onclick="location.href='BuyerMyPageServiceQna.by'">1:1문의</a>
            </dd>
		</dl>								           				
  	</article>
</aside>