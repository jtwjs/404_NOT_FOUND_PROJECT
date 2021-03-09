
## [이웃# (농수산물 직거래 사이트)](https://github.com/jtwjs/neighborhoodShop-spring-backnd)(2020)
`#Java` `#Spring` `#Oracle` `#Spring security` `#MyBatis`

![neighborhood](https://user-images.githubusercontent.com/60641307/108695215-5e487e80-7543-11eb-8b7c-63fdd637519b.gif)



### 요약
'이웃#'은 지역 특산품을 사고파는 직거래 사이트로 현재 각 지역의 농산물을 구입하고싶으면

판매자와 개별적으로 연락하거나 해당하는 지역 조합 사이트 접속해야 구매가 가능한 인프라로 인해

국내에서 양질의 상품이 생산되어도 구매자들이 지역 특산물에 대한 정보가 부족하면 거래를 하지 못한다는 문제점을 인지하고 

지역 특산농수산물을 공급하는 소상인 및 조합과 소비자의 거리를 좁힐 수있게

다양한 지역의 특산품을 한 사이트에서 거래할수 있는 쇼핑몰을 개발하게 되었습니다.

### 개발환경
![그림01](https://user-images.githubusercontent.com/60641307/108470206-f25ce080-72cc-11eb-910c-d8a647113b00.png)

### 기능구현
![그림02](https://user-images.githubusercontent.com/60641307/108470241-01439300-72cd-11eb-8874-be1735aeae45.png)

### 맡은 기능
- 메인페이지
  - 바닐라 자바스크립트와 CSS 애니메이션을 통해 슬라이드 구현
  - 전반적인 디자인 구현
- 회원가입 & 로그인 페이지
  - Spring Security를 통한 로그인&세션 기능
  - 판매자/구매자/관리자 로그인 구분
  - 비밀번호 암호화와 csrf 방어 토큰 적용
  - 회원구분에 따른 권한을 부여 후 접근페이지 설정
- 마이페이지
  - 등급관리, 적립금관리, 찜목록, 상품후기, 등록상품관리 등
- 결제페이지
  - 카카오 페이 API를 활용한 결제기능
- 상품페이지
  - cookie를 이용해 최근본 상품 구현
### [시연영상 보러가기](https://www.youtube.com/watch?v=2t-2IaTXMVM)
