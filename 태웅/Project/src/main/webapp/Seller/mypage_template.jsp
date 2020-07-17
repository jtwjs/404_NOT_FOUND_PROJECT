<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<aside id="side">
	<article id="side__profile">
		<dl>
			<dt class="profile-img">
				<img src="./resources/Images/Seller/${user.profileImg}" alt="profile" />
			</dt>
			<dd class="profile-content">
				<p class="seller">판매자</p>
				<p>
					<span id="profile-name">${user.name}</span> 님
				</p>
				<p>
					마지막 접속일자: <span id="last_access_date">${user.loginDate}</span>
				</p>
			</dd>
		</dl>
	</article>
	<article id="side__menu">
		<dl>
			<dt id="menu-profile">프로필</dt>
			<dd id="menu-profile--item">
				<a href="#" onclick="location.href='UpdateSellerAccountForm.se'">회원정보 수정</a>
				<a href="#" onclick="location.href='UpdateSellerPasswordFrom.se'">비밀번호 변경</a>
			</dd>
			<dt id="menu-product">상품내역</dt>
			<dd id="menu-product--item">
				<a href="#" onclick="location.href='SellerProductRegister.se'">상품등록</a>
				<a href="#" onclick="location.href='SellerProductList.se'">상품내역</a>
			</dd>
			<dt id="menu-transaction">거래내역</dt>
			<dd id="menu-transaction--item">
				<a href="#" onclick="location.href='SellerOrderStatus.se'">주문관리</a>
				<a href="#" onclick="location.href='SellerTransactionList.se'">거래목록</a>
				<a href="#" onclick="location.href='SellerCalculateManager.se'">정산관리</a>
			</dd>

			<dt id="menu-quotations">시세정보</dt>
			<dd id="menu-quotations--item">
				<a href="#" onclick="location.href='SellerMarketPriceInfo.se'">시세정보확인하기</a>
			</dd>

			<dt id="menu-qna">Q&A</dt>
			<dd id="menu-qna--item">
				<a href="#" onclick="location.href='SellerProductQNA.se'">상품문의</a> <a
					href="#" onclick="location.href='SellerProductReview.se'">상품후기</a>
			</dd>

		</dl>
	</article>
</aside>

