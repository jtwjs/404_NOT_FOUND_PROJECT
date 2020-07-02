<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Admin/terms_use.css?after'/>" rel="stylesheet" />
    <title>개인정보처리방침</title>
</head>
<body>
<section id="sub-main" class="serviceCenter">
	  <div class="sub-top">
	  	<h2 class="sub-title">개인정보처리방침</h2>
	  	<ul class="sub-location">
	  		<li class="home">
	  		  <a href="Index.in"><span class="hide-text">home</span></a>
	  		</li>
	  		<li>
	  		  <strong>개인정보처리방침</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li>
	  			<a href="privacyPolicy.ad">
	  				<span>개인정보처리방침</span>
	  			</a>
	  		</li>
	  	</ul>
	  </div>
	</section>
	<main id="main">
	<!-- contents -->
<!-- contents -->
		<section id="contents">
			<h2 class="page_title">개인정보처리방침</h2>
			<div class="terms_wrap">
				<p class="terms_cont">
					쌤픽은 이용자의 정보를 소중하게 생각하며, [정보통신망 이용 촉진 및 정보보호 등에 관한 법률][개인정보보호법][통신비밀보호법]등 관련법규를 준수하기 위하여 <span class="color_05">[개인정보 취급방침]</span>을 제정하고 이를 준수하고 있습니다.<br />
					쌤픽 개인정보보호정책은 정부의  지침 변경 및 수정 등의 이유로 변경될 수 있으므로 회원님께서는 홈페이지 방문 시 수시로 확인하여 주시기 바랍니다.
				</p>

				<p class="terms_title">1조 (총칙)</p>
				<p class="terms_cont">
					① 개인정보란 생존하는 개인에 관한 정보로서 성명, 휴대폰번호, 개인식별정보 등을 통하여 개인을 알아볼 수 있는 정보(해당 정보만으로 특정 개인을 알아볼 수 없더라도 다른 정보와 쉽게 결합하여 알아볼 수 있는 것을 포함)를 말합니다.<br />
					② 쌤픽 (이하 “당사”라 합니다) 는 소중한 회원의 개인정보를 안전하게 처리하기 위하여, [정보통신망 이용촉진 및 정보보호 등에 관한 법률]및[개인정보보호법]등 개인정보보호 관련 법령을 준수하고 있으며 개인정보취급방침을 통하여 회원께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br />
					③ 당사는 개인정보취급방침을 홈페이지 첫 화면에 공개함으로써 회원께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다.<br />
					④ 개인정보취급방침의 지속적인 개선을 위하여 개인정보취급방침을 개정하는데 필요한 절차를 정하고 있으며, 개정 시 버전번호 등을 부여하여 개정된 사항을 회원께서 쉽게 알아볼 수 있도록 하고 있습니다.
				</p>


				<p class="terms_title">2조 (수집하는 개인정보 항목 및 방법)</p>
				<div class="terms_cont">
					① 당사는 별도의 회원가입 절차 없이 대부분의 콘텐츠에 자유롭게 접근할 수 있습니다.<br />
					당사의 서비스를 이용하시고자 할 경우 다음의 정보를 회원의 동의를 받아 수집할 수 있으며 선택사항의 동의를 거부하시는 경우에도 회원가입 및 구매결제 등 필수서비스는 이용할 수 있습니다.<br />
					단, 일부 부가서비스는 제한될 수 있습니다.<br />
					- 회원가입 및 서비스 이용 시 수집하는 개인정보
					<table class="list">
						<caption>1:1문의 리스트</caption>
						<colgroup>
							<col style="width:80px" class="t_layout_tcl">
							<col style="width:auto" class="t_layout_tcl">
							<col style="width:auto" class="">
							<col style="width:40%" class="t_layout_tcl">
							<col style="width:auto" class="t_layout_tcl">
							<col style="width:auto" class="t_layout_tcl">
						</colgroup>
						<thead>
							<tr>
								<th colspan="3" class="t_layout_tc">구분</th>
								<th class="t_layout_tc">수집항목</th>
								<th class="t_layout_tc">이용목적</th>
								<th class="t_layout_tc">보유기간</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="5" class="t_layout_tc" >회원</td>
								<td class="t_layout_tc">가입 : 필수</td>
								<td class="t_layout_tc">회원정보</td>
								<td class="text_l">
									<p class="t_layout_b">성명,회원ID, 비밀번호, 생년월일, 휴대번호,이메일</p>
									<!-- 모바일 시작 -->
									<div class="t_con_b">
										<div class="goods_cell_info">
											<ul class="other_list">
												<li><p class="title">구분</p><p class="data">회원 가입:필수 - 회원정보</p></li>
												<li><p class="title">수집항목</p><p class="data">성명,회원ID, 비밀번호, 생년월일, 휴대번호,이메일</p></li>
												<li><p class="title">이용목적</p><p class="data">서비스 이용</p></li>
											</ul>
										</div>
									</div>
									<!-- 모바일 끝 -->
								</td>
								<td class="t_layout_tc text_l">서비스 이용</td>
								<td rowspan="8" class="t_layout_tc">법정 의무 보유기간<br />또는 회원탈퇴 시</td>
							</tr>
							<tr>
								<td rowspan="2" class="t_layout_tc">주문 : 필수</td>
								<td class="t_layout_tc">배송정보</td>
								<td class="text_l">
									<p class="t_layout_b">주문자/수취인 성명, 연락처,이메일, 배송지 주소</p>
									<!-- 모바일 시작 -->
									<div class="t_con_b">
										<div class="goods_cell_info">
											<ul class="other_list">
												<li><p class="title">구분</p><p class="data">회원 주문:필수 - 배송정보</p></li>
												<li><p class="title">수집항목</p><p class="data">성명,회원ID, 비밀번호, 생년월일, 휴대번호,이메일</p></li>
												<li><p class="title">이용목적</p><p class="data">서비스 이용</p></li>
											</ul>
										</div>
									</div>
									<!-- 모바일 끝 -->
								</td>
								<td class="t_layout_tc text_l">서비스 이용</td>
							</tr>
							<tr>
								<td class="t_layout_tc">결제정보</td>
								<td class="text_l">
									<p class="t_layout_b">카드번호, 계좌번호, 휴대폰번호</p>
									<!-- 모바일 시작 -->
									<div class="t_con_b">
										<div class="goods_cell_info">
											<ul class="other_list">
												<li><p class="title">구분</p><p class="data">회원 주문:필수 - 결제정보</p></li>
												<li><p class="title">수집항목</p><p class="data">카드번호, 계좌번호, 휴대폰번호</p></li>
												<li><p class="title">이용목적</p><p class="data">서비스 이용</p></li>
											</ul>
										</div>
									</div>
									<!-- 모바일 끝 -->
								</td>
								<td class="t_layout_tc text_l">서비스 이용</td>
							</tr>
							<tr>
								<td rowspan="2" class="t_layout_tc">기타 : 선택항목</td>
								<td class="t_layout_tc">증빙서류</td>
								<td class="text_l">
									<p class="t_layout_b">휴대폰번호</p>
									<!-- 모바일 시작 -->
									<div class="t_con_b">
										<div class="goods_cell_info">
											<ul class="other_list">
												<li><p class="title">구분</p><p class="data">회원 기타:선택항목 - 증빙서류</p></li>
												<li><p class="title">수집항목</p><p class="data">휴대폰번호</p></li>
												<li><p class="title">이용목적</p><p class="data">현금영수증</p></li>
											</ul>
										</div>
									</div>
									<!-- 모바일 끝 -->
								</td>
								<td class="t_layout_tc text_l">현금영수증</td>
							</tr>
							<tr>
								<td class="t_layout_tc">광고수신동의</td>
								<td class="text_l">
									<p class="t_layout_b">이메일, 휴대폰번호</p>
									<!-- 모바일 시작 -->
									<div class="t_con_b">
										<div class="goods_cell_info">
											<ul class="other_list">
												<li><p class="title">구분</p><p class="data">회원 기타:선택항목 - 광고수신동의</p></li>
												<li><p class="title">수집항목</p><p class="data">이메일, 휴대폰번호</p></li>
												<li><p class="title">이용목적</p><p class="data">상품 및 서비스 안내</p></li>
											</ul>
										</div>
									</div>
									<!-- 모바일 끝 -->
								</td>
								<td class="t_layout_tc text_l">상품 및 서비스 안내</td>
							</tr>
							<tr>
								<td rowspan="3"  class="t_layout_tc">비회원</td>
								<td rowspan="3"  class="t_layout_tc">주문</td>
								<td  class="t_layout_tc">로그인</td>
								<td class="text_l">
									<p class="t_layout_b">이메일, 휴대폰번호,성명</p>
									<!-- 모바일 시작 -->
									<div class="t_con_b">
										<div class="goods_cell_info">
											<ul class="other_list">
												<li><p class="title">구분</p><p class="data">비회원 주문 - 로그인</p></li>
												<li><p class="title">수집항목</p><p class="data">이메일, 휴대폰번호,성명</p></li>
												<li><p class="title">이용목적</p><p class="data">서비스 이용</p></li>
											</ul>
										</div>
									</div>
									<!-- 모바일 끝 -->
								</td>
								<td class="t_layout_tc text_l">서비스이용</td>
							</tr>
							<tr>
								<td class="t_layout_tc">배송정보</td>
								<td class="text_l">
									<p class="t_layout_b">주문자/수취인 성명, 연락처,이메일, 배송지 주소</p>
									<!-- 모바일 시작 -->
									<div class="t_con_b">
										<div class="goods_cell_info">
											<ul class="other_list">
												<li><p class="title">구분</p><p class="data">비회원 주문 - 배송정보</p></li>
												<li><p class="title">수집항목</p><p class="data">주문자/수취인 성명, 연락처,이메일, 배송지 주소</p></li>
												<li><p class="title">이용목적</p><p class="data">상품 배송</p></li>
											</ul>
										</div>
									</div>
									<!-- 모바일 끝 -->
								</td>
								<td class="t_layout_tc text_l">상품 배송</td>
							</tr>
							<tr>
								<td class="t_layout_tc">결제정보</td>
								<td class="text_l">
									<p class="t_layout_b">결제정보</p>
									<!-- 모바일 시작 -->
									<div class="t_con_b">
										<div class="goods_cell_info">
											<ul class="other_list">
												<li><p class="title">구분</p><p class="data">비회원 주문 - 결제정보</p></li>
												<li><p class="title">수집항목</p><p class="data">결제정보</p></li>
												<li><p class="title">이용목적</p><p class="data">주문 상품 결제</p></li>
											</ul>
										</div>
									</div>
									<!-- 모바일 끝 -->
								</td>
								<td class="t_layout_tc text_l">주문 상품 결제</td>
							</tr>
						</tbody>
					</table>
					<p class="t_con_b">- 회원가입 및 서비스 이용 시 수집하는 개인정보의 보유기간은 법정 의무 보유기간 또는 회원탈퇴 시</p>
					<p class="terms_cont"><br/>② 서비스 이용과정이나 사업 처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.<br />
					- 최근 접속일, 접속 IP 정보, 쿠키, 구매로그, 이벤트로그<br />
					- 회원가입 시 회원이 원하시는 경우에 한하여 추가 정보를 선택, 제공하실 수 있도록 되어있으며, 일부 재화 또는 용역 상품에 대한 주문 및 접수 시 회원이 원하는 정확한 주문 내용 파악을 통한 원활한 주문 및 결제, 배송을 위하여 추가적인 정보를 요구하고 있습니다.<br />
					③ 당사는 다음과 같은 방법으로 개인정보를 수집합니다.<br />
					- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청<br />
					- 협력회사로부터의 제공<br />
					- 로그 분석 프로그램을 통한 생성정보 수집<br />
					④ 개인정보 수집에 대한 동의<br />
					- 당사는 개인정보취급방침 및 이용약관의 내용에 대해  [동의한다]버튼 또는 [동의하지 않는다]버튼을 클릭할 수 있는 절차를 마련하여, [동의한다]버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.<br />
					⑤ 비회원의 개인정보보호<br />
					당사는 비회원 주문의 경우에도 배송, 대금결제, 주문내역 조회 및 구매확인, 실명여부 확인을 위하여 필요한 개인정보만을 요청하고 있으며, 이 경우 그 정보는 대금결제 및 상품의 배송에 관련된 용도 이외에는 다른 어떠한 용도로도 사용되지 않습니다.</p>
				</div>

				<p class="terms_title">3조 (개인정보의 수집 및 이용 목적)</p>
				<p class="terms_cont">
					① 당사는 서비스 제공을 위하여 필요한 최소한의 범위 내에서 다음 각 항목과 같은 목적으로 개인정보를 수집하고 있습니다.<br />
					- 당사가 제공하는 회원제 서비스에 따른 본인 확인 절차에 활용<br />
					- 포인트 적립 및 사용, 정산, 회원센터 운영 등<br />
					- 물품 및 서비스 상품에 대한 주문 및 접수, 대금 결제, 주문상품 배송 및 회원에 대한 각종 편의 서비스 제공<br />
					- 경품 및 물품 배송에 대한 정확한 배송지 확보<br />
					- 당사가 제공하는 서비스 및 이벤트 정보 제공(SMS/전자우편(E-mail)/TM 등)<br />
					- 당사의 제휴행사 및 서비스 홍보를 위한 마케팅 자료 활용<br />
					- 공지/불만처리 등을 위한 원활한 의사소통의 경로 확보<br />
					- 업무와 관련된 통계자료 작성 및 서비스 개발
				</p>

				<p class="terms_title">4조 개인정보 제공 및 공유</p>
				<p class="terms_cont">
					① 당사는 회원의 개인정보를 ‘2조(수집하는 개인정보 항목 및 방법)’ 와 3조 (개인정보의 수집 및 이용 목적)에서 고지한 범위내에서 사용하며, 동 범위를 초과하여 이용하거나 타인 또는 타기업,기관에 제공하지 않습니다. 특히 다음의 경우는 주의를 기울여 개인정보를 이용 및 제공할 것입니다.<br />
					- 제휴관계<br />
					보다 나은 서비스 제공을 위하여 회원의 개인정보를 제휴사에게 제공하거나 제휴사와 공유할 수 있으며, 이러한 경우에는 사전에 회원에게 제공받거나 공유하는 자가 누구이며 주된 사업이 무엇인지, 제공 또는 공유되는 개인정보항목이 무엇인지, 개인정보를 제 공하거나 공유하는 목적이 무엇인지, 언제까지 어떻게 보호 및 관리 되는지에 대해 개별적으로 전자우편 또는 서면을 통해 고지한 후 이에 대한 동의를 구합니다.<br />
					회원께서 동의하지 않는 경우에는 제휴사에게 제공하거나 제휴사와 공유하지 않으며, 제휴 관계에 변화가 있거나 제휴 관계가 종결될 경우에도 동일한 절차에 의하여 고지하거나 동의를 구합니다.<br />
					- 위탁처리<br />
					회원과의 계약을 이행하기 위해 이용자의 개인정보를 위탁 처리할 경우 반드시 사전에 위탁처리 업체명과 업무위탁 목적 등에 대해 상세하게 고지합니다.<br />
					위탁 처리는 회원과의 계약을 이행하기 위해 반드시 위탁업체에 개인정보를 제공해야 하며, ‘전자상거래소비자보호법’ 등에 의한 근거가 있습니다. <br />
					따라서 위탁업체에 개인정보를 제공하는 것을 거부하는 경우에는 당사의 서비스를 제공받지 못할 수 있습니다.<br />
					단, 재화 또는 용역을 홍보하거나 판매를 권유하는 업무를 위탁하는 경우에는 서면,전자우편,모사전송,휴대전화 문자전송 등의 방법으로 위탁하는 업무의 내용과 수탁자를 알려드립니다.<br />
					- 매각/인수합병<br />
					매각이나 인수합병 등에 의하여 개인정보가 다른 사업자에게 승계/이전되는 경우 반드시 사전에 정당한 사유와 절차에 대해 상세하게 고지할 것이며 이용자의 개인정보에 대한 동의 철회의 선택권을 부여합니다.<br />
					② 고지 및 동의방법은 온라인 홈페이지 초기화면의 공지사항을 통해 고지 및 동의 받거나 이메일 등을 이용하여 개별적으로 고지 및 동의 받을 수 있습니다.<br />
					③ 다음은 예외로 합니다.<br />
					1. 이용자로부터 별도의 동의를 받은 경우<br />
					2. 관계법령에 의하여 수사상의 목적으로 관계기관으로부터의 요구가 있을 경우<br />
					3. 통계작성, 학술연구나 시장조사를 위하여 특정 개인을 식별할 수 없는 형태로 광고주, 협력사나 연구단체 등에 제공하는 경우 등
				</p>

				<p class="terms_title">5조 (개인정보의 위탁처리)</p>
				<div class="terms_cont">
					① 당사는 서비스 향상을 위해서 회원의 개인정보를 외부에 수집/취급관리 등을 위탁하여 처리할 수 있으며, 관련 법령의 규정에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 규정하고 있습니다.<br />
					- 수탁자, 수탁범위 등에 관한 사항을 서면, 전자우편, 전화 또는 홈페이지를 통해 게시<br />
					- 위탁계약 시 서비스제공자의 개인정보보호 관련 지시엄수, 개인정보에 관한 비밀유지, 제3자 제공의 금지 및 사고시의 책임부담, 위탁기간, 처리 종료후의 개인정보의 반환 또는 파기 등을 규정하고 당해 계약내용을 서면 또는 전자적으로 보관
					<table class="list">
						<caption>1:1문의 리스트</caption>
						<colgroup>
							<col style="width:auto">
							<col style="width:auto">
						</colgroup>
						<thead>
							<tr>
								<th>수탁자</th>
								<th>수탁범위</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>API STORE</td>
								<td>알림톡 및 SMS 전송</td>
							</tr>
							<tr>
								<td>비즈메일러</td>
								<td>상품 및 서비스 정보 이메일 발송</td>
							</tr>
							<tr>
								<td>입점 업체</td>
								<td>주문확인 및 배송,교환/반품 처리</td>
							</tr>
							<tr>
								<td>KCP</td>
								<td>상품 구매에 필요한 신용카드, 현금결제, 전자금융거래 수단 등의 결제정보 전송</td>
							</tr>
							<tr>
								<td>택배사<br />(CJ대한통운, 경동택배, 롯데택배, 로젠택배, 우체국등기, 우체국택배,<br/>천일택배, 편의점택배, 한진택배, GTX로직스, KG로직스 외 기타)</td>
								<td>상품배송 및 배송위치 확인 서비스 제공</td>
							</tr>
						</tbody>
					</table>
				</div>


				<p class="terms_title">6조 (개인정보의 보유, 이용기간 및 파기)</p>
				<p class="terms_cont">
				① 당사에서 제공하는 서비스를 받는 동안 회원님의 개인정보는 계속 보유하며 서비스제공을 위해 이용하게 됩니다.<br />
				단, 회원님의 개인정보는 수집목적 또는 제공받은 목적이 달성되거나, 당사 이용약관에 표명한 절차에 따라 탈퇴를 요청한 경우, 지체 없이 파기합니다.<br />
				- 회원가입 정보 : 회원탈퇴를 요청한 시점으로 30일 내<br />
				- 배송정보 : 물품 또는 서비스가 인도되거나 제공된 때<br />
				- 설문조사, 이벤트 등의 목적을 위하여 수집한 경우 : 당해 설문조사, 이벤트 등을 종료한 때<br />
				- 본인확인정보 : 본인임을 확인 한 때<br />
				단, 상법 등 관련법령의 규정 및 내부 방침에 의하여 다음과 같이 거래 관련 관리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다.<br />
				- 계약 또는 청약철회 등에 관한 기록 : 5년<br />
				- 대금결제 및 재화 등의 공급에 관한 기록 : 5년<br />
				- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br />
				- 컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료 : 3개월<br />
				② 개인정보 파기방법은 아래와 같습니다.<br />
				- 전자적 파일형태로 저장된 개인정보: 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제<br />
				- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기<br />
				③ 당사는 [정보통신망 이용촉진 및 정보보호 등에 관한 법률: 제29조 제2항]에 따라 12개월간 이용내역(로그인, 주문, 상담 등)이 없는 회원의 개인정보를 다른 회원의 개인정보와 분리하여 별도로 저장 관리합니다. 회사는 분리 저장된 개인정보를 법정보관기간 경과 후 파기하며, 이에 따라 회원은 회원자격을 상실 할 수 있습니다. 또한, 분리보관 30일 전까지 개인정보가 분리되어 저장 관리되는 사실과 기간 만료 일 및 해당 개인정보의 항목을 전자우편 서면 모사전송 전화 또는 이와 유사한 방법 중 어느 하나의 방법으로 회원에게 알립니다.<br />
				- 별도 관리의 경우 정보의 이용, 사용 자체를 금지합니다.<br />
				- 유효기간은 회원이 1년, 평생회원 중 선택가능하며 선택하지 않을 시 1년 기준으로 합니다.<br />
				④ 비회원의 경우에도 주문 관련 정보는 교환이나 환불, CS의 원활한 처리를 위해 법정보유기간동안 보관됩니다.
				</p>


				<p class="terms_title">7조 (개인정보의 열람.정정)</p>
				<p class="terms_cont">
				① 회원께서는 언제든지 등록되어 있는 회원의 개인정보를 열람하거나 정정하실 수 있습니다.<br />
				- 홈페이지 로그인 후 [회원정보수정] 를 통해 직접 열람 또는 정정 할 수 있으며<br />
				- 개인정보관리책임자 및 담당자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다<br />
				② 회원께서 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다.<br />
				또한 잘못된 개인정보를 제3자에게 이미 제공한    경우에는 정정 처리 결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 조치하겠습니다.
				</p>


				<p class="terms_title">8조 (개인정보 수집 이용, 제공에 대한 동의철회)</p>
				<p class="terms_cont">
				① 회원가입 시 [개인정보의 수집, 이용, 제공] 동의하신 내용은 회원께서 언제든지 철회하실 수 있습니다.<br />
				동의철회는 홈페이지 로그인 후 [회원정보수정] 또는 [회원탈퇴]를 통해 가능하며 개인정보관리책임자에게 서면, 전화, 이메일 등으로 연락하시면 본인 확인 후 즉시 개인정보의 삭제 등 필요한 조치를 하겠습니다.<br />
				동의 철회를 하고 개인정보를 파기하는 등의 조치를 취한 경우에는 그 사실을 회원께 지체 없이 통지하도록 하겠습니다.
				</p>

				<p class="terms_title">9조 (개인정보의 기술적, 관리적 보호대책)</p>
				<p class="terms_cont">
				① 기술적 대책<br />
				- 당사는 불법적인 해킹방지를 위해 자체 첨단 방화벽을 설치하여 운영하고 있습니다.<br />
				- 회원님의 개인정보는 법에서 정하는 기준에 따라 암호화되어 저장•관리되고 있으며, 또한 파일 및 전송 데이터는 암호화 되어 사용하고 있습니다.<br />
				- 회사는 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한 접근을 통제하고 있습니다.<br />
				② 관리적 대책<br />
				-  당사는 회원의 개인정보에 대한 접근권한을 최소한의 인원으로 제한하고 있습니다. 그 최소한의 인원에 해당하는 자는 다음과 같습니다.<br />
				(1) 이용자를 직접 상대로 하여 마케팅 업무를 수행하는 자<br />
				(2) 개인정보관리책임자 및 담당자 등 개인정보관리업무를 수행하는 자<br />
				(3) 기타 업무상 개인정보의 취급이 불가피한 자<br />
				-  개인정보를 취급하는 인원에 대하여 개인정보보호를 위한 정기적인 교육 및 외부 위탁교육을 실시하고 있습니다.<br />
				- 이용자의 실수 또는 당사의 귀책사유가 없는 인터넷 상의 위험성으로 인하여 발생한 일들에 대하여 당사는 책임을 지지 않으므로 회원의 아이디와 비밀번호가 타인에게 알려지지 않도록 적절하게 관리하여야 합니다.
				</p>

				<p class="terms_title">10조 (링크사이트)</p>
				<p class="terms_cont">
				당사는 회원께 다른 회사의 웹사이트 또는 자료에 대한 링크를 제공할 수 있습니다 .<br />
				이 경우 당사는 외부사이트 및 자료에 대한 아무런 통제권이 없으므로 그로부터 제공받은 서비스나 자료의 유용성에 대해 책임질 수 없으며 보증할 수 없습니다.<br />
				당사가 포함하고 있는 링크를 통해 타 사이트의 페이지로 옮겨갈 경우 해당 사이트의 개인정보취급방침은 당사와 무관하므로 새로 방문한 사이트의 정책을 검토해 보시기 바랍니다.
				</p>

				<p class="terms_title">11조 (게시물)</p>
				<p class="terms_cont">
				① 당사는 회원의 게시물을 소중하게 생각하며 변조,훼손,삭제되지 않도록 최선을 다하여 보호 합니다. 그러나 다음의 경우는 그렇지 아니합니다.<br />
				- 타인을 비방할 목적으로 허위 사실을 유포하여 타인의 명예를 훼손하는 글<br />
				- 동의 없는 타인의 신상공개 당사의 저작권, 제 3자의 저작권 등 권리를 침해하는 내용, 기타 게시판 주제와 다른 내용의 게시물<br />
				- 공공질서 및 미풍양속에 위반되는 내용일 경우<br />
				- "회사"의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우<br />
				- "회사"가 제공하는 "서비스" 기타 영업행위의 원활한 진행을 방해하는 것으로 판단되는 경우<br />
				-  그 외의 경우 명시적 또는 개별적인 경고 후 삭제 조치할 수 있습니다. (예: 욕설, 스팸성 게시물)<br />
				② 근본적으로 게시물에 관련된 제반 권리와 책임은 작성자 개인에게 있습니다.<br />
				또 게시물을 통해 자발적으로 공개된 정보는 보호받기 어려우므로 정보 공개 전에 심사숙고 하시기 바랍니다.
				</p>


				<p class="terms_title">12조 (이용자의 권리와 의무)</p>
				<p class="terms_cont">
				① 회원의 개인정보를 최신의 상태로 정확하게 입력하여 불의의 사고를 예방해 주시기 바랍니다. 이용자가 입력한 부정확한 정보로 인해 발생하는 사고의 책임은 이용자 자신에게 있으며 타인 정보의 도용 등 허위정보를 입력할 경우 회원자격이 상실될 수 있습니다.<br />
				② 회원께서는 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 비밀번호를 포함한 회원의 개인정보가 유출되지 않도록 조심하시고 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해 주십시오.<br />
				만약 이 같은 책임을 다하지 못하고 타인의 정보 및 존엄성을 훼손할 시에는[정보통신망 이용촉진 및 정보 보호등에 관한 법률]등에 의해 처벌 받을 수 있습니다.
				</p>

				<p class="terms_title">13조 (개인정보 관리 책임자)</p>
				<p class="terms_cont">
				① 고객 개인정보 보호 책임자 및 담당자는 다음과 같으며 개인정보 관련 문의사항에 신속하고 성실하게 답변해드리겠습니다.<br />
				-단, 기술적인 보완조치를 했음에도 불구하고 해킹 등 기본적인 네트워크상의 위험성에 의해 발생하는 예기치 못한 사고로 인한 정보의 훼손 및 방문자가 작성한 게시물에 의한 각종 분쟁에 관해서는 책임이 없습니다.<br />
				개인정보 관리 책임자 성명 : 정진우<br />
				전화번호 : 02-547-0660<br />
				전자우편 : cs@ssampic.com<br />
				근무시간 : 평일 오전 9시 ~오후 6시
				</p>

				<p class="terms_title">14조 (의견수렴 및 불만처리)</p>
				<p class="terms_cont">
				① 당사는 회원의 의견을 소중하게 생각하며, 회원께서는 의문사항으로부터 언제나 성실한 답변을 받을 권리가 있습니다.<br />
				② 당사는 회원과의 원활한 의사소통을 위해 민원처리센터를 운영하고 있으며 연락처는 다음과 같습니다.<br />
				민원처리센터<br />
				전자우편 : cs@ssampic.com<br />
				전화번호 : 02-547-0660<br />
				근무시간 : 평일 오전 9시 ~오후 6시<br />
				③ 전화상담은 평일 오전 09:00 ~ 18:00, 토요일/일요일/공휴일은 1:1문의를 이용해주시기 바랍니다.<br />
				④ 전자우편이나 팩스 및 우편을 이용한 상담은 접수 후 24시간 내에 성실하게 답변 드리겠습니다.<br />
				다만, 근무시간 이후 또는 주말 및 공휴일에는 익일 처리하는 것을 원칙으로 합니다.<br />
				⑤ 기타 개인정보에 관한 상담이 필요한 경우에는 개인정보침해신고센터, 대검찰청 사이버수사과, 경찰청 사이버안전국 등으로 문의하실 수 있습니다.<br />
				개인정보침해신고센터<br />
				- 전화 : (국번없이) 118<br />
				- URL : <a href="http://www.118.or.kr" target="_blank">http://www.118.or.kr</a><br />
				대검찰청 사이버수사과<br />
				- 전화 : 02-3480-3571<br />
				- URL : <a href="http://www.spo.go.kr" target="_blank">http://www.spo.go.kr</a><br />
				경찰청 사이버안전국<br />
				- 전화 : (경찰청 대표) 182<br />
				URL : <a href="http://cyberbureau.police.go.kr" target="_blank">http://cyberbureau.police.go.kr</a>
				</p>

				<p class="terms_title">15조 (정책변경에 따른 공지의무)</p>
				<p class="terms_cont">
				본 개인정보취급방침은 정부의 정책 또는 보안기술의 변경에 따라 내용의 추가, 삭제 및 수정이 있을 수 있으며, 이 경우 홈페이지 ‘공지사항'란을 통해 고지할 것입니다.
				<br/>
				본 방침은 2020년 2월 1일부터 시행됩니다.</p>
			</div>



		</section>
	
	</main>
 <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>