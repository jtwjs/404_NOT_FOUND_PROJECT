<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- header, css -->
<jsp:include page="../header.jsp" flush="false" />
<link href="<c:url value='/resources/css/module/reset.css?after'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/header.css?after'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/footer.css?after'/>"
	rel="stylesheet" />
<!-- header, css end -->
<link href="<c:url value='/resources/css/Common/sub_main.css?after'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/Admin/join_select.css?after'/>"
	rel="stylesheet" />
<title>회원가입</title>
</head>
<body>
	<section id="sub-main" class="serviceCenter">
		<div class="sub-top">
			<h2 class="sub-title">회원가입</h2>
			<ul class="sub-location">
				<li class="home"><a href="Index.in"><span class="hide-text">home</span></a>
				</li>
				<li><strong>회원가입</strong></li>
			</ul>
		</div>
		<div class="sub-tab">
			<ul>
				<li><a href="JoinSelect.ad"> <span>회원가입</span>
				</a></li>
			</ul>
		</div>
	</section>
	<main id="main">

		<section class="join__main">
			<div class="join__main--title">
				<h2>회원가입</h2>
			</div>
			<div class="join__main--content">
				<h2 class="join__main--content--title">
					<span class="brand-title">이웃</span>#에 오신것을 환영합니다.<span
						class="enter">해당하는 회원 유형을 선택해주세요.</span>
				</h2>
				<div class="join__main--content--sort">
					<div class="join--buyer"
						onclick="javascript:location.href='JoinBuyer.ad'">
						<h2 class="join--type">
							개인구매회원<span class="enter">가입</span>
						</h2>
						<p class="join--content">구매를 원하시는 분은 이쪽을 클릭해 주세요!</p>
						<!-- <div class="easy-signUp">
                                    <dl>
                                        <dt>간편회원</dt>
                                        <dd>자주 사용하는 SNS 아이디로 간편하게 가입하실 수 있습니다.</dd>
                                        <dd class="sns-wrap">
                                            <a href="#" class="naver-btn"  title="네이버로 가입"><span class="hide-text">네이버로 가입</span></a>
                                            <a href="#" class="kakao-btn" title="카카오로 가입"><span class="hide-text">카카오로 가입</span></a>
                                            <a href="#" class="facebook-btn" title="페이스북으로 가입"><span class="hide-text">페이스북으로 가입</span></a>
                                        </dd>
                                    </dl>
                                </div> -->
					</div>
					<div class="join--seller"
						onclick="javascript:location.href='JoinSeller.ad'">
						<h2 class="join--type">
							판매사업자회원<span class="enter">가입</span>
						</h2>
						<p class="join--content">
							판매를 원하시는 분은 이쪽을 클릭해 주세요!<br> (사업자등록증을 보유한 판매회원)
						</p>
					</div>
				</div>
			</div>
		</section>

	</main>

	<!-- footer,js -->
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/footer.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/header.js?after'/>"></script>
	<!-- footer,js end -->
</body>
</html>